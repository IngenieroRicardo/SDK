	.file	"validarip.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"{\"message\":\"%s success\"}"
	.text
	.p2align 4
	.globl	ip_check_handler
	.type	ip_check_handler, @function
ip_check_handler:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	GetClientIP@PLT
	movl	$100, %edi
	movq	%rax, %r12
	call	NewString@PLT
	movq	%r12, %r8
	movl	$1, %esi
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rbp
	movq	$-1, %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%rbp, %rsi
	movl	$200, %edi
	call	CreateResponse@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	free@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE67:
	.size	ip_check_handler, .-ip_check_handler
	.section	.rodata.str1.1
.LC1:
	.string	"10.0.0.5,10.0.0.6"
.LC2:
	.string	"127.0.0.1"
.LC3:
	.string	"/"
.LC4:
	.string	"8080"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB68:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC1(%rip), %rdi
	call	LoadBlacklist@PLT
	leaq	.LC2(%rip), %rdi
	call	AddToBlacklist@PLT
	movq	ip_check_handler@GOTPCREL(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	RegisterHandler@PLT
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
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
