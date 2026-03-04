const pendingFetches = new Map();
const routeToClient = new Map();
let defaultClientId = null;

self.addEventListener('message', event => {
    const { type, messageId, success, status, statusText, headers, body, error, path } = event.data;

    // Respuesta a peticiones fetch
    if (type === 'FETCH_RESPONSE' && pendingFetches.has(messageId)) {
        const { resolve, reject } = pendingFetches.get(messageId);
        pendingFetches.delete(messageId);
        if (success) {
            const response = new Response(body, { status, statusText, headers: new Headers(headers) });
            resolve(response);
        } else {
            reject(new Error(error));
        }
    }

    if (type === 'REGISTER_ROUTE') {
        const clientId = event.source.id;
        const path = event.data.path;
        const messageId = event.data.messageId;
        let previousClient = routeToClient.get(path);
        
        // Función para continuar después de verificar el cliente anterior
        const proceedWithRegistration = () => {
            if (previousClient === undefined) {
                // No hay dueño previo, asignamos
                routeToClient.set(path, clientId);
                event.source.postMessage({
                    type: 'ROUTE_REGISTERED',
                    path: path,
                    messageId: messageId,
                    overwritten: false,
                    previousClientId: null
                });
                console.log(`Ruta ${path} registrada con cliente ${clientId}`);
            } else {
                // Aún hay dueño activo, no sobrescribimos
                event.source.postMessage({
                    type: 'ROUTE_REGISTERED',
                    path: path,
                    messageId: messageId,
                    overwritten: true,
                    previousClientId: previousClient
                });
                console.log(`Ruta ${path} ya está registrada con cliente activo ${previousClient}, se intenta sobrescribe`);
            }
        };

        // Verificar si el cliente anterior sigue activo
        if (previousClient !== undefined) {
            self.clients.get(previousClient).then(client => {
                if (!client) {
                    // Cliente anterior ya no existe, podemos reasignar
                    previousClient = undefined;
                }
                proceedWithRegistration();
            }).catch(() => {
                // Error al obtener el cliente, asumimos que no existe
                previousClient = undefined;
                proceedWithRegistration();
            });
        } else {
            proceedWithRegistration();
        }
    }

    // Registro de cliente principal
    if (type === 'REGISTER_MAIN') {
        defaultClientId = event.source.id;
        console.log('Cliente principal registrado:', defaultClientId);
    }

    // Desregistro de cliente
    if (type === 'UNREGISTER_CLIENT') {
        const clientId = event.source.id;
        for (let [route, id] of routeToClient.entries()) {
            if (id === clientId) {
                routeToClient.delete(route);
                console.log(`Ruta ${route} desregistrada por cierre de cliente ${clientId}`);
            }
        }
        if (defaultClientId === clientId) {
            defaultClientId = null;
            console.log('Cliente principal desconectado');
        }
    }

    // Consulta de rutas
    if (type === 'GET_ROUTES') {
        const routesArray = Array.from(routeToClient.entries()).map(([path, clientId]) => ({ path, clientId }));
        event.source.postMessage({ type: 'ROUTE_MAP', routes: routesArray });
    }
});

self.addEventListener('fetch', event => {
    const url = new URL(event.request.url);
    if (!url.pathname.startsWith('/api/')) return;

    // Responder directamente a las peticiones OPTIONS (preflight)
    if (event.request.method === 'OPTIONS') {
        event.respondWith(new Response(null, {
            status: 204, // No Content
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type, Authorization, User-Agent',
                'Access-Control-Max-Age': '86400' // 24 horas
            }
        }));
        return;
    }

    event.respondWith(
        new Promise(async (resolve, reject) => {
            const messageId = crypto.randomUUID?.() || Date.now() + '-' + Math.random();
            pendingFetches.set(messageId, { resolve, reject });

            let clientId = routeToClient.get(url.pathname);
            if (!clientId) clientId = defaultClientId;
            if (!clientId) {
                pendingFetches.delete(messageId);
                reject(new Error('No hay handler para esta ruta'));
                return;
            }

            const client = await self.clients.get(clientId);
            if (!client) {
                // Limpiar rutas huérfanas
                for (let [route, id] of routeToClient.entries()) {
                    if (id === clientId) {
                        routeToClient.delete(route);
                    }
                }
                if (defaultClientId === clientId) {
                    defaultClientId = null;
                }
                pendingFetches.delete(messageId);
                reject(new Error('Cliente no encontrado'));
                return;
            }

            const request = event.request;
            const headers = {};
            request.headers.forEach((value, key) => { headers[key] = value; });
            let body = null;
            if (request.method !== 'GET' && request.method !== 'HEAD') {
                body = await request.clone().arrayBuffer();
            }

            client.postMessage({
                type: 'FETCH_FROM_SW',
                path: url.pathname,
                method: request.method,
                headers,
                body,
                messageId
            });

            setTimeout(() => {
                if (pendingFetches.has(messageId)) {
                    pendingFetches.delete(messageId);
                    reject(new Error('Timeout'));
                }
            }, 3600000); //Despues de 1 hora retorna error de Timeout
        })
    );
});

self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', event => event.waitUntil(self.clients.claim()));
