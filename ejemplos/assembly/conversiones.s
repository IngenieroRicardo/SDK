	.file	"conversiones.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hola"
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
	movl	$4, %eax
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
	.section	.rodata.str1.1
.LC1:
	.string	"!"
.LC2:
	.string	"mundo"
.LC3:
	.string	" "
.LC4:
	.string	"Concat: %s\n"
.LC5:
	.string	"42"
.LC6:
	.string	"3.14159"
.LC8:
	.string	"Atoi: %d\n"
.LC9:
	.string	"Atof: %f\n"
.LC10:
	.string	"Itoa: %s\n"
.LC11:
	.string	"Ftoa: %s\n"
.LC12:
	.string	"hola"
.LC13:
	.string	"MUNDO"
.LC14:
	.string	"  spaces  "
.LC15:
	.string	"Upper: %s\n"
.LC16:
	.string	"Lower: %s\n"
.LC17:
	.string	"Trim: '%s'\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r8d, %r8d
	leaq	.LC1(%rip), %rcx
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC0(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	Concat.constprop.0
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC5(%rip), %rdi
	call	Atoi@PLT
	leaq	.LC6(%rip), %rdi
	movl	%eax, %r12d
	call	Atof@PLT
	movl	$123, %edi
	movsd	%xmm0, 8(%rsp)
	call	Itoa@PLT
	movsd	.LC7(%rip), %xmm0
	movl	$2, %edi
	movq	%rax, %r15
	call	Ftoa@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm1
	movl	$1, %edi
	leaq	.LC9(%rip), %rsi
	movl	$1, %eax
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%r15, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	call	__printf_chk@PLT
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC11(%rip), %rsi
	call	__printf_chk@PLT
	leaq	.LC12(%rip), %rdi
	call	ToUpperCase@PLT
	leaq	.LC13(%rip), %rdi
	movq	%rax, %r13
	call	ToLowerCase@PLT
	leaq	.LC14(%rip), %rdi
	movq	%rax, %r12
	call	Trim@PLT
	movq	%r13, %rdx
	movl	$1, %edi
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC16(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbp, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC17(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	FreeString@PLT
	movq	%r15, %rdi
	call	FreeString@PLT
	movq	%r14, %rdi
	call	FreeString@PLT
	movq	%r13, %rdi
	call	FreeString@PLT
	movq	%r12, %rdi
	call	FreeString@PLT
	movq	%rbp, %rdi
	call	FreeString@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
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
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	-266631570
	.long	1074340345
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
