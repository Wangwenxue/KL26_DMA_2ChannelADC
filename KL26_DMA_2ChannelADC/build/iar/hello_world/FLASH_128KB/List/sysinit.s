///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  13:23:59
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\sysinit.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\sysinit.c -D IAR -D
//        FREEDOM -lCN
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
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\sysinit.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idiv
        EXTERN __aeabi_uidiv
        EXTERN enable_irq
        EXTERN pll_init
        EXTERN uart0_init

        PUBLIC clk_out_init
        PUBLIC core_clk_khz
        PUBLIC enable_abort_button
        PUBLIC mcg_clk_hz
        PUBLIC mcg_clk_khz
        PUBLIC periph_clk_khz
        PUBLIC pll_clk_khz
        PUBLIC sysinit
        PUBLIC uart0_clk_hz
        PUBLIC uart0_clk_khz

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\sysinit.c
//    1 /*
//    2  * File:        sysinit.c
//    3  * Purpose:     Kinetis L Family Configuration
//    4  *              Initializes processor to a default state
//    5  *
//    6  * Notes:
//    7  *
//    8  *
//    9  */
//   10 
//   11 #include "common.h"
//   12 #include "sysinit.h"
//   13 #include "UART.h"
//   14 
//   15 /********************************************************************/
//   16 
//   17 /* System clock frequency variables - Represents the current system clock
//   18  * settings
//   19  */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int mcg_clk_hz;
mcg_clk_hz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int mcg_clk_khz;
mcg_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 int core_clk_khz;
core_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int periph_clk_khz;
periph_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int pll_clk_khz;
pll_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int uart0_clk_khz;
uart0_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 uint32 uart0_clk_hz;
uart0_clk_hz:
        DS8 4
//   27 extern uint32_t SystemCoreClock;
//   28 
//   29 
//   30 
//   31 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void sysinit (void)
//   33 {
sysinit:
        PUSH     {LR}
        SUB      SP,SP,#+12
//   34         /* Enable all of the port clocks. These have to be enabled to configure
//   35          * pin muxing options, so most code will need all of these on anyway.
//   36          */
//   37         SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   38                       | SIM_SCGC5_PORTB_MASK
//   39                       | SIM_SCGC5_PORTC_MASK
//   40                       | SIM_SCGC5_PORTD_MASK
//   41                       | SIM_SCGC5_PORTE_MASK );
        LDR      R0,??DataTable2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        MOVS     R1,#+248
        LSLS     R1,R1,#+6        ;; #+15872
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40048038
        STR      R1,[R0, #+0]
//   42         
//   43         // Release hold with ACKISO:  Only has an effect if recovering from VLLS1, VLLS2, or VLLS3
//   44         // if ACKISO is set you must clear ackiso before calling pll_init 
//   45         //    or pll init hangs waiting for OSC to initialize
//   46         // if osc enabled in low power modes - enable it first before ack
//   47         // if I/O needs to be maintained without glitches enable outputs and modules first before ack.
//   48         if (PMC_REGSC &  PMC_REGSC_ACKISO_MASK)
        LDR      R0,??DataTable2_1  ;; 0x4007d002
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??sysinit_0
//   49         PMC_REGSC |= PMC_REGSC_ACKISO_MASK;
        LDR      R0,??DataTable2_1  ;; 0x4007d002
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x4007d002
        STRB     R1,[R0, #+0]
//   50         
//   51 #ifdef ENABLE_CLKOUT
//   52         // Initialize trace clk functionality
//   53         clk_out_init();
//   54 #endif
//   55 				
//   56 #ifndef CMSIS
//   57        /* Ramp up the system clock */
//   58        /* Set the system dividers */
//   59        /* NOTE: The PLL init will not configure the system clock dividers,
//   60         * so they must be configured appropriately before calling the PLL
//   61         * init function to ensure that clocks remain in valid ranges.
//   62         */  
//   63         SIM_CLKDIV1 = ( 0
//   64                         | SIM_CLKDIV1_OUTDIV1(OUTDIV1_VAL)
//   65                         | SIM_CLKDIV1_OUTDIV4(OUTDIV4_VAL) );
??sysinit_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        LDR      R1,??DataTable2_2  ;; 0x40048044
        STR      R0,[R1, #+0]
//   66  
//   67 #if defined(NO_PLL_INIT)
//   68         // If PLL initialization is not desired, set FLL to 48 MHz clock in default FEI mode
//   69         // Set DMX32 and DRST_DRS values accordingly
//   70         MCG_C4 = ((MCG_C4 & ~(MCG_C4_DRST_DRS_MASK)) | ((FLL_DMX32 << MCG_C4_DMX32_SHIFT)
//   71                                                      | (FLL_DRST_DRS << MCG_C4_DRST_DRS_SHIFT)));
//   72         if (FLL_DMX32 == 0)
//   73             mcg_clk_hz = 640 * (FLL_DRST_DRS + 1) * FLL_REF_FREQ;
//   74         else 
//   75             mcg_clk_hz = 732 * (FLL_DRST_DRS + 1) * FLL_REF_FREQ;
//   76         
//   77         SIM_SOPT2 &= ~SIM_SOPT2_PLLFLLSEL_MASK; // clear PLLFLLSEL to select the FLL for this clock source
//   78         
//   79         uart0_clk_khz = (mcg_clk_hz / 1000); // the uart0 clock frequency will equal the FLL frequency
//   80         
//   81         SIM_SOPT2 = ((SIM_SOPT2 & ~SIM_SOPT2_UART0SRC_MASK) | SIM_SOPT2_UART0SRC(1));
//   82        
//   83 #else 
//   84        /* Initialize PLL */
//   85        /* PLL will be the source for MCG CLKOUT so the core, system, and flash clocks are derived from it */ 
//   86        mcg_clk_hz = pll_init(CLK0_FREQ_HZ,  /* CLKIN0 frequency */
//   87                              LOW_POWER,     /* Set the oscillator for low power mode */
//   88                              CLK0_TYPE,     /* Crystal or canned oscillator clock input */
//   89                              PLL0_PRDIV,    /* PLL predivider value */
//   90                              PLL0_VDIV,     /* PLL multiplier */
//   91                              MCGOUT);       /* Use the output from this PLL as the MCGOUT */
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+24
        STR      R0,[SP, #+0]
        MOVS     R3,#+4
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR      R0,??DataTable2_3  ;; 0x7a1200
        BL       pll_init
        LDR      R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   92 														 
//   93 														 
//   94 			/* Check the value returned from pll_init() to make sure there wasn't an error */
//   95        if (mcg_clk_hz < 0x100)
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+255
        BGT      ??sysinit_1
//   96          while(1);
??sysinit_2:
        B        ??sysinit_2
//   97        
//   98        SIM_SOPT2 |= SIM_SOPT2_PLLFLLSEL_MASK; // set PLLFLLSEL to select the PLL for this clock source
??sysinit_1:
        LDR      R0,??DataTable2_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_5  ;; 0x40048004
        STR      R1,[R0, #+0]
//   99        
//  100        uart0_clk_khz = ((mcg_clk_hz / 2) / 1000); // UART0 clock frequency will equal half the PLL frequency
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        BL       __aeabi_idiv
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_idiv
        LDR      R1,??DataTable2_6
        STR      R0,[R1, #+0]
//  101        
//  102        SIM_SOPT2 = ((SIM_SOPT2 & ~SIM_SOPT2_UART0SRC_MASK) | SIM_SOPT2_UART0SRC(1));
        LDR      R0,??DataTable2_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_7  ;; 0xf3ffffff
        ANDS     R1,R1,R0
        MOVS     R0,#+128
        LSLS     R0,R0,#+19       ;; #+67108864
        ORRS     R0,R0,R1
        LDR      R1,??DataTable2_5  ;; 0x40048004
        STR      R0,[R1, #+0]
//  103 #endif 
//  104 			 
//  105 #else
//  106 mcg_clk_hz = SystemCoreClock;
//  107 			 
//  108 if (CLOCK_SETUP == 3)
//  109 {
//  110 	// If PLL initialization is not desired, set FLL to 48 MHz clock in default FEI mode
//  111   MCG_C4 |= (MCG_C4_DRST_DRS(1) | MCG_C4_DMX32_MASK);
//  112         
//  113   SIM_SOPT2 &= ~SIM_SOPT2_PLLFLLSEL_MASK; // clear PLLFLLSEL to select the FLL for this clock source
//  114         
//  115   uart0_clk_khz = (mcg_clk_hz / 1000); // the uart0 clock frequency will equal the FLL frequency
//  116         
//  117   SIM_SOPT2 = ((SIM_SOPT2 & ~SIM_SOPT2_UART0SRC_MASK) | SIM_SOPT2_UART0SRC(1));
//  118 }
//  119 else
//  120 {      
//  121   SIM_SOPT2 |= SIM_SOPT2_PLLFLLSEL_MASK; // set PLLFLLSEL to select the PLL for this clock source
//  122     
//  123   uart0_clk_khz = ((mcg_clk_hz / 2) / 1000); // UART0 clock frequency will equal half the PLL frequency
//  124        
//  125   SIM_SOPT2 = ((SIM_SOPT2 & ~SIM_SOPT2_UART0SRC_MASK) | SIM_SOPT2_UART0SRC(1));
//  126 }
//  127 #endif    
//  128 
//  129 	/*
//  130          * Use the value obtained from the pll_init function to define variables
//  131 	 * for the core clock in kHz and also the peripheral clock. These
//  132 	 * variables can be used by other functions that need awareness of the
//  133 	 * system frequency.
//  134 	 */
//  135         mcg_clk_khz = mcg_clk_hz / 1000;
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_idiv
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  136   	core_clk_khz = mcg_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV1_MASK) >> 28)+ 1);
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0x40048044
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+28
        ADDS     R1,R1,#+1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  137         periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV4_MASK) >> 16)+ 1);
        LDR      R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0x40048044
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+16
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+29
        LSRS     R1,R1,#+29
        ADDS     R1,R1,#+1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  138         
//  139 #ifdef USE_ABORT_BUTTON
//  140         /* Enable pin interrupt for the abort button - PTA4 */
//  141         /* This pin could also be used as the NMI interrupt, but since the NMI
//  142          * is level sensitive each button press will cause multiple interrupts.
//  143          * Using the GPIO interrupt instead means we can configure for an edge
//  144          * sensitive interrupt instead = one interrupt per button press.
//  145          */
//  146         enable_abort_button();
//  147 #endif
//  148         
//  149         
//  150         /*
//  151          * Configure the UART terminal port pins.  These definitions are 
//  152          * defined in the platform header file.
//  153          */
//  154         
//  155         PORT_PCR_REG(TERM_PIN_PORT, TERM_RX_PIN) = PORT_PCR_MUX(TERM_MUX_ALT);
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        LDR      R1,??DataTable2_11  ;; 0x40049004
        STR      R0,[R1, #+0]
//  156         PORT_PCR_REG(TERM_PIN_PORT, TERM_TX_PIN) = PORT_PCR_MUX(TERM_MUX_ALT);
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        LDR      R1,??DataTable2_12  ;; 0x40049008
        STR      R0,[R1, #+0]
//  157         
//  158   	/* UART0 is clocked asynchronously to the core clock, but all other UARTs are
//  159          * clocked from the peripheral clock. So we have to determine which clock
//  160          * to send to the UART_init function.
//  161          */
//  162         if (TERM_PORT_NUM == 0)
//  163             uart0_init (UART0_BASE_PTR, uart0_clk_khz, TERMINAL_BAUD);
        MOVS     R2,#+150
        LSLS     R2,R2,#+7        ;; #+19200
        LDR      R0,??DataTable2_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_13  ;; 0x4006a000
        BL       uart0_init
//  164         else if (TERM_PORT_NUM == 1)
//  165   	    uart_init (UART1_BASE_PTR, periph_clk_khz, TERMINAL_BAUD);
//  166         else if (TERM_PORT_NUM == 2)
//  167             uart_init (UART2_BASE_PTR, periph_clk_khz, TERMINAL_BAUD);
//  168         else
//  169           while(1);
//  170 }
        POP      {R0-R2,PC}       ;; return
//  171 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void enable_abort_button(void)
//  173 {
enable_abort_button:
        PUSH     {R7,LR}
//  174     /* Configure the PTA4 pin for its GPIO function */
//  175     PORTA_PCR4 = PORT_PCR_MUX(0x1); // GPIO is alt1 function for this pin
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        LDR      R1,??DataTable2_14  ;; 0x40049010
        STR      R0,[R1, #+0]
//  176     
//  177     /* Configure the PTA4 pin for rising edge interrupts */
//  178     PORTA_PCR4 |= PORT_PCR_IRQC(0x9); 
        LDR      R0,??DataTable2_14  ;; 0x40049010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+144
        LSLS     R1,R1,#+12       ;; #+589824
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_14  ;; 0x40049010
        STR      R1,[R0, #+0]
//  179     
//  180 #ifdef CMSIS
//  181     /* Enable the associated IRQ in the NVIC */
//  182     enable_irq(PORTA_IRQn);      
//  183 #else
//  184 	  enable_irq(30); 
        MOVS     R0,#+30
        BL       enable_irq
//  185 #endif	
//  186 }
        POP      {R0,PC}          ;; return
//  187 /********************************************************************/
//  188 
//  189 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void clk_out_init(void)
//  191 {
//  192 
//  193     // If you are using UART1 for serial communications do not
//  194     // initialize the clock out function or you may break the UART!
//  195     if (TERM_PORT_NUM != 1)
//  196     {
//  197         /* Enable the CLKOUT function on PTC3 (alt5 function) */
//  198 	PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
clk_out_init:
        MOVS     R0,#+160
        LSLS     R0,R0,#+3        ;; #+1280
        LDR      R1,??DataTable2_15  ;; 0x4004b00c
        STR      R0,[R1, #+0]
//  199         
//  200         /* Select the CLKOUT in the SMI_SOPT2 mux to be bus clk*/
//  201         SIM_SOPT2 |= SIM_SOPT2_CLKOUTSEL(2);
        LDR      R0,??DataTable2_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_5  ;; 0x40048004
        STR      R1,[R0, #+0]
//  202     }
//  203         
//  204 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4007d002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     mcg_clk_hz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     uart0_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0xf3ffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     mcg_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40049004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x40049008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x40049010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x4004b00c

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
//  28 bytes in section .bss
// 344 bytes in section .text
// 
// 344 bytes of CODE memory
//  28 bytes of DATA memory
//
//Errors: none
//Warnings: none
