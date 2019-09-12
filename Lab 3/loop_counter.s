.text
.globl _start

start = 0
max = 10
x = 48

_start:
	mov $start, %r15

loop:
	mov $len, %rdx
	mov $msg, %rsi
	mov $x, %r14
	mov %r15, %r14
	add $x, %r14
	mov %r14b, msg+6
	mov $1, %rax

	syscall

	inc %r15
	cmp $max, %r15
	jne loop

	mov $0, %rdi
	mov $60, %rax
	
	syscall

.section .data

msg: 	.ascii "Loop:     \n"
	len = . - msg
