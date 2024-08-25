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


	LDR R0,=N
	LDR R0,[R0]
	
	BL FACT
	
STOP 
	B STOP
	
FACT
	CMP R0,#1
	BEQ EXIT
	PUSH{R0,LR}
	SUB R0,#1
	BL FACT
EXIT
	POP{R2,LR}
	MUL R0,R2
	BX LR
	
N DCD 0X3

	END