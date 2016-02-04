///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  12:02:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\projects\hello_world\hello_world.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\projects\hello_world\hello_world.c
//        -D IAR -D FREEDOM -lCN
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\
//        -lB
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\
//        -o
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.2\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\projects\hello_world\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\common\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\cpu\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\cpu\headers\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\llwu\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\lptmr\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\mcg\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\pmc\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\rcm\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\rtc\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\smc\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\uart\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\wdog\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\cmp\
//        -I
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\platforms\
//        -I D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\..\
//        -Ol
//    List file    =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\hello_world.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN enable_irq

        PUBLIC ADC_Channel
        PUBLIC Buffer_Address
        PUBLIC DMA1_IRQHandler
        PUBLIC DMA_2ChanelADC_Init
        PUBLIC Result_Buffer1
        PUBLIC Result_Buffer2
        PUBLIC init_ADC8
        PUBLIC init_TPM1
        PUBLIC main
        PUBLIC pCounter

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\projects\hello_world\hello_world.c
//    1 /*
//    2  * File:		hello_world.c
//    3  * Purpose:		Main process
//    4  *
//    5  */
//    6 
//    7 #include "common.h" 
//    8 
//    9 #define BUFFER_SIZE     10
//   10 #define ADC_CHANNEL_NUMBER 4
//   11 #define ADC_SAMPLE_POINTS  20   // adc sample points for one adc channel
//   12 #define BUFFER_SIZE     (ADC_SAMPLE_POINTS * ADC_CHANNEL_NUMBER)
//   13 
//   14 
//   15 #pragma data_alignment = 4* ADC_CHANNEL_NUMBER //The ADC_Channel address should be align with the DMA Circular buffer size

        SECTION `.data`:DATA:REORDER:NOROOT(4)
//   16 uint32 ADC_Channel[ADC_CHANNEL_NUMBER]={0, 26, 29, 30};   //Channel list for Channe 0,Channe 26,Channel 29, Channe30
ADC_Channel:
        DATA
        DC32 0, 26, 29, 30
//   17 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   18 unsigned char pCounter=0;               // Counter used for Dual buffer switch
pCounter:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 uint16 Result_Buffer1[BUFFER_SIZE]={0};  //Buffer1  
Result_Buffer1:
        DS8 160

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 uint16 Result_Buffer2[BUFFER_SIZE]={0};  //Buffer2
Result_Buffer2:
        DS8 160
//   21 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 uint32 Buffer_Address[2]={(uint32)&Result_Buffer1, (uint32)&Result_Buffer2};    //Buffer list
Buffer_Address:
        DATA
        DC32 Result_Buffer1, Result_Buffer2
//   23 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void init_ADC8(void)
//   25 {
//   26   // Turn on the ADC0 clock 
//   27   SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );
init_ADC8:
        LDR      R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+20       ;; #+134217728
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3  ;; 0x4004803c
        STR      R1,[R0, #+0]
//   28             
//   29   ADC0_CFG1 = ADC_CFG1_ADIV(1)          //divide ratio is 2 and the clock rate is (input clock)/2.
//   30               | ADC_CFG1_MODE(3)        // single-end 8bit mode
//   31               | ADC_CFG1_ADICLK(0);     //Bus clock         
        MOVS     R0,#+44
        LDR      R1,??DataTable3_1  ;; 0x4003b008
        STR      R0,[R1, #+0]
//   32   
//   33   ADC0_CFG2 = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_2  ;; 0x4003b00c
        STR      R0,[R1, #+0]
//   34   
//   35   ADC0_CV1 =  0x1234u;                  // can be anything
        LDR      R0,??DataTable3_3  ;; 0x1234
        LDR      R1,??DataTable3_4  ;; 0x4003b018
        STR      R0,[R1, #+0]
//   36   ADC0_CV2 = 0x5678u;                   // can be anything
        LDR      R0,??DataTable3_5  ;; 0x5678
        LDR      R1,??DataTable3_6  ;; 0x4003b01c
        STR      R0,[R1, #+0]
//   37                
//   38   ADC0_SC2 = 0 | ADC_SC2_DMAEN_MASK;    //ADC conversion complete DMA enable
        MOVS     R0,#+4
        LDR      R1,??DataTable3_7  ;; 0x4003b020
        STR      R0,[R1, #+0]
//   39   
//   40   ADC0_SC3 = 0;                         // Hardware average disable and once conversion
        MOVS     R0,#+0
        LDR      R1,??DataTable3_8  ;; 0x4003b024
        STR      R0,[R1, #+0]
//   41 
//   42 }
        BX       LR               ;; return
//   43 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void init_TPM1(void)
//   45 {
//   46   SIM_SCGC6 |= (SIM_SCGC6_TPM1_MASK );
init_TPM1:
        LDR      R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+18       ;; #+33554432
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3  ;; 0x4004803c
        STR      R1,[R0, #+0]
//   47   SIM_SOPT2 |= SIM_SOPT2_TPMSRC(1);        //input clock source is MCGPLL/2=24MHz
        LDR      R0,??DataTable3_9  ;; 0x40048004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_9  ;; 0x40048004
        STR      R1,[R0, #+0]
//   48   TPM1_SC = TPM_SC_DMA_MASK | TPM_SC_PS(3);//Divide by 3M=24M/8
        MOVS     R0,#+255
        ADDS     R0,R0,#+4        ;; #+259
        LDR      R1,??DataTable3_10  ;; 0x40039000
        STR      R0,[R1, #+0]
//   49   TPM1_CNT = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_11  ;; 0x40039004
        STR      R0,[R1, #+0]
//   50   TPM1_MOD = 30;        //timer interrupt triger with 100ksps
        MOVS     R0,#+30
        LDR      R1,??DataTable3_12  ;; 0x40039008
        STR      R0,[R1, #+0]
//   51   
//   52   TPM1_SC |= TPM_SC_CMOD(1);    //start the counter
        LDR      R0,??DataTable3_10  ;; 0x40039000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_10  ;; 0x40039000
        STR      R1,[R0, #+0]
//   53 }
        BX       LR               ;; return
//   54 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 void DMA_2ChanelADC_Init(void)
//   56 {
DMA_2ChanelADC_Init:
        PUSH     {R7,LR}
//   57   SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;
        LDR      R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3  ;; 0x4004803c
        STR      R1,[R0, #+0]
//   58   SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;
        LDR      R0,??DataTable3_13  ;; 0x40048040
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_13  ;; 0x40048040
        STR      R1,[R0, #+0]
//   59   
//   60   enable_irq(INT_DMA1-16);
        MOVS     R0,#+1
        BL       enable_irq
//   61   
//   62   DMA_SAR0 = (uint32) &ADC_Channel;    //Set source address to ADC_Channel
        LDR      R0,??DataTable3_14
        LDR      R1,??DataTable3_15  ;; 0x40008100
        STR      R0,[R1, #+0]
//   63   DMA_DSR_BCR0 = DMA_DSR_BCR_BCR(4*BUFFER_SIZE);    //Set BCR to know how many bytes to transfer, every transfer is 32 bit size
        MOVS     R0,#+160
        LSLS     R0,R0,#+1        ;; #+320
        LDR      R1,??DataTable3_16  ;; 0x40008108
        STR      R0,[R1, #+0]
//   64   DMA_DCR0 &= ~(DMA_DCR_SSIZE_MASK | DMA_DCR_DSIZE_MASK);    //Clear source size and destination size fields
        LDR      R0,??DataTable3_17  ;; 0x4000810c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_18  ;; 0xffc9ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable3_17  ;; 0x4000810c
        STR      R1,[R0, #+0]
//   65   /* Set DMA as follows: 
//   66        Source size is 32-bit size 
//   67        Destination size is 32-bit size 
//   68        Cycle steal mode 
//   69        External requests are enabled 
//   70        source address increments 1 automatically 
//   71 */
//   72   DMA_DCR0 |= (DMA_DCR_SSIZE(0)  // source size 32 bit
//   73              | DMA_DCR_DSIZE(0) // desitination size 32bit
//   74              | DMA_DCR_CS_MASK  // Forces a single read/write transfer per request
//   75              | DMA_DCR_ERQ_MASK  // Enables peripheral request to initiate transfer.
//   76              | DMA_DCR_SINC_MASK // the source address increments after each successful transfer.
//   77              | DMA_DCR_SMOD(1)); //16 bytes circular buffer
        LDR      R0,??DataTable3_17  ;; 0x4000810c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_19  ;; 0x60401000
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_17  ;; 0x4000810c
        STR      R1,[R0, #+0]
//   78   
//   79   DMA_DAR0 = (uint32) &ADC0_SC1A;//0x4003B000;    //Set source address to ADC0_SC1A
        LDR      R0,??DataTable3_20  ;; 0x4003b000
        LDR      R1,??DataTable3_21  ;; 0x40008104
        STR      R0,[R1, #+0]
//   80   DMAMUX0_CHCFG0 = DMAMUX_CHCFG_SOURCE(55);    //Select TPM1 overflow as channel source
        MOVS     R0,#+55
        LDR      R1,??DataTable3_22  ;; 0x40021000
        STRB     R0,[R1, #+0]
//   81   DMAMUX0_CHCFG0 |= DMAMUX_CHCFG_ENBL_MASK;    //Enable the DMA MUX channel
        LDR      R0,??DataTable3_22  ;; 0x40021000
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_22  ;; 0x40021000
        STRB     R1,[R0, #+0]
//   82   
//   83   /*********************************************************************/
//   84   DMA_SAR1 = (uint32) &ADC0_RA;//0x4003B010;    //Set source address to ADC0_RA
        LDR      R0,??DataTable3_23  ;; 0x4003b010
        LDR      R1,??DataTable3_24  ;; 0x40008110
        STR      R0,[R1, #+0]
//   85   DMA_DSR_BCR1 = DMA_DSR_BCR_BCR(2*BUFFER_SIZE);    //Set BCR to know how many bytes to transfer , every transfer is 16 bit size
        MOVS     R0,#+160
        LDR      R1,??DataTable3_25  ;; 0x40008118
        STR      R0,[R1, #+0]
//   86   DMA_DCR1 &= ~(DMA_DCR_SSIZE_MASK | DMA_DCR_DSIZE_MASK);    //Clear source size and destination size fields
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_18  ;; 0xffc9ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        STR      R1,[R0, #+0]
//   87   /* Set DMA as follows: 
//   88        Source size is 16-bit size 
//   89        Destination size is 16-bit size 
//   90        Cycle steal mode 
//   91        External requests are enabled 
//   92        Destination address increments 1 automatically 
//   93        BCR Bytes trasfer completed interrupt enable
//   94 */
//   95   if ((DMA_DSR_BCR1 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
        LDR      R0,??DataTable3_25  ;; 0x40008118
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BPL      ??DMA_2ChanelADC_Init_0
//   96     DMA_DSR_BCR1 |= DMA_DSR_BCR_DONE_MASK; 
        LDR      R0,??DataTable3_25  ;; 0x40008118
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_25  ;; 0x40008118
        STR      R1,[R0, #+0]
//   97   
//   98   DMA_DCR1 |= (DMA_DCR_SSIZE(2) // source size 16 bit
//   99              | DMA_DCR_DSIZE(2) // desitination size 16bit
//  100              | DMA_DCR_CS_MASK  // Forces a single read/write transfer per request
//  101              | DMA_DCR_ERQ_MASK  // Enables peripheral request to initiate transfer.
//  102              | DMA_DCR_DINC_MASK // the destination address increments after each successful transfer.
//  103              | DMA_DCR_EINT_MASK); // Enable Interrupt on Completion of Transfer
??DMA_2ChanelADC_Init_0:
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_27  ;; 0xe02c0000
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        STR      R1,[R0, #+0]
//  104   
//  105   DMA_DAR1 = (uint32) &Result_Buffer1;    //Set source address to result buffer
        LDR      R0,??DataTable3_28
        LDR      R1,??DataTable3_29  ;; 0x40008114
        STR      R0,[R1, #+0]
//  106   DMAMUX0_CHCFG1 = DMAMUX_CHCFG_SOURCE(40);    //Select ADC0 COCO flag as channel source
        MOVS     R0,#+40
        LDR      R1,??DataTable3_30  ;; 0x40021001
        STRB     R0,[R1, #+0]
//  107   DMAMUX0_CHCFG1 |= DMAMUX_CHCFG_ENBL_MASK;    //Enable the DMA MUX channel
        LDR      R0,??DataTable3_30  ;; 0x40021001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_30  ;; 0x40021001
        STRB     R1,[R0, #+0]
//  108 }
        POP      {R0,PC}          ;; return
//  109 
//  110 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  111 int main (void)
//  112 {
main:
        PUSH     {R7,LR}
//  113     	char ch;
//  114 
//  115         init_ADC8();
        BL       init_ADC8
//  116         
//  117         DMA_2ChanelADC_Init();
        BL       DMA_2ChanelADC_Init
//  118         
//  119         init_TPM1();
        BL       init_TPM1
//  120         
//  121         EnableInterrupts;
        CPSIE i
//  122         
//  123 	while(1)
??main_0:
        B        ??main_0
//  124 	{
//  125 		
//  126 	} 
//  127 }
//  128 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void DMA1_IRQHandler(void)
//  130 { 
DMA1_IRQHandler:
        PUSH     {LR}
//  131   TPM1_SC &= TPM_SC_CMOD(0);    //stop the counter
        LDR      R0,??DataTable3_10  ;; 0x40039000
        LDR      R0,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable3_10  ;; 0x40039000
        STR      R0,[R1, #+0]
//  132   DMA_DCR1 &= ~DMA_DCR_ERQ_MASK;  // 0 Peripheral request is ignored.
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_31  ;; 0xbfffffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        STR      R1,[R0, #+0]
//  133   
//  134   /* Create pointer & variable for reading DMA_DSR register */   
//  135   if ((DMA_DSR_BCR1 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
        LDR      R0,??DataTable3_25  ;; 0x40008118
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BPL      ??DMA1_IRQHandler_0
//  136   {         
//  137     DMA_DSR_BCR0 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
        LDR      R0,??DataTable3_16  ;; 0x40008108
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_16  ;; 0x40008108
        STR      R1,[R0, #+0]
//  138     DMA_DSR_BCR1 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
        LDR      R0,??DataTable3_25  ;; 0x40008118
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_25  ;; 0x40008118
        STR      R1,[R0, #+0]
//  139     
//  140     if(++pCounter>=2)
        LDR      R0,??DataTable3_32
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable3_32
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable3_32
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BLT      ??DMA1_IRQHandler_1
//  141     {
//  142       pCounter=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_32
        STRB     R0,[R1, #+0]
//  143     }
//  144     
//  145     DMA_DAR1 = (uint32) Buffer_Address[pCounter];    //Set source address to result buffer
??DMA1_IRQHandler_1:
        LDR      R0,??DataTable3_33
        LDR      R1,??DataTable3_32
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable3_29  ;; 0x40008114
        STR      R0,[R1, #+0]
//  146     
//  147     DMA_DSR_BCR0 = DMA_DSR_BCR_BCR(4*BUFFER_SIZE);      //Reset BCR 
        MOVS     R0,#+160
        LSLS     R0,R0,#+1        ;; #+320
        LDR      R1,??DataTable3_16  ;; 0x40008108
        STR      R0,[R1, #+0]
//  148     DMA_DSR_BCR1 = DMA_DSR_BCR_BCR(2*BUFFER_SIZE);      //Reset BCR 
        MOVS     R0,#+160
        LDR      R1,??DataTable3_25  ;; 0x40008118
        STR      R0,[R1, #+0]
//  149     
//  150 
//  151   }  
//  152   
//  153   TPM1_SC |= TPM_SC_CMOD(1);    //restart the counter to triger ADC 
??DMA1_IRQHandler_0:
        LDR      R0,??DataTable3_10  ;; 0x40039000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_10  ;; 0x40039000
        STR      R1,[R0, #+0]
//  154   DMA_DCR1 |= DMA_DCR_ERQ_MASK;  //Enables peripheral request
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_26  ;; 0x4000811c
        STR      R1,[R0, #+0]
//  155 }
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x4003b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x4003b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x1234

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4003b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x5678

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x4003b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4003b020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4003b024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     ADC_Channel

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x40008100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x40008108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0x4000810c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0xffc9ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0x60401000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     0x40008104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     0x4003b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     0x40008110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     0x40008118

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     0x4000811c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     0xe02c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_28:
        DC32     Result_Buffer1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_29:
        DC32     0x40008114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_30:
        DC32     0x40021001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_31:
        DC32     0xbfffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_32:
        DC32     pCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_33:
        DC32     Buffer_Address

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 321 bytes in section .bss
//  24 bytes in section .data
// 590 bytes in section .text
// 
// 590 bytes of CODE memory
// 345 bytes of DATA memory
//
//Errors: none
//Warnings: 2
