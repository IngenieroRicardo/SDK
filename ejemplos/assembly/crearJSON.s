	.file	"crearJSON.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"S\303\255"
.LC1:
	.string	"No"
.LC2:
	.string	"JSON vac\303\255o: %s\n"
.LC3:
	.string	"Juan P\303\251rez"
.LC4:
	.string	"nombre"
.LC6:
	.string	"edad"
.LC7:
	.string	"es_estudiante"
.LC8:
	.string	"\nPersona b\303\241sica:\n%s\n"
.LC9:
	.string	"Calle Principal 123"
.LC10:
	.string	"calle"
.LC11:
	.string	"Ciudad Ejemplo"
.LC12:
	.string	"ciudad"
.LC13:
	.string	"Espa\303\261a"
.LC14:
	.string	"pais"
.LC15:
	.string	"direccion"
.LC16:
	.string	"\"f\303\272tbol\""
.LC17:
	.string	"\"lectura\""
.LC18:
	.string	"\"programaci\303\263n\""
.LC19:
	.string	"pasatiempos"
.LC21:
	.string	"juan@ejemplo.com"
.LC22:
	.string	"correo"
.LC23:
	.string	"\nPersona actualizada:\n%s\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC24:
	.string	"\nPersona sin 'es_estudiante':\n%s\n"
	.section	.rodata.str1.1
.LC25:
	.string	"Soluciones Tecnol\303\263gicas"
.LC26:
	.string	"empresa"
.LC27:
	.string	"Desarrollador"
.LC28:
	.string	"puesto"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"\nPersona con informaci\303\263n laboral:\n%s\n"
	.section	.rodata.str1.1
.LC30:
	.string	"\n\302\277JSON v\303\241lido? %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC6(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC7(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	subq	$160, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	CreateEmptyJSON@PLT
	movq	(%rsp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	24(%rsp)
	.cfi_def_cfa_offset 224
	pushq	24(%rsp)
	.cfi_def_cfa_offset 232
	pushq	24(%rsp)
	.cfi_def_cfa_offset 240
	call	FreeJsonResult@PLT
	leaq	64(%rsp), %rbp
	xorl	%eax, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	movq	%rbp, %rdi
	leaq	64(%rsp), %r12
	call	CreateEmptyJSON@PLT
	movq	32(%rsp), %rsi
	movq	%rbp, %rdi
	leaq	.LC3(%rip), %rcx
	leaq	.LC4(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	32(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%r14, %rdx
	movsd	.LC5(%rip), %xmm0
	call	AddNumberToJSON@PLT
	movq	32(%rsp), %rsi
	xorl	%ecx, %ecx
	movq	%r13, %rdx
	movq	%rbp, %rdi
	call	AddBooleanToJSON@PLT
	movq	32(%rsp), %r15
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movq	%r15, %rdx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	CreateEmptyJSON@PLT
	movq	64(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC9(%rip), %rcx
	leaq	.LC10(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	64(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC11(%rip), %rcx
	leaq	.LC12(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	64(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC13(%rip), %rcx
	leaq	.LC14(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	64(%rsp), %rcx
	movq	%r15, %rsi
	movq	%rbp, %rdi
	leaq	.LC15(%rip), %rdx
	call	AddJSONToJSON@PLT
	movq	32(%rsp), %r15
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	88(%rsp)
	.cfi_def_cfa_offset 224
	pushq	88(%rsp)
	.cfi_def_cfa_offset 232
	pushq	88(%rsp)
	.cfi_def_cfa_offset 240
	call	FreeJsonResult@PLT
	leaq	128(%rsp), %r12
	xorl	%eax, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	movq	%r12, %rdi
	call	CreateEmptyArray@PLT
	movq	96(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC16(%rip), %rdx
	call	AddItemToArray@PLT
	movq	96(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC17(%rip), %rdx
	call	AddItemToArray@PLT
	movq	96(%rsp), %rsi
	movq	%r12, %rdi
	leaq	.LC18(%rip), %rdx
	call	AddItemToArray@PLT
	movq	96(%rsp), %rcx
	movq	%rbp, %rdi
	movq	%r15, %rsi
	leaq	.LC19(%rip), %rdx
	call	AddJSONToJSON@PLT
	movq	32(%rsp), %r12
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	pushq	120(%rsp)
	.cfi_def_cfa_offset 232
	pushq	120(%rsp)
	.cfi_def_cfa_offset 240
	call	FreeJsonResult@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movsd	.LC20(%rip), %xmm0
	movq	%r14, %rdx
	call	AddNumberToJSON@PLT
	movq	32(%rsp), %rsi
	movq	%rbp, %rdi
	leaq	.LC21(%rip), %rcx
	leaq	.LC22(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	32(%rsp), %r12
	leaq	.LC23(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movq	%r12, %rdx
	call	__printf_chk@PLT
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	RemoveKeyFromJSON@PLT
	movq	32(%rsp), %r13
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	128(%rsp), %r12
	leaq	.LC24(%rip), %rsi
	movq	%r13, %rdx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	CreateEmptyJSON@PLT
	movq	128(%rsp), %rsi
	leaq	.LC25(%rip), %rcx
	movq	%r12, %rdi
	leaq	.LC26(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	128(%rsp), %rsi
	leaq	.LC27(%rip), %rcx
	movq	%r12, %rdi
	leaq	.LC28(%rip), %rdx
	call	AddStringToJSON@PLT
	movq	128(%rsp), %rdx
	movq	%rbp, %rdi
	movq	%r13, %rsi
	call	MergeJSON@PLT
	movq	32(%rsp), %rbp
	leaq	.LC29(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movq	%rbp, %rdx
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	152(%rsp)
	.cfi_def_cfa_offset 224
	pushq	152(%rsp)
	.cfi_def_cfa_offset 232
	pushq	152(%rsp)
	.cfi_def_cfa_offset 240
	call	FreeJsonResult@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	movq	%rbp, %rdi
	call	IsValidJSON@PLT
	leaq	.LC0(%rip), %rdx
	movl	$1, %edi
	leaq	.LC30(%rip), %rsi
	testl	%eax, %eax
	leaq	.LC1(%rip), %rax
	cmove	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	pushq	56(%rsp)
	.cfi_def_cfa_offset 224
	pushq	56(%rsp)
	.cfi_def_cfa_offset 232
	pushq	56(%rsp)
	.cfi_def_cfa_offset 240
	call	FreeJsonResult@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 208
	movq	152(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	addq	$160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1077805056
	.align 8
.LC20:
	.long	0
	.long	1077870592
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
