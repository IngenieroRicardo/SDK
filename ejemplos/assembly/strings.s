	.file	"strings.c"
	.text
	.p2align 4
	.type	Concat, @function
Concat:
.LFB51:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, 40(%rsp)
	leaq	32(%rsp), %rbp
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
	movq	%rbp, 16(%rsp)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%eax, %edx
	addl	$8, %eax
	addq	%rbp, %rdx
	movl	%eax, (%rsp)
	movq	(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L17
.L4:
	call	strlen@PLT
	addq	%rax, %rbx
	movl	(%rsp), %eax
	cmpl	$47, %eax
	jbe	.L18
	movq	8(%rsp), %rdx
	movq	(%rdx), %rdi
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	testq	%rdi, %rdi
	jne	.L4
.L17:
	leaq	1(%rbx), %rdi
	call	malloc@PLT
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L1
	movb	$0, (%rax)
	leaq	112(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%eax, %edx
	addq	16(%rsp), %rdx
	addl	$8, %eax
	movq	(%rdx), %r12
	movl	%eax, (%rsp)
	testq	%r12, %r12
	je	.L1
.L8:
	movq	%r8, %rdi
	movq	%r12, %rsi
	call	strcat@PLT
	movq	%rax, %r8
	movl	(%rsp), %eax
	cmpl	$47, %eax
	jbe	.L19
	movq	8(%rsp), %rdx
	movq	(%rdx), %r12
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	testq	%r12, %r12
	jne	.L8
.L1:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	Concat, .-Concat
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Primero"
.LC1:
	.string	"Segundo"
.LC2:
	.string	"Tercero"
.LC3:
	.string	"Array size: %d\n"
.LC4:
	.string	"Joined: %s\n"
.LC5:
	.string	","
.LC6:
	.string	"uno,dos,tres"
.LC7:
	.string	"Part %d: %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$3, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	NewStringArray@PLT
	xorl	%esi, %esi
	leaq	.LC0(%rip), %rdi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	Concat
	xorl	%esi, %esi
	leaq	.LC1(%rip), %rdi
	movq	%rax, (%r12)
	xorl	%eax, %eax
	call	Concat
	xorl	%esi, %esi
	leaq	.LC2(%rip), %rdi
	movq	%rax, 8(%r12)
	xorl	%eax, %eax
	call	Concat
	movq	%r12, %rdi
	movq	%rax, 16(%r12)
	call	GetStringArraySize@PLT
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	ConcatAll@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	movq	%rax, %r14
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC5(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	Split@PLT
	movq	(%rax), %rcx
	movq	%rax, %rbp
	testq	%rcx, %rcx
	je	.L22
	xorl	%ebx, %ebx
	leaq	.LC7(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%ebx, %edx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
	movq	0(%rbp,%rbx,8), %rcx
	testq	%rcx, %rcx
	jne	.L23
.L22:
	movq	%r14, %rdi
	call	FreeString@PLT
	movq	%r12, %rdi
	call	FreeStringArray@PLT
	movq	%rbp, %rdi
	call	FreeStringArray@PLT
	popq	%rbx
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
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
