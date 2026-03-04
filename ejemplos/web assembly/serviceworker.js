// STORE global (objeto simple para Brython Runner)
const hangerStore = {};

// Mapa de rutas y sus handlers
const routes = new Map();

/**
 * Registra un handler para una ruta específica.
 * @param {string} path - Ruta a registrar (ej. '/api/prueba')
 * @param {Function} handler - Función que recibe un objeto Request y devuelve una Response o Promise<Response>
 */
window.registerRoute = (path, handler) => {
    if (typeof path !== 'string') {
        throw new Error('El path debe ser un string');
    }
    if (typeof handler !== 'function') {
        throw new Error('El handler debe ser una función');
    }
    // Almacena el handler localmente
    routes.set(path, handler);

    // Notifica al service worker que esta ventana manejará esta ruta
    if (navigator.serviceWorker.controller) {
        navigator.serviceWorker.controller.postMessage({
            type: 'REGISTER_ROUTE',
            path: path,
            messageId: crypto.randomUUID?.() || Date.now() + '-' + Math.random()
        });
    } else {
        // Si el SW aún no controla, esperamos a que esté listo
        navigator.serviceWorker.ready.then(reg => {
            reg.active.postMessage({
                type: 'REGISTER_ROUTE',
                path: path,
                messageId: crypto.randomUUID?.() || Date.now() + '-' + Math.random()
            });
        });
    }
};

/**
 * Función llamada desde el evento 'FETCH_FROM_SW' para manejar la petición.
 * @param {string} path - Ruta solicitada
 * @param {Request} request - Objeto Request original
 * @returns {Promise<Response>} - Respuesta del handler o error 404
 */
window.dispatchFetch = (path, request) => {
    return new Promise((resolve, reject) => {
        const handler = routes.get(path);
        if (!handler) {
            // Simula el mismo comportamiento que en Go: rechaza con una Response 404
            const notFound = new Response('Ruta no encontrada', {
                status: 404,
                statusText: 'Not Found'
            });
            reject(notFound);
            return;
        }
        try {
            // Ejecuta el handler y espera su resultado (puede ser síncrono o Promise)
            Promise.resolve(handler(request)).then(resolve).catch(reject);
        } catch (error) {
            reject(error);
        }
    });
};

// Opcional: registrar el cliente principal automáticamente cuando el SW esté listo
navigator.serviceWorker.ready.then(reg => {
    reg.active.postMessage({ type: 'REGISTER_MAIN' });
});

// Escuchar mensajes del service worker (FETCH_FROM_SW) y responder usando dispatchFetch
navigator.serviceWorker.addEventListener('message', async event => {
    const { type, path, method, headers, body, messageId } = event.data;
    if (type === 'FETCH_FROM_SW') {
        try {
            // Reconstruir el Request original (opcional, pero útil para el handler)
            const requestInit = { method, headers };
            if (body) requestInit.body = body;
            const request = new Request(path, requestInit);

            // Llamar a dispatchFetch
            const response = await window.dispatchFetch(path, request);
            const clonedResponse = response.clone();
            const responseBody = await clonedResponse.arrayBuffer();
            const responseHeaders = {};
            clonedResponse.headers.forEach((value, key) => { responseHeaders[key] = value; });

            // Enviar respuesta al service worker
            event.source.postMessage({
                type: 'FETCH_RESPONSE',
                messageId,
                success: true,
                status: clonedResponse.status,
                statusText: clonedResponse.statusText,
                headers: responseHeaders,
                body: responseBody
            });
        } catch (error) {
            // Si el error es una Response (como el 404), la enviamos
            if (error instanceof Response) {
                const clonedError = error.clone();
                const errorBody = await clonedError.arrayBuffer();
                const errorHeaders = {};
                clonedError.headers.forEach((value, key) => { errorHeaders[key] = value; });
                event.source.postMessage({
                    type: 'FETCH_RESPONSE',
                    messageId,
                    success: true, // Nota: en Go se manejaba como success true con status 404
                    status: clonedError.status,
                    statusText: clonedError.statusText,
                    headers: errorHeaders,
                    body: errorBody
                });
            } else {
                event.source.postMessage({
                    type: 'FETCH_RESPONSE',
                    messageId,
                    success: false,
                    error: error.message || 'Error interno'
                });
            }
        }
    }
});

if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/sw.js').then().catch();
}

// Enviar mensaje de desregistro al cerrar la ventana principal
window.addEventListener('beforeunload', () => {
    if (navigator.serviceWorker.controller) {
        navigator.serviceWorker.controller.postMessage({ type: 'UNREGISTER_CLIENT' });
    }
});












// TESTING
function demo() {
	const winbox = new WinBox("Funciones", { url: "/full.html", border: "0.3em", x: "100", y: "100", width: "300", height: "300" });
	winbox.addClass("no-resize");
	winbox.addClass("no-full");
	winbox.addClass("no-max");
}

/*
window.registerRoute('/api/hola', async (request) => {
    console.log('Handler JS ejecutándose para /api/hola', request);
    
    // Crear respuesta simple
    return new Response('¡Hola Mundo desde JavaScript!', {
        status: 200,
        headers: {
            'Content-Type': 'text/plain',
            'X-Powered-By': 'JavaScript/WebService'
        }
    });
});

fetch("/api/hola").then(res => res.text()).then(console.log);
*/
