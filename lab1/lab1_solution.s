@@@ Perform a sort of array ? (STDOUT)

	.equ SWI_Exit, 0x11
    .data

    .text
   .globl _start
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @    assume variable 'a' contains the array in memory to be sorted
   @    "#r1" implies take out the number inside register r1
   @    algorithm explained in sort.algo file
   @    count is size of array and stored in r5
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


_start: ldr     r0, #0	        @ R0 = Address of variable i
        ldr     r1, #0          @ R1 =  Address of variable j


w:      add     r1, r0, #1      @ to add 1 in the value of i
                                @ confusion wether i and j are numbers or addresses ?
                                @finally i think i and j are numbers ie indices

w2:     cmp     [a,#r0],[a,#r1] @ cmp on ai and aj will return
        ble     incj            @ branch if less than equal to
        
        ldr     r3, [a,#r0]     @swap ai and aj if greater than
        ldr     r4, [a,#r1]
        str     [a,#r0], r4
        str     [a,#r1], r3

incj:   add     r1, r1, #1      @ j jump by 4 bytes
        
        cmp     r1, r5          @ somewhat wrong as 
                                @ while condition has to be checked before
        blt     w2

        add     r0, r0, #1

        cmp     r0, r5
        btl     w

        swi     SWI_Exit	    @ invoke syscall for exit
