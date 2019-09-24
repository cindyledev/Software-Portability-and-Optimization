.text
.globl _start

_start:
	mov $len, %edx
	mov $msg, %ecx
	mov $1, %ebx
	mov $4, %eax
	int $0x80

	mov $0, %ebx
	mov $1, %eax
	int $0x80

.data
msg:
	.ascii "Hello, World!\n"
	len = . - msg
