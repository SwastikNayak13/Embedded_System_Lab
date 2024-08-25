	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler

	LDR R0, =SRC
	ADD R1,R0,#36
	MOV R2, #05
	LDR R3, =DST
	ADD R6,R3,#36
	
LOOP
	LDR R4,[R0],#4
	LDR R5,[R1],#-4
	STR R4,[R6],#-4
	STR R5,[R3],#4
	SUBS R2, #01
	BNE LOOP
STOP
	B STOP
SRC DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA
	
	AREA mydata, DATA,READWRITE
DST DCD 0
	END 