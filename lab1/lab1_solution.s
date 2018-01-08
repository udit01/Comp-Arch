@@@ Perform a sort of array ? (STDOUT)

	.equ SWI_Exit, 0x11
    .data

    .text
   .globl _start
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @    assume variable 'a' contains the array in memory to be sorted
   @    "#r1" implies take out the number inside register r1
   @    what if we want to do by the above method ??!?
   @    algorithm explained in sort.algo file
   @    count is size of array and stored in r5
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


@@@ This code assumes that count or the value of r5 is atleast 2
_start:
        @instead of first instruction it should be preinitialized with the value of count
        @ldr    r0, #count	    @ R0 = Address a[0]

        sub     r6, r5,#1       @ r6 containts count-1

w:      add     r1, r0, #4      @ R1 is address a[1]@ what if doesnt exist ?
                                @ confusion wether i and j are numbers or addresses ?
                                @finally i think i and j are numbers ie indices

w2:     cmp     [a,r0],[a,r1]   @ cmp on ai and aj will return
        ble     incj            @ branch if less than equal to
        
        ldr     r3, [a,r0]     @swap ai and aj if greater than
        ldr     r4, [a,r1]
        str     [a,r0], r4
        str     [a,r1], r3

incj:   add     r1, r1, #4      @ j-address jump by 4 bytes
        
        cmp     r1, r5          @ somewhat wrong as 
                                @ while condition has to be checked before
        blt     w2

        add     r0, r0, #4

        cmp     r0, r6          @if less than after i's increment then branch to w
        btl     w               

        swi     SWI_Exit	    @ invoke syscall for exit
