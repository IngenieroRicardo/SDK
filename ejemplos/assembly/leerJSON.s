	.file	"leerJSON.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.ascii	"{\"nombre\":\"Juan\", \"edad\":30, \"direccion\": {\"pais\":"
	.ascii	"\"Villa Lactea\",\"departamento\":\"Tierra\""
	.string	"}, \"documentos\": [\"B00000001\",\"00000000-1\"], \"foto\":\"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC\" }"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"JSON v\303\241lido: %s\n"
.LC2:
	.string	"nombre"
.LC3:
	.string	"direccion.pais"
.LC4:
	.string	"documentos.0"
.LC5:
	.string	"Nombre: %s\n"
.LC6:
	.string	"Pa\303\255s: %s\n"
.LC7:
	.string	"Primer Documento: %s\n"
.LC8:
	.string	"Error: %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rbp
	movq	%rbp, %rsi
	addq	$-128, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	ParseJSON@PLT
	movl	8(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L2
	movq	(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	32(%rsp), %rdi
	leaq	.LC2(%rip), %rdx
	movq	%rbp, %rsi
	call	GetJSONValue@PLT
	leaq	64(%rsp), %rdi
	leaq	.LC3(%rip), %rdx
	movq	%rbp, %rsi
	call	GetJSONValueByPath@PLT
	leaq	96(%rsp), %rdi
	leaq	.LC4(%rip), %rdx
	movq	%rbp, %rsi
	call	GetJSONValueByPath@PLT
	movq	32(%rsp), %rdx
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	64(%rsp), %rdx
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	96(%rsp), %rdx
	leaq	.LC7(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	pushq	%rdx
	.cfi_def_cfa_offset 152
	pushq	24(%rsp)
	.cfi_def_cfa_offset 160
	pushq	24(%rsp)
	.cfi_def_cfa_offset 168
	pushq	24(%rsp)
	.cfi_def_cfa_offset 176
	call	FreeJsonResult@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 152
	pushq	56(%rsp)
	.cfi_def_cfa_offset 160
	pushq	56(%rsp)
	.cfi_def_cfa_offset 168
	pushq	56(%rsp)
	.cfi_def_cfa_offset 176
	call	FreeJsonResult@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 152
	pushq	88(%rsp)
	.cfi_def_cfa_offset 160
	pushq	88(%rsp)
	.cfi_def_cfa_offset 168
	pushq	88(%rsp)
	.cfi_def_cfa_offset 176
	call	FreeJsonResult@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 152
	pushq	120(%rsp)
	.cfi_def_cfa_offset 160
	pushq	120(%rsp)
	.cfi_def_cfa_offset 168
	pushq	120(%rsp)
	.cfi_def_cfa_offset 176
	call	FreeJsonResult@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	xorl	%eax, %eax
.L1:
	movq	120(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7
	subq	$-128, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movq	16(%rsp), %rdx
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	pushq	%rax
	.cfi_def_cfa_offset 152
	pushq	24(%rsp)
	.cfi_def_cfa_offset 160
	pushq	24(%rsp)
	.cfi_def_cfa_offset 168
	pushq	24(%rsp)
	.cfi_def_cfa_offset 176
	call	FreeJsonResult@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	movl	$1, %eax
	jmp	.L1
.L7:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	main, .-main
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
