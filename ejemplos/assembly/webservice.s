	.file	"webservice.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"User-Agent"
.LC1:
	.string	"\nreceived: %s %s %s\n %s\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"{\"message\":\"Hola Mundo C handler!\"}"
	.text
	.p2align 4
	.globl	basic_handler
	.type	basic_handler, @function
basic_handler:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	GetMethod@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	GetPath@PLT
	leaq	.LC0(%rip), %rsi
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	GetHeaderValue@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	GetBody@PLT
	movq	%rbx, %r8
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%rax, %r9
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$200, %edi
	leaq	.LC2(%rip), %rsi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	CreateResponse@PLT
	.cfi_endproc
.LFE67:
	.size	basic_handler, .-basic_handler
	.section	.rodata.str1.1
.LC3:
	.string	"/hola"
.LC4:
	.string	"/"
.LC5:
	.string	"8080"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB68:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	basic_handler@GOTPCREL(%rip), %rbp
	leaq	.LC3(%rip), %rdi
	movq	%rbp, %rsi
	call	RegisterHandler@PLT
	movq	%rbp, %rsi
	leaq	.LC4(%rip), %rdi
	call	RegisterHandler@PLT
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	leaq	.LC5(%rip), %rdi
	call	StartServer@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$1, %edi
	call	sleep@PLT
	jmp	.L5
	.cfi_endproc
.LFE68:
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
