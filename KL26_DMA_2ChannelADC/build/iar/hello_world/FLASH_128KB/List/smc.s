///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  13:23:58
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\drivers\smc\smc.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\drivers\smc\smc.c -D IAR
//        -D FREEDOM -lCN
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
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\smc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN stop
        EXTERN wait

        PUBLIC deepsleep
        PUBLIC enter_lls
        PUBLIC enter_stop
        PUBLIC enter_vlls0
        PUBLIC enter_vlls0_nopor
        PUBLIC enter_vlls1
        PUBLIC enter_vlls2
        PUBLIC enter_vlls3
        PUBLIC enter_vlpr
        PUBLIC enter_vlps
        PUBLIC enter_wait
        PUBLIC exit_vlpr
        PUBLIC sleep

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\drivers\smc\smc.c
//    1 /*
//    2  * File:        smc.c
//    3  * Purpose:     Provides routines for entering low power modes.
//    4  *
//    5  * Notes:	Since the wakeup mechanism for low power modes
//    6  *              will be application specific, these routines
//    7  *              do not include code to setup interrupts to exit
//    8  *              from the low power modes. The desired means of
//    9  *              low power mode exit should be configured before
//   10  *              calling any of these functions.
//   11  *
//   12  *              These routines do not include protection to
//   13  *              prevent illegal state transitions in the mode
//   14  *              controller, and all routines that write to the
//   15  *              PMPROT register write a value to allow all
//   16  *              possible low power modes (it is write once, so
//   17  *              if only the currently requested mode is enabled
//   18  *              a different mode couldn't be enabled later on).
//   19  *              
//   20  */
//   21 
//   22 #include "common.h"
//   23 #include "smc.h"
//   24 
//   25 /***************************************************************/
//   26 /*
//   27  * Configures the ARM system control register for WAIT(sleep)mode
//   28  * and then executes the WFI instruction to enter the mode.
//   29  *
//   30  * Parameters:
//   31  * none
//   32  *
//   33  */
//   34 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   35 void sleep (void)
//   36 {
//   37 /* Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) 
//   38  * mode instead of deep sleep.
//   39  */
//   40 SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;
sleep:
        LDR      R0,??DataTable10  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable10  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//   41 
//   42 #if (defined(CMSIS))
//   43   __wfi();
//   44 #elif (defined(KEIL))
//   45 	__wfi();
//   46 #else
//   47   /* WFI instruction will start entry into WAIT mode */
//   48   asm("WFI");
        WFI
//   49 #endif 
//   50 }
        BX       LR               ;; return
//   51 /***************************************************************/
//   52 /*
//   53  * Configures the ARM system control register for STOP  
//   54  * (deepsleep) mode and then executes the WFI instruction 
//   55  * to enter the mode.
//   56  *
//   57  * Parameters:
//   58  * none
//   59  *
//   60  */
//   61 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   62 void deepsleep (void)
//   63 {
//   64   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//   65   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
deepsleep:
        LDR      R0,??DataTable10  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable10  ;; 0xe000ed10
        STR      R1,[R0, #+0]
//   66 
//   67 #if (defined(CMSIS))
//   68   __wfi();
//   69 #elif (defined(KEIL))
//   70 	__wfi();
//   71 #else
//   72   /* WFI instruction will start entry into STOP mode */
//   73   asm("WFI");
        WFI
//   74 #endif
//   75 }
        BX       LR               ;; return
//   76 /********************************************************************/
//   77 /* WAIT mode entry routine. Puts the processor into wait mode.
//   78  * In this mode the core clock is disabled (no code executing), but 
//   79  * bus clocks are enabled (peripheral modules are operational). 
//   80  *
//   81  * Mode transitions:
//   82  * RUN -> WAIT
//   83  * VLPR -> VLPW
//   84  *
//   85  * This function can be used to enter normal wait mode or VLPW
//   86  * mode. If you are executing in normal run mode when calling this
//   87  * function, then you will enter normal wait mode. If you are in VLPR
//   88  * mode when calling this function, then you will enter VLPW mode instead.
//   89  *
//   90  * NOTE: Some modules include a programmable option to disable them in 
//   91  * wait mode. If those modules are programmed to disable in wait mode, 
//   92  * they will not be able to generate interrupts to wake up the core.
//   93  *
//   94  * WAIT mode is exited using any enabled interrupt or RESET, so no
//   95  * exit_wait routine is needed. 
//   96  * 
//   97  * 
//   98  * Parameters:
//   99  * none
//  100  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 void enter_wait(void)
//  102 {
enter_wait:
        PUSH     {R7,LR}
//  103 #ifdef CMSIS
//  104     /* Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) mode instead
//  105      * of deep sleep.
//  106      */
//  107 	SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;
//  108         
//  109     __wfi();
//  110 #else
//  111     wait();
        BL       wait
//  112 #endif
//  113 }
        POP      {R0,PC}          ;; return
//  114 /********************************************************************/
//  115 /* STOP mode entry routine. Puts the processor into normal stop mode.
//  116  * In this mode core, bus and peripheral clocks are disabled.
//  117  *
//  118  * Mode transitions:
//  119  * RUN -> STOP
//  120  *
//  121  * This function can be used to enter normal stop mode. 
//  122  * If you are executing in normal run mode when calling this
//  123  * function and AVLP = 0, then you will enter normal stop mode. 
//  124  * If AVLP = 1 with previous write to PMPROT
//  125  * then you will enter VLPS mode instead.
//  126  *
//  127  * STOP mode is exited using any enabled interrupt or RESET, so no
//  128  * exit_stop routine is needed.
//  129  *
//  130  * Parameters:
//  131  * Partial Stop Option:  
//  132  *  0x00 = STOP - Normal Stop Mode
//  133  *  0x40 = PSTOP1 - Partial Stop with both system and bus clocks disabled
//  134  *  0x80 = PSTOP2 - Partial Stop with system clock disabled and bus clock enabled
//  135  *  0xC0 = Reserved
//  136  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  137 void enter_stop(unsigned char partial_stop_opt)
//  138 {
enter_stop:
        PUSH     {R7,LR}
//  139   volatile unsigned int dummyread;
//  140   /* The PMPROT register may have already been written by init code
//  141      If so then this next write is not done since  
//  142      PMPROT is write once after RESET  
//  143      this write-once bit allows the MCU to enter the
//  144      normal STOP mode.
//  145      If AVLP is already a 1, VLPS mode is entered instead of normal STOP*/
//  146   SMC_PMPROT = 0;  
        MOVS     R1,#+0
        LDR      R2,??DataTable10_1  ;; 0x4007e000
        STRB     R1,[R2, #+0]
//  147 
//  148   /* Set the STOPM field to 0b000 for normal STOP mode */
//  149   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK;
        LDR      R1,??DataTable11  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+248
        ANDS     R2,R2,R1
        LDR      R1,??DataTable11  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  150   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0); 
        LDR      R1,??DataTable11  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        LDR      R2,??DataTable11  ;; 0x4007e001
        STRB     R1,[R2, #+0]
//  151   SMC_STOPCTRL &= ~SMC_STOPCTRL_PSTOPO_MASK;
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+26       ;; ZeroExtS R1,R1,#+26,#+26
        LSRS     R1,R1,#+26
        LDR      R2,??DataTable10_2  ;; 0x4007e002
        STRB     R1,[R2, #+0]
//  152   SMC_STOPCTRL |= partial_stop_opt;
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        LDRB     R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  153   /*wait for write to complete to SMC before stopping core */  
//  154   dummyread = SMC_PMCTRL;
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  155   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  156   
//  157 #ifdef CMSIS
//  158   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  159   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  160   __wfi();
//  161 #else
//  162   stop();
        BL       stop
//  163 #endif
//  164 }
        POP      {R0,PC}          ;; return
//  165 /****************************************************************/
//  166 /* VLPR mode entry routine.Puts the processor into very low power
//  167  * run mode. In this mode all clocks are enabled, but the core clock limited. 
//  168  * The flash clock is limited to 1MHz or less. 
//  169  *
//  170  * Mode transitions:
//  171  * RUN -> VLPR
//  172  *
//  173  * exit_vlpr() function can be used 
//  174  * to switch from VLPR back to RUN. 
//  175  * 
//  176  * while in VLPR,VLPW or VLPS the exit to VLPR is not possible  
//  177  *
//  178  *
//  179  * Parameters:
//  180  * Return value : PMSTAT value or error code
//  181  *                PMSTAT = return_value = PMSTAT
//  182  *                         000_0001 Current power mode is RUN
//  183  *                         000_0100 Current power mode is VLPR
//  184  *                ERROR Code =  0x14 - already in VLPR mode
//  185  *                           =  0x24 - REGONS never clear indicating stop regulation
//  186  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  187 int enter_vlpr(void)
//  188 {
enter_vlpr:
        PUSH     {LR}
//  189   int i; 
//  190   unsigned int return_value = 0;
        MOVS     R0,#+0
//  191   if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 4){
        LDR      R1,??DataTable11_1  ;; 0x4007e003
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+25       ;; ZeroExtS R1,R1,#+25,#+25
        LSRS     R1,R1,#+25
        CMP      R1,#+4
        BNE      ??enter_vlpr_0
//  192          return_value = 0x14;
        MOVS     R0,#+20
//  193          }
//  194   /* The PMPROT register may have already been written by init code
//  195      If so then this next write is not done.  
//  196      PMPROT is write once after RESET  
//  197      this write-once bit allows the MCU to enter the
//  198      very low power modes: VLPR, VLPW, and VLPS   */
//  199   SMC_PMPROT = SMC_PMPROT_AVLP_MASK;  
??enter_vlpr_0:
        MOVS     R1,#+32
        LDR      R2,??DataTable10_1  ;; 0x4007e000
        STRB     R1,[R2, #+0]
//  200     
//  201   /* Set the (for MC1)LPLLSM or (for MC2)STOPM field 
//  202      to 0b010 for VLPS mode -
//  203      and RUNM bits to 0b010 for VLPR mode  */
//  204   SMC_PMCTRL &= ~SMC_PMCTRL_RUNM_MASK; 
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+159
        ANDS     R2,R2,R1
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  205   SMC_PMCTRL  |= SMC_PMCTRL_RUNM(0x2);
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+64
        ORRS     R2,R2,R1
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  206   /* Wait for VLPS regulator mode to be confirmed */
//  207   for (i = 0 ; i < 10000 ; i++)
        MOVS     R1,#+0
        B        ??enter_vlpr_1
??enter_vlpr_2:
        ADDS     R1,R1,#+1
??enter_vlpr_1:
        LDR      R2,??DataTable11_2  ;; 0x2710
        CMP      R1,R2
        BGE      ??enter_vlpr_3
//  208     {     /* check that the value of REGONS bit is not 0
//  209              once it is a zero we can stop checking */
//  210       if ((PMC_REGSC & PMC_REGSC_REGONS_MASK) ==0x04){
        LDR      R2,??DataTable11_3  ;; 0x4007d002
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2
        LSLS     R2,R2,#+29
        BMI      ??enter_vlpr_2
//  211        /* 0 Regulator is in stop regulation or in transition 
//  212             to/from it
//  213           1 MCU is in Run regulation mode */
//  214       }  
//  215       else  break;
//  216     }  
//  217   if ((PMC_REGSC & PMC_REGSC_REGONS_MASK) ==0x04) 
??enter_vlpr_3:
        LDR      R1,??DataTable11_3  ;; 0x4007d002
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+29
        BPL      ??enter_vlpr_4
//  218     {  
//  219       return_value = 0x24; 
        MOVS     R0,#+36
//  220     }
//  221   /* SMC_PMSTAT register only exist in Mode Controller 2 MCU versions */
//  222   if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK) == 4)  
??enter_vlpr_4:
        LDR      R1,??DataTable11_1  ;; 0x4007e003
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+25       ;; ZeroExtS R1,R1,#+25,#+25
        LSRS     R1,R1,#+25
        CMP      R1,#+4
        BNE      ??enter_vlpr_5
//  223     {
//  224       return_value = SMC_PMSTAT;
        LDR      R0,??DataTable11_1  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
//  225     }
//  226   return (return_value);
??enter_vlpr_5:
        POP      {PC}             ;; return
//  227 }
//  228 /********************************************************************/
//  229 /* VLPR mode exit routine. Puts the processor into normal run mode
//  230  * from VLPR mode. You can transition from VLPR to normal run using
//  231  * this function.
//  232  *
//  233  * Mode transitions:
//  234  * VLPR -> RUN
//  235  *
//  236  * Parameters:
//  237  * none
//  238  */
//  239  /********************************************************************/
//  240 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  241 void exit_vlpr(void)
//  242 {
exit_vlpr:
        PUSH     {LR}
//  243     int i;
//  244     /* check to make sure in VLPR before exiting    */
//  245     if  ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 4) {
        LDR      R0,??DataTable11_1  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        CMP      R0,#+4
        BNE      ??exit_vlpr_0
//  246       
//  247        /* Clear RUNM */
//  248        SMC_PMCTRL &= ~SMC_PMCTRL_RUNM_MASK;
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+159
        ANDS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  249                       
//  250        /* Wait for normal RUN regulation mode to be confirmed */                   
//  251        // 1 PMSTAT MCU is in RUN  mode
//  252        // 4 PMSTAT MCU is in VLPR mode
//  253        for (i=0;i<0xff;i++)
        MOVS     R0,#+0
        B        ??exit_vlpr_1
//  254        {
//  255            if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 1)
??exit_vlpr_2:
        LDR      R1,??DataTable11_1  ;; 0x4007e003
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+25       ;; ZeroExtS R1,R1,#+25,#+25
        LSRS     R1,R1,#+25
        CMP      R1,#+1
        BNE      ??exit_vlpr_3
//  256              if ((PMC_REGSC & PMC_REGSC_REGONS_MASK) == 1)
        LDR      R1,??DataTable11_3  ;; 0x4007d002
        LDRB     R1,[R1, #+0]
//  257     	        break;
//  258        }           
??exit_vlpr_3:
        ADDS     R0,R0,#+1
??exit_vlpr_1:
        CMP      R0,#+255
        BLT      ??exit_vlpr_2
//  259     }  //if in VLPR mode
//  260      // else if not in VLPR ignore call
//  261 }
??exit_vlpr_0:
        POP      {PC}             ;; return
//  262 /***************************************************************/
//  263 /* VLPS mode entry routine. Puts the processor into VLPS mode 
//  264  * directly from run or VLPR modes. 
//  265  *
//  266  * Mode transitions:
//  267  * RUN  -> VLPS
//  268  * VLPR -> VLPS
//  269  *
//  270  * Note, when VLPS is entered directly from RUN or VLPR mode, 
//  271  * exit to VLPR is disabled by hardware and the system will
//  272  * always exit back to RUN.
//  273  *
//  274  * Parameters:  
//  275  * none
//  276  */
//  277  /****************************************************************/
//  278 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  279 void enter_vlps(void)
//  280 {
enter_vlps:
        PUSH     {R7,LR}
//  281   volatile unsigned int dummyread;
//  282   /* The PMPROT register may have already been written by init code
//  283      If so then this next write is not done since  
//  284      PMPROT is write once after RESET 
//  285      allows the MCU to enter the VLPR, VLPW, and VLPS modes.
//  286      If AVLP is already writen to 0 
//  287      Stop is entered instead of VLPS*/
//  288   SMC_PMPROT = SMC_PMPROT_AVLP_MASK;           
        MOVS     R0,#+32
        LDR      R1,??DataTable10_1  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  289   /* Set the STOPM field to 0b010 for VLPS mode */
//  290   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  291   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x2); 
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  292   /*wait for write to complete to SMC before stopping core */  
//  293   dummyread = SMC_PMCTRL;
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  294   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  295   /* Now execute the stop instruction to go into VLPS */
//  296   #ifdef CMSIS
//  297   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  298   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  299   __wfi();
//  300 #else
//  301   stop();
        BL       stop
//  302 #endif
//  303 }
        POP      {R0,PC}          ;; return
//  304 /****************************************************************/
//  305 /* LLS mode entry routine. Puts the processor into LLS mode from
//  306  * normal run mode or VLPR. 
//  307  *
//  308  * Mode transitions:
//  309  * RUN -> LLS
//  310  * VLPR -> LLS
//  311  *
//  312  * NOTE: LLS mode will always exit to RUN mode even if you were 
//  313  * in VLPR mode before entering LLS.
//  314  *
//  315  * Wakeup from LLS mode is controlled by the LLWU module. Most
//  316  * modules cannot issue a wakeup interrupt in LLS mode, so make
//  317  * sure to setup the desired wakeup sources in the LLWU before 
//  318  * calling this function.
//  319  *
//  320  * Parameters:
//  321  * none
//  322  */
//  323  /********************************************************************/
//  324 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  325 void enter_lls(void)
//  326 {
enter_lls:
        PUSH     {R7,LR}
//  327   volatile unsigned int dummyread;
//  328   /* Write to PMPROT to allow LLS power modes this write-once 
//  329      bit allows the MCU to enter the LLS low power mode*/
//  330   SMC_PMPROT = SMC_PMPROT_ALLS_MASK;   
        MOVS     R0,#+8
        LDR      R1,??DataTable10_1  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  331   /* Set the STOPM field to 0b011 for LLS mode  */
//  332   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  333   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x3); 
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  334   /*wait for write to complete to SMC before stopping core */  
//  335   dummyread = SMC_PMCTRL;
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  336   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  337   /* Now execute the stop instruction to go into LLS */
//  338   #ifdef CMSIS
//  339   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  340   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  341   __wfi();
//  342 #else
//  343   stop();
        BL       stop
//  344 #endif
//  345 }
        POP      {R0,PC}          ;; return
//  346 /***************************************************************/
//  347 /* VLLS3 mode entry routine. Puts the processor into 
//  348  * VLLS3 mode from normal run mode or VLPR. 
//  349  *
//  350  * Mode transitions:
//  351  * RUN -> VLLS3
//  352  * VLPR -> VLLS3
//  353  *
//  354  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  355  * in VLPR mode before entering VLLSx.
//  356  *
//  357  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  358  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  359  * sure to setup the desired wakeup sources in the LLWU before 
//  360  * calling this function.
//  361  *
//  362  * Parameters:
//  363  * none  
//  364  */
//  365  /********************************************************************/
//  366 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  367 void enter_vlls3(void)
//  368 {
enter_vlls3:
        PUSH     {R7,LR}
//  369   volatile unsigned int dummyread;
//  370   /* Write to PMPROT to allow VLLS3 power modes */
//  371   SMC_PMPROT = SMC_PMPROT_AVLLS_MASK;      
        MOVS     R0,#+2
        LDR      R1,??DataTable10_1  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  372   /* Set the STOPM field to 0b100 for VLLS3 mode */
//  373   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  374   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x4); 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  375   /* set VLLSM = 0b11 */
//  376   SMC_STOPCTRL =  SMC_STOPCTRL_VLLSM(3);          
        MOVS     R0,#+3
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  377   /*wait for write to complete to SMC before stopping core */  
//  378   dummyread = SMC_STOPCTRL;
        LDR      R0,??DataTable10_2  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  379   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  380   /* Now execute the stop instruction to go into VLLS3 */
//  381   #ifdef CMSIS
//  382   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  383   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  384   __wfi();
//  385 #else
//  386   stop();
        BL       stop
//  387 #endif
//  388 }
        POP      {R0,PC}          ;; return
//  389 /***************************************************************/
//  390 /* VLLS2 mode entry routine. Puts the processor into 
//  391  * VLLS2 mode from normal run mode or VLPR. 
//  392  *
//  393  * Mode transitions:
//  394  * RUN -> VLLS2
//  395  * VLPR -> VLLS2
//  396  *
//  397  * NOTE: VLLSx modes will always exit to RUN mode even  
//  398  *       if you werein VLPR mode before entering VLLSx.
//  399  *
//  400  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  401  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  402  * sure to setup the desired wakeup sources in the LLWU before 
//  403  * calling this function.
//  404  *
//  405  * Parameters:
//  406  * none  
//  407  */
//  408  /********************************************************************/
//  409 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  410 void enter_vlls2(void)
//  411 {
enter_vlls2:
        PUSH     {R7,LR}
//  412   volatile unsigned int dummyread;
//  413   /* Write to PMPROT to allow VLLS2 power modes */
//  414   SMC_PMPROT = SMC_PMPROT_AVLLS_MASK;      
        MOVS     R0,#+2
        LDR      R1,??DataTable10_1  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  415   /* Set the STOPM field to 0b100 for VLLS2 mode */
//  416   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  417   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x4); 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  418   /* set VLLSM = 0b10 */
//  419   SMC_STOPCTRL =  SMC_STOPCTRL_VLLSM(2);                
        MOVS     R0,#+2
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  420   /*wait for write to complete to SMC before stopping core */  
//  421   dummyread = SMC_STOPCTRL;
        LDR      R0,??DataTable10_2  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  422   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  423   /* Now execute the stop instruction to go into VLLS2 */
//  424   #ifdef CMSIS
//  425   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  426   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  427   __wfi();
//  428 #else
//  429   stop();
        BL       stop
//  430 #endif
//  431 }
        POP      {R0,PC}          ;; return
//  432 /***************************************************************/
//  433 /* VLLS1 mode entry routine. Puts the processor into 
//  434  * VLLS1 mode from normal run mode or VLPR. 
//  435  *
//  436  * Mode transitions:
//  437  * RUN -> VLLS1
//  438  * VLPR -> VLLS1
//  439  *
//  440  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  441  * in VLPR mode before entering VLLSx.
//  442  *
//  443  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  444  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  445  * sure to setup the desired wakeup sources in the LLWU before 
//  446  * calling this function.
//  447  *
//  448  * Parameters:
//  449  * none  
//  450  */
//  451  /********************************************************************/
//  452 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  453 void enter_vlls1(void)
//  454 {
enter_vlls1:
        PUSH     {R7,LR}
//  455   volatile unsigned int dummyread;
//  456   SMC_PMPROT = SMC_PMPROT_AVLLS_MASK;
        MOVS     R0,#+2
        LDR      R1,??DataTable10_1  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  457     
//  458   /* Write to PMPROT to allow all possible power modes */
//  459   /* Set the STOPM field to 0b100 for VLLS1 mode */
//  460   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  461   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x4); 
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable10_3  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  462   /* set VLLSM = 0b01 */
//  463   SMC_STOPCTRL =  SMC_STOPCTRL_VLLSM(1);          
        MOVS     R0,#+1
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  464   /*wait for write to complete to SMC before stopping core */  
//  465   dummyread = SMC_STOPCTRL;
        LDR      R0,??DataTable10_2  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  466   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  467   /* Now execute the stop instruction to go into VLLS1 */
//  468   #ifdef CMSIS
//  469   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  470   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  471   __wfi();
//  472 #else
//  473   stop();
        BL       stop
//  474 #endif
//  475 }
        POP      {R0,PC}          ;; return
//  476 
//  477 /********************************************************************/
//  478 /* VLLS0 mode entry routine. Puts the processor into VLLS0 mode from
//  479  * normal run mode or VLPR. 
//  480  *
//  481  * Mode transitions:
//  482  * RUN -> VLLS0
//  483  * VLPR -> VLLS0
//  484  *
//  485  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  486  * in VLPR mode before entering VLLSx.
//  487  *
//  488  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  489  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  490  * sure to setup the desired wakeup sources in the LLWU before 
//  491  * calling this function.
//  492  *
//  493  * Parameters:
//  494  * PORPO_value - 0 POR detect circuit is enabled in VLLS0
//  495  *               1 POR detect circuit is disabled in VLLS0
//  496  */
//  497  /***************************************************************/
//  498 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  499 void enter_vlls0(unsigned char PORPO_value )
//  500 {
enter_vlls0:
        PUSH     {R7,LR}
//  501   volatile unsigned int dummyread;
//  502   int i;
//  503   /* Write to PMPROT to allow all possible power modes */
//  504   SMC_PMPROT = SMC_PMPROT_AVLLS_MASK;   
        MOVS     R1,#+2
        LDR      R2,??DataTable10_1  ;; 0x4007e000
        STRB     R1,[R2, #+0]
//  505   if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 4){
        LDR      R1,??DataTable11_1  ;; 0x4007e003
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+25       ;; ZeroExtS R1,R1,#+25,#+25
        LSRS     R1,R1,#+25
        CMP      R1,#+4
        BNE      ??enter_vlls0_0
//  506      SMC_PMCTRL &= ~SMC_PMCTRL_RUNM_MASK;   // go back to RUN mode temporarily
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+159
        ANDS     R2,R2,R1
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  507      for (i=0;i<0xff;i++)
        MOVS     R1,#+0
        B        ??enter_vlls0_1
??enter_vlls0_2:
        ADDS     R1,R1,#+1
??enter_vlls0_1:
        CMP      R1,#+255
        BGE      ??enter_vlls0_0
//  508        {
//  509        if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 1)
        LDR      R2,??DataTable11_1  ;; 0x4007e003
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2
        LSLS     R2,R2,#+25       ;; ZeroExtS R2,R2,#+25,#+25
        LSRS     R2,R2,#+25
        CMP      R2,#+1
        BNE      ??enter_vlls0_2
//  510     	 break;
//  511        }
//  512   }
//  513   /* Set the STOPM field to 0b100 for VLLS0 mode */
//  514   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
??enter_vlls0_0:
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+248
        ANDS     R2,R2,R1
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  515   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x4); 
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        LDR      R1,??DataTable10_3  ;; 0x4007e001
        STRB     R2,[R1, #+0]
//  516   /* set VLLSM = 0b00 */
//  517   SMC_STOPCTRL &= ~SMC_STOPCTRL_VLLSM_MASK;
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+248
        ANDS     R2,R2,R1
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R2,[R1, #+0]
//  518   SMC_STOPCTRL &= ~SMC_STOPCTRL_PORPO_MASK;
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+223
        ANDS     R2,R2,R1
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R2,[R1, #+0]
//  519   SMC_STOPCTRL |=  (PORPO_value <<SMC_STOPCTRL_PORPO_SHIFT) 
//  520                  | SMC_STOPCTRL_VLLSM(0);          
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0
        LSLS     R0,R0,#+5
        ORRS     R0,R0,R1
        LDR      R1,??DataTable10_2  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  521   /*wait for write to complete to SMC before stopping core */  
//  522   dummyread = SMC_STOPCTRL;
        LDR      R0,??DataTable10_2  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  523   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  524   /* Now execute the stop instruction to go into VLLS0 */
//  525   #ifdef CMSIS
//  526   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  527   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  528   __wfi();
//  529 #else
//  530   stop();
        BL       stop
//  531 #endif
//  532 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x4007e000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x4007e002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x4007e001
//  533 /***************************************************************/
//  534 /* VLLS0 mode entry routine. Puts the processor into VLLS0 mode from
//  535  * normal run mode or VLPR with the POR circuit disabled
//  536  *
//  537  * Mode transitions:
//  538  * RUN -> VLLS0
//  539  * VLPR -> VLLS0
//  540  *
//  541  * NOTE: VLLSx modes will always exit to RUN mode even if you were 
//  542  * in VLPR mode before entering VLLSx.
//  543  *
//  544  * Wakeup from VLLSx mode is controlled by the LLWU module. Most
//  545  * modules cannot issue a wakeup interrupt in VLLSx mode, so make
//  546  * sure to setup the desired wakeup sources in the LLWU before 
//  547  * calling this function.
//  548  *
//  549  * Parameters:
//  550  * PORPO = 1-  POR detect circuit is disabled in VLLS0
//  551  */
//  552 /***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  553 void enter_vlls0_nopor(void)
//  554 {
enter_vlls0_nopor:
        PUSH     {R7,LR}
//  555   volatile unsigned int dummyread;
//  556   int i;
//  557   /* Write to PMPROT to allow all possible power modes */
//  558   SMC_PMPROT = SMC_PMPROT_AVLLS_MASK;   
        MOVS     R0,#+2
        LDR      R1,??DataTable11_4  ;; 0x4007e000
        STRB     R0,[R1, #+0]
//  559   if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 4){
        LDR      R0,??DataTable11_1  ;; 0x4007e003
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        CMP      R0,#+4
        BNE      ??enter_vlls0_nopor_0
//  560      SMC_PMCTRL &= ~SMC_PMCTRL_RUNM_MASK;   // go back to RUN mode temporarily
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+159
        ANDS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  561      for (i=0;i<0xff;i++)
        MOVS     R0,#+0
        B        ??enter_vlls0_nopor_1
??enter_vlls0_nopor_2:
        ADDS     R0,R0,#+1
??enter_vlls0_nopor_1:
        CMP      R0,#+255
        BGE      ??enter_vlls0_nopor_0
//  562        {
//  563        if ((SMC_PMSTAT & SMC_PMSTAT_PMSTAT_MASK)== 1)
        LDR      R1,??DataTable11_1  ;; 0x4007e003
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1
        LSLS     R1,R1,#+25       ;; ZeroExtS R1,R1,#+25,#+25
        LSRS     R1,R1,#+25
        CMP      R1,#+1
        BNE      ??enter_vlls0_nopor_2
//  564     	 break;
//  565        }
//  566   }
//  567   /* Set the STOPM field to 0b100 for VLLS0 mode */
//  568   SMC_PMCTRL &= ~SMC_PMCTRL_STOPM_MASK; 
??enter_vlls0_nopor_0:
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  569   SMC_PMCTRL |=  SMC_PMCTRL_STOPM(0x4); 
        LDR      R0,??DataTable11  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11  ;; 0x4007e001
        STRB     R1,[R0, #+0]
//  570   /* set VLLSM = 00 * and PORPO = 1 */
//  571   SMC_STOPCTRL &= ~SMC_STOPCTRL_VLLSM_MASK;
        LDR      R0,??DataTable11_5  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        LDR      R0,??DataTable11_5  ;; 0x4007e002
        STRB     R1,[R0, #+0]
//  572   SMC_STOPCTRL =  SMC_STOPCTRL_VLLSM(0) | SMC_STOPCTRL_PORPO_MASK;  
        MOVS     R0,#+32
        LDR      R1,??DataTable11_5  ;; 0x4007e002
        STRB     R0,[R1, #+0]
//  573   /*wait for write to complete to SMC before stopping core */  
//  574   dummyread = SMC_STOPCTRL;
        LDR      R0,??DataTable11_5  ;; 0x4007e002
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        STR      R0,[SP, #+0]
//  575   dummyread = dummyread + 1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  576   /* Now execute the stop instruction to go into VLLS0 */
//  577   #ifdef CMSIS
//  578   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  579   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;
//  580   __wfi();
//  581 #else
//  582   stop();
        BL       stop
//  583 #endif
//  584 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x4007e001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x4007e003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x4007d002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x4007e000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x4007e002

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  585 
//  586 
//  587 /********************************************************************/
//  588 /********************End of Functions *******************************/
//  589 /********************************************************************/
//  590 
//  591 
//  592 
// 
// 852 bytes in section .text
// 
// 852 bytes of CODE memory
//
//Errors: none
//Warnings: none
