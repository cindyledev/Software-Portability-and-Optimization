.text
.globl    _start

start = 0                       /* starting value for the loop index; note that this is a symbol (constant), not a variable */
max = 31                        /* loop exits when the index hits this number (loop condition is i<max) */

_start:
    mov     x20,start         /* loop index */

loop:
        mov    x22,10
        udiv   x23,x20,x22       /* divider */
        msub   x24,x22,x23,x20   /* remainder */

        cmp    x23,0           /* see if quotient is greater than 0 */
        b.eq   lalaland

         /* print divider */
        add    x23,x23,48
	adr    x26,msg+6
        strb   w23,[x26]
       
lalaland:
	add    x24,x24,48                        /* added r20+48 to r19 */
        adr    x27,msg+7                   /* because it does not have immediate mode */
	strb   w24,[x27]                      /* added number after 'Loop' */
	
        mov    x2,len                      /* message length */
	adr    x1,msg                       /* message location */
	mov    x0,1                         /* file descriptor stdout */
	mov    x8,64                        /* syscall sys_write */
	svc    0

	add     x20,x20,1                /* increment index */
	cmp     x20,max           /* see if we're done */
	b.ne    loop                /* loop if we're not */

	mov     x0,0             /* exit status */
	mov     x8,93            /* syscall sys_exit */
	svc     0

.section .data

        msg:    .ascii      "Loop:   \n"
        len = . - msg

