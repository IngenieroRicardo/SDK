	.file	"peticion.c"
	.text
	.p2align 4
	.type	Concat, @function
Concat:
.LFB51:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, 40(%rsp)
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
	leaq	32(%rsp), %rax
	movq	%rax, 16(%rsp)
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, %rbp
	movq	%rax, %r12
	xorl	%ebx, %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L26:
	movl	%eax, %edx
	addl	$8, %eax
	addq	%r12, %rdx
	movl	%eax, (%rsp)
	movq	(%rdx), %rdi
	testq	%rdi, %rdi
	je	.L25
.L5:
	call	strlen@PLT
	addq	%rax, %rbx
	movl	(%rsp), %eax
	cmpl	$47, %eax
	jbe	.L26
	movq	8(%rsp), %rdx
	movq	(%rdx), %rdi
	leaq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	testq	%rdi, %rdi
	jne	.L5
.L25:
	leaq	1(%rbx), %rdi
	call	malloc@PLT
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L13
	leaq	112(%rsp), %rax
	movb	$0, (%r8)
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L27:
	movl	%edx, %ecx
	addq	16(%rsp), %rcx
	addl	$8, %edx
	movq	(%rcx), %rbp
	movl	%edx, (%rsp)
	testq	%rbp, %rbp
	je	.L1
.L9:
	movq	%r8, %rdi
	movq	%rbp, %rsi
	call	strcat@PLT
	movl	(%rsp), %edx
	movq	%rax, %r8
	cmpl	$47, %edx
	jbe	.L27
	movq	8(%rsp), %rcx
	movq	(%rcx), %rbp
	leaq	8(%rcx), %rax
	movq	%rax, 8(%rsp)
	testq	%rbp, %rbp
	jne	.L9
.L1:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L28
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
.L2:
	.cfi_restore_state
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, %r8
	testq	%rax, %rax
	je	.L13
	leaq	112(%rsp), %rax
	movb	$0, (%r8)
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movq	%rax, 16(%rsp)
	jmp	.L1
.L13:
	xorl	%r8d, %r8d
	jmp	.L1
.L28:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	Concat, .-Concat
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"123456"
.LC1:
	.string	"admin"
.LC2:
	.string	"application/json"
.LC3:
	.string	"Content-Type"
.LC4:
	.string	"Accept"
.LC5:
	.string	"\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"{\"title\": \"foo\",\"body\": \"bar\",\"userId\": 1}"
	.align 8
.LC7:
	.string	"https://jsonplaceholder.typicode.com/posts"
	.section	.rodata.str1.1
.LC8:
	.string	"Respuesta:\n%s\n"
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
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC1(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	call	HeaderAuthBasic@PLT
	movq	%r13, %rsi
	leaq	.LC3(%rip), %rdi
	movq	%rax, %rbp
	call	Header@PLT
	movq	%r13, %rsi
	leaq	.LC4(%rip), %rdi
	movq	%rax, %r12
	call	Header@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r12, %rdx
	movq	%rbp, %r8
	pushq	$0
	.cfi_def_cfa_offset 48
	leaq	.LC5(%rip), %r9
	movq	%rax, %rdi
	xorl	%eax, %eax
	movq	%r9, %rsi
	movq	%r9, %rcx
	call	Concat
	xorl	%esi, %esi
	leaq	.LC6(%rip), %rdi
	movq	%rax, %r13
	xorl	%eax, %eax
	call	Concat
	movq	%r13, %rsi
	leaq	.LC7(%rip), %rdi
	movq	%rax, %rdx
	movq	%rax, %r12
	call	Post@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rcx
	.cfi_def_cfa_offset 32
	testq	%rax, %rax
	je	.L30
	movq	%rax, %rbp
	movq	%rax, %rdx
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	FreeString@PLT
.L30:
	movq	%r13, %rdi
	call	FreeString@PLT
	movq	%r12, %rdi
	call	FreeString@PLT
	popq	%rbp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
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
