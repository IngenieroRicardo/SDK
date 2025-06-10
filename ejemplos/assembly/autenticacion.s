	.file	"autenticacion.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"admin"
.LC1:
	.string	"secret"
.LC2:
	.string	"{\"token\":\"%s\"}"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"{\"error\":\"Invalid credentials\"}"
	.text
	.p2align 4
	.globl	login_handler
	.type	login_handler, @function
login_handler:
.LFB68:
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
	call	GetUsername@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	GetPassword@PLT
	leaq	.LC0(%rip), %rsi
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	Equals@PLT
	testl	%eax, %eax
	je	.L2
	leaq	.LC1(%rip), %rsi
	movq	%rbp, %rdi
	call	Equals@PLT
	testl	%eax, %eax
	jne	.L11
.L2:
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	leaq	.LC3(%rip), %rsi
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	$401, %edi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	CreateResponse@PLT
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	xorl	%eax, %eax
	call	GenerateToken@PLT
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	GetStringSize@PLT
	leal	20(%rax), %edi
	call	NewString@PLT
	movq	%rbp, %r8
	movl	$1, %esi
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r12
	movq	$-1, %rdx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rsi
	movl	$200, %edi
	call	CreateResponse@PLT
	movq	%r12, %rdi
	movq	%rax, %r13
	call	FreeString@PLT
	movq	%rbp, %rdi
	call	FreeString@PLT
	movq	%r13, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	login_handler, .-login_handler
	.section	.rodata.str1.1
.LC4:
	.string	"{\"message\":\"Valid token\"}"
.LC5:
	.string	"{\"error\":\"Invalid token\"}"
	.text
	.p2align 4
	.globl	token_handler
	.type	token_handler, @function
token_handler:
.LFB67:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	GetBearerToken@PLT
	movq	%rax, %rdi
	call	ValidateToken@PLT
	cmpl	$1, %eax
	je	.L17
	leaq	.LC5(%rip), %rsi
	movl	$403, %edi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	CreateResponse@PLT
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	leaq	.LC4(%rip), %rsi
	movl	$200, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	CreateResponse@PLT
	.cfi_endproc
.LFE67:
	.size	token_handler, .-token_handler
	.section	.rodata.str1.1
.LC6:
	.string	"/api/login"
.LC7:
	.string	"/api/protected"
.LC8:
	.string	"8080"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB69:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$3600, %edi
	call	SetDefaultTokenExpiry@PLT
	movq	login_handler@GOTPCREL(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	RegisterHandler@PLT
	movq	token_handler@GOTPCREL(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	RegisterHandler@PLT
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	leaq	.LC8(%rip), %rdi
	call	StartServer@PLT
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$1, %edi
	call	sleep@PLT
	jmp	.L19
	.cfi_endproc
.LFE69:
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
