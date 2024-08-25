	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
 
	ALIGN
	AREA mycode, CODE, READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler

	LDR R0,=SRC
	LDR R1,=DST
	MOV R3,#10
	
back	
	LDR R2,[R0],#4
	STR R2,[R1],#4
	SUB R3,#1
	CMP R3,#0
	BNE back
STOP
	B STOP
	
	
	
	
	
SRC DCD 0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0x10

	AREA mydata, DATA, READWRITE
	
DST DCD 0

	END