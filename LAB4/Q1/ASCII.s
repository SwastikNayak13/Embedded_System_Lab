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


	LDR R0,=NUM
	LDR R3,=RESULT
	LDR R1,[R0] ; load hex number into register R1
	AND R2,R1,#0x0F ; mask upper 4 bits
	CMP R2,#9
	ADDHI R2,#0X37
	ADDLO R2,#0X30
	STR R2,[R3],#1
	LSR R2,R1,#4
	CMP R2,#9
	ADDHI R2,#0X37
	ADDLO R2,#0X30
	STR R2,[R3]
	
STOP
	B STOP

NUM DCD 0x000003A
	AREA data, DATA, READWRITE
RESULT DCD 0

	END