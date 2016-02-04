/*
 * File:		hello_world.c
 * Purpose:		Main process
 *
 */

#include "common.h" 


#define ADC_CHANNEL_NUMBER 4
#define ADC_SAMPLE_POINTS  20   // adc sample points for one adc channel
#define BUFFER_SIZE     (ADC_SAMPLE_POINTS * ADC_CHANNEL_NUMBER)


#pragma data_alignment = 4*ADC_CHANNEL_NUMBER  //The ADC_Channel address should be align with the DMA Circular buffer size
uint32 ADC_Channel[ADC_CHANNEL_NUMBER]={0, 26, 29, 30};   //Channel list for Channe 0,Channe 26,Channel 29, Channe30

unsigned char pCounter=0;               // Counter used for Dual buffer switch
uint16 Result_Buffer1[BUFFER_SIZE]={0};  //Buffer1  
uint16 Result_Buffer2[BUFFER_SIZE]={0};  //Buffer2

uint32 Buffer_Address[2]={(uint32)&Result_Buffer1, (uint32)&Result_Buffer2};    //Buffer list

void init_ADC8(void)
{
  // Turn on the ADC0 clock 
  SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );
            
  ADC0_CFG1 = ADC_CFG1_ADIV(1)          //divide ratio is 2 and the clock rate is (input clock)/2.
              | ADC_CFG1_MODE(3)        // single-end 8bit mode
              | ADC_CFG1_ADICLK(0);     //Bus clock         
  
  ADC0_CFG2 = 0;
  
  ADC0_CV1 =  0x1234u;                  // can be anything
  ADC0_CV2 = 0x5678u;                   // can be anything
               
  ADC0_SC2 = 0 | ADC_SC2_DMAEN_MASK;    //ADC conversion complete DMA enable
  
  ADC0_SC3 = 0;                         // Hardware average disable and once conversion

}

void init_TPM1(void)
{
  SIM_SCGC6 |= (SIM_SCGC6_TPM1_MASK );
  SIM_SOPT2 |= SIM_SOPT2_TPMSRC(1);        //input clock source is MCGPLL/2=24MHz
  TPM1_SC = TPM_SC_DMA_MASK | TPM_SC_PS(3);//Divide by 3M=24M/8
  TPM1_CNT = 1;
  TPM1_MOD = 30;        //timer interrupt triger with 100ksps
  
  TPM1_SC |= TPM_SC_CMOD(1);    //start the counter
}

void DMA_2ChanelADC_Init(void)
{
  SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;
  SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;
  
  enable_irq(INT_DMA1-16);
  
  DMA_SAR0 = (uint32) &ADC_Channel;    //Set source address to ADC_Channel
  DMA_DSR_BCR0 = DMA_DSR_BCR_BCR(4*BUFFER_SIZE);    //Set BCR to know how many bytes to transfer, every transfer is 32 bit size
  DMA_DCR0 &= ~(DMA_DCR_SSIZE_MASK | DMA_DCR_DSIZE_MASK);    //Clear source size and destination size fields
  /* Set DMA as follows: 
       Source size is 32-bit size 
       Destination size is 32-bit size 
       Cycle steal mode 
       External requests are enabled 
       source address increments 1 automatically 
*/
  DMA_DCR0 |= (DMA_DCR_SSIZE(0)  // source size 32 bit
             | DMA_DCR_DSIZE(0) // desitination size 32bit
             | DMA_DCR_CS_MASK  // Forces a single read/write transfer per request
             | DMA_DCR_ERQ_MASK  // Enables peripheral request to initiate transfer.
             | DMA_DCR_SINC_MASK // the source address increments after each successful transfer.
             | DMA_DCR_SMOD(1)); //16 bytes circular buffer
  
  DMA_DAR0 = (uint32) &ADC0_SC1A;//0x4003B000;    //Set source address to ADC0_SC1A
  DMAMUX0_CHCFG0 = DMAMUX_CHCFG_SOURCE(55);    //Select TPM1 overflow as channel source
  DMAMUX0_CHCFG0 |= DMAMUX_CHCFG_ENBL_MASK;    //Enable the DMA MUX channel
  
  /*********************************************************************/
  DMA_SAR1 = (uint32) &ADC0_RA;//0x4003B010;    //Set source address to ADC0_RA
  DMA_DSR_BCR1 = DMA_DSR_BCR_BCR(2*BUFFER_SIZE);    //Set BCR to know how many bytes to transfer , every transfer is 16 bit size
  DMA_DCR1 &= ~(DMA_DCR_SSIZE_MASK | DMA_DCR_DSIZE_MASK);    //Clear source size and destination size fields
  /* Set DMA as follows: 
       Source size is 16-bit size 
       Destination size is 16-bit size 
       Cycle steal mode 
       External requests are enabled 
       Destination address increments 1 automatically 
       BCR Bytes trasfer completed interrupt enable
*/
  if ((DMA_DSR_BCR1 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
    DMA_DSR_BCR1 |= DMA_DSR_BCR_DONE_MASK; 
  
  DMA_DCR1 |= (DMA_DCR_SSIZE(2) // source size 16 bit
             | DMA_DCR_DSIZE(2) // desitination size 16bit
             | DMA_DCR_CS_MASK  // Forces a single read/write transfer per request
             | DMA_DCR_ERQ_MASK  // Enables peripheral request to initiate transfer.
             | DMA_DCR_DINC_MASK // the destination address increments after each successful transfer.
             | DMA_DCR_EINT_MASK); // Enable Interrupt on Completion of Transfer
  
  DMA_DAR1 = (uint32) &Result_Buffer1;    //Set source address to result buffer
  DMAMUX0_CHCFG1 = DMAMUX_CHCFG_SOURCE(40);    //Select ADC0 COCO flag as channel source
  DMAMUX0_CHCFG1 |= DMAMUX_CHCFG_ENBL_MASK;    //Enable the DMA MUX channel
}

/********************************************************************/
int main (void)
{
    	char ch;

        init_ADC8();
        
        DMA_2ChanelADC_Init();
        
        init_TPM1();
        
        EnableInterrupts;
        
	while(1)
	{
		
	} 
}
/********************************************************************/
void DMA1_IRQHandler(void)
{ 
  TPM1_SC &= ~TPM_SC_CMOD_MASK;    //stop the counter
  DMA_DCR1 &= ~DMA_DCR_ERQ_MASK;  // 0 Peripheral request is ignored.
  
  /* Create pointer & variable for reading DMA_DSR register */   
  if ((DMA_DSR_BCR1 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
  {         
    DMA_DSR_BCR0 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
    DMA_DSR_BCR1 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
    
    if(++pCounter>=2)
    {
      pCounter=0;
    }
    
    DMA_DAR1 = (uint32) Buffer_Address[pCounter];    //Set source address to result buffer
    
    DMA_DSR_BCR0 = DMA_DSR_BCR_BCR(4*BUFFER_SIZE);      //Reset BCR 
    DMA_DSR_BCR1 = DMA_DSR_BCR_BCR(2*BUFFER_SIZE);      //Reset BCR 
    

  }  
  
  TPM1_SC |= TPM_SC_CMOD(1);    //restart the counter to triger ADC 
  DMA_DCR1 |= DMA_DCR_ERQ_MASK;  //Enables peripheral request
}