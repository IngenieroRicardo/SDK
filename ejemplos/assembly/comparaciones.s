	.file	"comparaciones.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hola"
.LC1:
	.string	"Equals: %d\n"
.LC2:
	.string	"mun"
.LC3:
	.string	"hola mundo"
.LC4:
	.string	"Contains: %d\n"
.LC5:
	.string	"bebida"
.LC6:
	.string	"comida"
.LC7:
	.string	"comida bar comida"
.LC8:
	.string	"Replaced: %s\n"
.LC9:
	.string	"123.45"
.LC10:
	.string	"IsNumeric: %d\n"
.LC11:
	.string	"abc"
.LC12:
	.string	"Hola mundo"
.LC13:
	.string	"Substring: %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rsi
	leaq	.LC10(%rip), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	Equals@PLT
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	Contains@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC5(%rip), %rdx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	ReplaceAll@PLT
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC9(%rip), %rdi
	call	IsNumeric@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC11(%rip), %rdi
	call	IsNumeric@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$10, %edx
	movl	$6, %esi
	leaq	.LC12(%rip), %rdi
	call	Substring@PLT
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	FreeString@PLT
	movq	%rbp, %rdi
	call	FreeString@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
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
