	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler

	mov r4,#0
	mov r1,#10
	ldr r0, =list
	ldr r2, =result
up 	ldr r3, [r0,r4]
	str r3, [r2,r4]
	add r4, #04
	sub r1,#01
	cmp r1,#00
	bhi up
	ldr r0, =result

	
	mov r9, #9
	mov r3, #10
	
outer_loop 
	mov r5, r0
	ldr r7, [r5]
	mov r4, r3 
inner_loop 
	ldr r6, [r5], #4 
	 
	cmp r6, r7

	movls r7,r6
	movls r11,r5
	
	subs r4, r4, #1 
	bne inner_loop 
	
	ldr r1,[r0]
	str r7, [r0] 
	str r1, [r11, #-4]
	add r0,#4
	sub r3, #1
	subs r9, r9, #1 
	
	bne outer_loop

list dcd 0x10,0x05,0x33,0x24,0x01,0x77,0x21,0x04,0x87,0x56
	AREA data1, data, readwrite
result DCW 0,0,0,0,0,0,0,0,0,0
	END
