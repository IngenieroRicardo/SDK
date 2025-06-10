	.file	"listar.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./"
	.text
	.p2align 4
	.type	Concat.constprop.0, @function
Concat.constprop.0:
.LFB53:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, 40(%rsp)
	leaq	32(%rsp), %rbx
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	112(%rsp), %rax
	movl	$8, (%rsp)
	movq	%rax, 8(%rsp)
	movl	$2, %eax
	movq	%rbx, 16(%rsp)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%eax, %edx
	addl	$8, %eax
	addq	%rbx, %rdx
	movl	%eax, (%rsp)
	movq	(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L4
.L18:
	call	strlen@PLT
.L5:
	addq	%rax, %rbp
	movl	(%rsp), %eax
	cmpl	$47, %eax
	jbe	.L17
	movq	8(%rsp), %rdx
	movq	(%rdx), %rdi
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	testq	%rdi, %rdi
	jne	.L18
.L4:
	leaq	1(%rbp), %rdi
	call	malloc@PLT
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1
	movb	$0, (%rax)
	leaq	112(%rsp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%eax, %edx
	addq	16(%rsp), %rdx
	addl	$8, %eax
	movq	(%rdx), %rsi
	movl	%eax, (%rsp)
	testq	%rsi, %rsi
	je	.L1
.L9:
	movq	%r8, %rdi
	call	strcat@PLT
	movq	%rax, %r8
	movl	(%rsp), %eax
	cmpl	$47, %eax
	jbe	.L19
	movq	8(%rsp), %rdx
	movq	(%rdx), %rsi
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	testq	%rsi, %rsi
	jne	.L9
.L1:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	Concat.constprop.0, .-Concat.constprop.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Archivos en el directorio '%s':\n"
	.section	.rodata.str1.1
.LC2:
	.string	"- %s\n"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error al leer el directorio o directorio vac\303\255o"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%esi, %esi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	Concat.constprop.0
	movq	%rax, %rdi
	movq	%rax, %r13
	call	ListFiles@PLT
	testq	%rax, %rax
	je	.L22
	movq	%rax, %r12
	movq	%r13, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	(%r12), %rdx
	testq	%rdx, %rdx
	je	.L23
	leaq	8(%r12), %rbx
	leaq	.LC2(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%rbp, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	movq	-8(%rbx), %rdx
	testq	%rdx, %rdx
	jne	.L24
.L23:
	movq	%r12, %rdi
	call	FreeListFiles@PLT
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L25
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
