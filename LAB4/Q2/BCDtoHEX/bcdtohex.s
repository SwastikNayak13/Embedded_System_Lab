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

	LDR R1,=BCD
	LDR R1,[R1]
	MOV R3,#0X0F
	MOV R4,#1
	MOV R6,#0XA
LOOP
	AND R2,R1,R3
	MUL R2,R4
	MUL R4,R6
	ADD R5,R2
	LSRS R1,#4
	BNE LOOP
	
	LDR R6,=RES
	STR R5,[R6]
	
STOP	
	B STOP

	
	
BCD DCD 0X4095

	AREA mydata,DATA,READWRITE
RES DCD 0

	END