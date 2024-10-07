#include <LPC17xx.h>

int main()
{
	int x, row, col = 0, i, j, arrval;
	int seven_seg[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x7, 0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71};
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON -> PINSEL0 = 0;
	LPC_PINCON -> PINSEL1 = 0;
	LPC_PINCON -> PINSEL3 = 0;
	LPC_PINCON -> PINSEL4 = 0;
	
	LPC_GPIO0->FIODIR = 0x78FF << 4;
	LPC_GPIO1->FIODIR = 0;
	LPC_GPIO2->FIODIR = 0xF<<10;

	LPC_GPIO0 -> FIOPIN = 0;
	
	while(1)
	{
		for(i = 0; i<4; i++)
		{
			LPC_GPIO2 ->FIOPIN = 1 << (10+i);
			for(j = 0; j<50; j++);
			x = LPC_GPIO1->FIOPIN;
			x = x >> 23 & 0xF;
			if(x)
			{
				if(x == 8)
					col = 3;
				else if(x == 4)
					col = 2;
				else if(x == 2)
					col = 1;
				else if(x == 1)
					col = 0;
				arrval = 4*i + col;
				
				
				//Display on Seven Seg
				LPC_GPIO0->FIOPIN = seven_seg[arrval]<<4;
				
			}
			else
				LPC_GPIO0->FIOPIN = seven_seg[1] << 4;
		}
	}
}