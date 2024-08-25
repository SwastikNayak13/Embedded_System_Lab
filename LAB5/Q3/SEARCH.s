	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler

	LDR R1,=N
	LDR R3,=0X121
	MOV R4,#10
	
UP	LDR R2,[R1],#4
	CMP R2,R3
	ADDEQ R5,#1 ; R5 stores 1 if value is found else 0
	BEQ STOP
	SUBS R4,#1
	BNE UP
	
STOP
	B STOP
	
N DCD 0X1,0X2,0X3,0X4,0X5,0X6,0X7,0X8,0X9,0X121

	END