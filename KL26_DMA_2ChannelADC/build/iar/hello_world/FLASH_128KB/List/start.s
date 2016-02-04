///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  13:23:59
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\start.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\start.c -D IAR -D
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
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\start.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN common_startup
        EXTERN main
        EXTERN outSRS
        EXTERN printf
        EXTERN sysinit

        PUBLIC cpu_identify
        PUBLIC flash_identify
        PUBLIC start

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\cpu\start.c
//    1 /*
//    2  * File:	start.c
//    3  * Purpose:	Kinetis L Family start up routines. 
//    4  *
//    5  * Notes:		
//    6  */
//    7 
//    8 #include "start.h"
//    9 #include "common.h"
//   10 #include "sysinit.h"
//   11 #include "rcm.h"
//   12 
//   13 
//   14 /********************************************************************/
//   15 /*!
//   16  * \brief   Kinetis L Family Start
//   17  * \return  None
//   18  *
//   19  * This function calls all of the necessary startup routines and then 
//   20  * branches to the main process.
//   21  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void start(void)
//   23 {            
start:
        PUSH     {R7,LR}
//   24 		/* Disable the watchdog timer */
//   25     SIM_COPC = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable1  ;; 0x40048100
        STR      R0,[R1, #+0]
//   26     
//   27 #ifndef CMSIS    // If conforming to CMSIS, we do not need to perform this code
//   28 
//   29 
//   30 	/* Copy any vector or data sections that need to be in RAM */
//   31 	common_startup();
        BL       common_startup
//   32 #endif
//   33 
//   34 	/* Perform clock initialization, default UART initialization,
//   35      * initializes clock out function, and enables the abort button
//   36      */
//   37 	sysinit();
        BL       sysinit
//   38         
//   39         printf("\n\r\n\r");
        LDR      R0,??DataTable1_1
        BL       printf
//   40 	
//   41 	/* Determine the last cause(s) of reset */
//   42 	outSRS();	
        BL       outSRS
//   43 	
//   44 	/* Determine specific Kinetis L Family device and revision */
//   45 	cpu_identify();
        BL       cpu_identify
//   46 	
//   47 #ifndef CMSIS    // If conforming to CMSIS, we do not need to perform this code
//   48 	/* Jump to main process */
//   49 	main();
        BL       main
//   50 
//   51 	/* No actions to perform after this so wait forever */
//   52 	while(1);
??start_0:
        B        ??start_0
//   53 #endif 
//   54 }
//   55 /********************************************************************/
//   56 /*!
//   57  * \brief   Kinetis L Family Identify
//   58  * \return  None
//   59  *
//   60  * This is primarly a reporting function that displays information
//   61  * about the specific CPU to the default terminal including:
//   62  * - Kinetis family
//   63  * - package
//   64  * - die revision
//   65  * - P-flash size
//   66  * - Ram size
//   67  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   68 void cpu_identify (void)
//   69 {
cpu_identify:
        PUSH     {R7,LR}
//   70   uint16 temp;
//   71     /* Determine the Kinetis family */
//   72     switch((SIM_SDID & SIM_SDID_FAMID(0x7))>>SIM_SDID_FAMID_SHIFT) 
        LDR      R0,??DataTable1_2  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+28
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+0
        BEQ      ??cpu_identify_0
        CMP      R0,#+2
        BEQ      ??cpu_identify_1
        BCC      ??cpu_identify_2
        CMP      R0,#+4
        BEQ      ??cpu_identify_3
        BCC      ??cpu_identify_4
        B        ??cpu_identify_5
//   73     {  
//   74     	case 0x0:
//   75     		printf("\n\rKL0");
??cpu_identify_0:
        LDR      R0,??DataTable1_3
        BL       printf
//   76     		break;
        B        ??cpu_identify_6
//   77     	case 0x1:
//   78     		printf("\n\rKL1");
??cpu_identify_2:
        LDR      R0,??DataTable1_4
        BL       printf
//   79     		break;
        B        ??cpu_identify_6
//   80     	case 0x2:
//   81     		printf("\n\rKL2");
??cpu_identify_1:
        LDR      R0,??DataTable1_5
        BL       printf
//   82     		break;
        B        ??cpu_identify_6
//   83     	case 0x3:
//   84     		printf("\n\rKL3");
??cpu_identify_4:
        LDR      R0,??DataTable1_6
        BL       printf
//   85     		break;
        B        ??cpu_identify_6
//   86     	case 0x4:
//   87     		printf("\n\rKL4");
??cpu_identify_3:
        LDR      R0,??DataTable1_7
        BL       printf
//   88     		break;
        B        ??cpu_identify_6
//   89 	default:
//   90 		printf("\n\rUnrecognized Kinetis family device.\n\r");  
??cpu_identify_5:
        LDR      R0,??DataTable1_8
        BL       printf
//   91 		break;  	
//   92     }
//   93     
//   94     /* Determine Sub-Family ID */
//   95     switch((SIM_SDID & SIM_SDID_SUBFAMID(0x7))>>SIM_SDID_SUBFAMID_SHIFT) 
??cpu_identify_6:
        LDR      R0,??DataTable1_2  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+4
        BEQ      ??cpu_identify_7
        BCC      ??cpu_identify_8
        CMP      R0,#+6
        BEQ      ??cpu_identify_9
        BCC      ??cpu_identify_10
        B        ??cpu_identify_8
//   96     {  
//   97     	case 0x4:
//   98     		printf("4\n\r");
??cpu_identify_7:
        ADR      R0,??DataTable1_9  ;; "4\n\r"
        BL       printf
//   99     		break;
        B        ??cpu_identify_11
//  100     	case 0x5:
//  101     		printf("5\n\r");
??cpu_identify_10:
        ADR      R0,??DataTable1_10  ;; "5\n\r"
        BL       printf
//  102     		break;
        B        ??cpu_identify_11
//  103         case 0x6:
//  104                 printf("6\n\r");
??cpu_identify_9:
        ADR      R0,??DataTable1_11  ;; "6\n\r"
        BL       printf
//  105                 break;
        B        ??cpu_identify_11
//  106 	default:
//  107 		printf("\n\rUnrecognized Kinetis sub-family device.\n\r");  
??cpu_identify_8:
        LDR      R0,??DataTable1_12
        BL       printf
//  108 		break;  	
//  109     }
//  110     
//  111     /* Determine the package size */
//  112     switch((SIM_SDID & SIM_SDID_PINID(0xF))>>SIM_SDID_PINID_SHIFT) 
??cpu_identify_11:
        LDR      R0,??DataTable1_2  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??cpu_identify_12
        CMP      R0,#+1
        BEQ      ??cpu_identify_13
        CMP      R0,#+2
        BEQ      ??cpu_identify_14
        CMP      R0,#+4
        BEQ      ??cpu_identify_15
        CMP      R0,#+5
        BEQ      ??cpu_identify_16
        CMP      R0,#+6
        BEQ      ??cpu_identify_17
        CMP      R0,#+8
        BEQ      ??cpu_identify_18
        B        ??cpu_identify_19
//  113     {  
//  114     	case 0x0:
//  115     		printf("16pin\n\r");
??cpu_identify_12:
        LDR      R0,??DataTable1_13
        BL       printf
//  116     		break;
        B        ??cpu_identify_20
//  117     	case 0x1:
//  118     		printf("24pin\n\r");
??cpu_identify_13:
        LDR      R0,??DataTable1_14
        BL       printf
//  119     		break;
        B        ??cpu_identify_20
//  120     	case 0x2:
//  121     		printf("32pin\n\r");
??cpu_identify_14:
        LDR      R0,??DataTable2
        BL       printf
//  122     		break;
        B        ??cpu_identify_20
//  123     	case 0x4:
//  124     		printf("48pin\n\r");
??cpu_identify_15:
        LDR      R0,??DataTable2_1
        BL       printf
//  125     		break;
        B        ??cpu_identify_20
//  126     	case 0x5:
//  127     		printf("64pin\n\r");
??cpu_identify_16:
        LDR      R0,??DataTable2_2
        BL       printf
//  128                 break;
        B        ??cpu_identify_20
//  129         case 0x6:
//  130     		printf("80pin\n\r");
??cpu_identify_17:
        LDR      R0,??DataTable2_3
        BL       printf
//  131                 break;
        B        ??cpu_identify_20
//  132         case 0x8:
//  133     		printf("100pin\n\r");        
??cpu_identify_18:
        LDR      R0,??DataTable2_4
        BL       printf
//  134     		break;
        B        ??cpu_identify_20
//  135 	default:
//  136 		printf("\n\rUnrecognized Kinetis package code.      ");  
??cpu_identify_19:
        LDR      R0,??DataTable2_5
        BL       printf
//  137 		break;  	
//  138     }
//  139     
//  140     /* Determine Attribute ID */
//  141     switch((SIM_SDID & SIM_SDID_SERIESID(0x7))>>SIM_SDID_SERIESID_SHIFT) 
??cpu_identify_20:
        LDR      R0,??DataTable1_2  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+20
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+1
        BNE      ??cpu_identify_21
//  142     {  
//  143     	case 0x1:
//  144     		printf("\n\rLow Power Line with Cortex M0+\n\r\n\r");
        LDR      R0,??DataTable2_6
        BL       printf
//  145     		break;
        B        ??cpu_identify_22
//  146 	default:
//  147 		printf("\n\rUnrecognized Kinetis family attribute.\n\r");  
??cpu_identify_21:
        LDR      R0,??DataTable2_7
        BL       printf
//  148 		break;  	
//  149     } 
//  150     
//  151     /* Determine the System SRAM Size */
//  152     switch((SIM_SDID & SIM_SDID_SRAMSIZE(0x7))>>SIM_SDID_SRAMSIZE_SHIFT) 
??cpu_identify_22:
        LDR      R0,??DataTable1_2  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+0
        BEQ      ??cpu_identify_23
        CMP      R0,#+2
        BEQ      ??cpu_identify_24
        BCC      ??cpu_identify_25
        CMP      R0,#+4
        BEQ      ??cpu_identify_26
        BCC      ??cpu_identify_27
        CMP      R0,#+6
        BEQ      ??cpu_identify_28
        BCC      ??cpu_identify_29
        CMP      R0,#+7
        BEQ      ??cpu_identify_30
        B        ??cpu_identify_31
//  153     {  
//  154     	case 0x0:
//  155           printf("SRAM  size: 0.5 KB\n\r");
??cpu_identify_23:
        LDR      R0,??DataTable2_8
        BL       printf
//  156     		break;
        B        ??cpu_identify_32
//  157         case 0x1:
//  158           printf("SRAM  size:  1 KB\n\r");
??cpu_identify_25:
        LDR      R0,??DataTable2_9
        BL       printf
//  159           break;
        B        ??cpu_identify_32
//  160         case 0x2:
//  161           printf("SRAM  size:  2 KB\n\r");
??cpu_identify_24:
        LDR      R0,??DataTable2_10
        BL       printf
//  162           break;
        B        ??cpu_identify_32
//  163         case 0x3:
//  164           printf("SRAM  size:  4 KB\n\r");
??cpu_identify_27:
        LDR      R0,??DataTable2_11
        BL       printf
//  165           break;
        B        ??cpu_identify_32
//  166         case 0x4:
//  167           printf("SRAM  size:  8 KB\n\r");
??cpu_identify_26:
        LDR      R0,??DataTable2_12
        BL       printf
//  168           break;
        B        ??cpu_identify_32
//  169         case 0x5:
//  170           printf("SRAM  size:  16 KB\n\r");
??cpu_identify_29:
        LDR      R0,??DataTable2_13
        BL       printf
//  171           break;
        B        ??cpu_identify_32
//  172         case 0x6:
//  173           printf("SRAM  size:  32 KB\n\r");
??cpu_identify_28:
        LDR      R0,??DataTable2_14
        BL       printf
//  174           break;
        B        ??cpu_identify_32
//  175         case 0x7:
//  176           printf("SRAM  size:  64 KB\n\r");
??cpu_identify_30:
        LDR      R0,??DataTable2_15
        BL       printf
//  177           break;
        B        ??cpu_identify_32
//  178 	default:
//  179 		printf("\n\rUnrecognized SRAM Size.\n\r");  
??cpu_identify_31:
        LDR      R0,??DataTable2_16
        BL       printf
//  180 		break;  	
//  181     }                
//  182     
//  183     /* Determine the flash revision */
//  184     //flash_identify();    
//  185     
//  186     /* Determine the P-flash size */
//  187   switch((SIM_FCFG1 & SIM_FCFG1_PFSIZE(0xF))>>SIM_FCFG1_PFSIZE_SHIFT)
??cpu_identify_32:
        LDR      R0,??DataTable2_17  ;; 0x4004804c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??cpu_identify_33
        CMP      R0,#+1
        BEQ      ??cpu_identify_34
        CMP      R0,#+3
        BEQ      ??cpu_identify_35
        CMP      R0,#+5
        BEQ      ??cpu_identify_36
        CMP      R0,#+7
        BEQ      ??cpu_identify_37
        CMP      R0,#+9
        BEQ      ??cpu_identify_38
        CMP      R0,#+15
        BEQ      ??cpu_identify_39
        B        ??cpu_identify_40
//  188     {
//  189   	case 0x0:
//  190     		printf("Flash size:  8 KB program flash, 0.25 KB protection region\n\r");
??cpu_identify_33:
        LDR      R0,??DataTable2_18
        BL       printf
//  191     		break;
        B        ??cpu_identify_41
//  192     	case 0x1:
//  193     		printf("Flash size:  16 KB program flash, 0.5 KB protection region\n\r");
??cpu_identify_34:
        LDR      R0,??DataTable2_19
        BL       printf
//  194     		break;
        B        ??cpu_identify_41
//  195         case 0x3:
//  196     		printf("Flash size:  32 KB program flash, 1 KB protection region\n\r");
??cpu_identify_35:
        LDR      R0,??DataTable2_20
        BL       printf
//  197     		break;
        B        ??cpu_identify_41
//  198     	case 0x5:
//  199     		printf("Flash size:  64 KB program flash, 2 KB protection region\n\r");
??cpu_identify_36:
        LDR      R0,??DataTable2_21
        BL       printf
//  200     		break;
        B        ??cpu_identify_41
//  201         case 0x7:
//  202     		printf("Flash size:  128 KB program flash, 4 KB protection region\n\r");
??cpu_identify_37:
        LDR      R0,??DataTable2_22
        BL       printf
//  203     		break;
        B        ??cpu_identify_41
//  204         case 0x9:
//  205     		printf("Flash size:  256 KB program flash, 4 KB protection region\n\r");
??cpu_identify_38:
        LDR      R0,??DataTable2_23
        BL       printf
//  206     		break;
        B        ??cpu_identify_41
//  207         case 0xF:
//  208     		printf("Flash size:  128 KB program flash, 4 KB protection region\n\r");
??cpu_identify_39:
        LDR      R0,??DataTable2_22
        BL       printf
//  209     		break;
        B        ??cpu_identify_41
//  210 	default:
//  211 		printf("ERR!! Undefined flash size\n\r");  
??cpu_identify_40:
        LDR      R0,??DataTable2_24
        BL       printf
//  212 		break;  	  		
//  213     }
//  214     
//  215     /* Determine the revision ID */
//  216     temp = ((SIM_SDID_REVID(0xF))>>SIM_SDID_REVID_SHIFT);
??cpu_identify_41:
        MOVS     R1,#+15
//  217     printf("Silicon rev %d\n\r", temp);       
        UXTH     R1,R1
        LDR      R0,??DataTable2_25
        BL       printf
//  218 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40048100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40048024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC8      "4\n\r"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC8      "5\n\r"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC8      "6\n\r"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     ?_12
//  219 /********************************************************************/
//  220 /*!
//  221  * \brief   flash Identify
//  222  * \return  None
//  223  *
//  224  * This is primarly a reporting function that displays information
//  225  * about the specific flash parameters and flash version ID for 
//  226  * the current device. These parameters are obtained using a special
//  227  * flash command call "read resource." The first four bytes returned
//  228  * are the flash parameter revision, and the second four bytes are
//  229  * the flash version ID.
//  230  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  231 void flash_identify (void)
//  232 {
flash_identify:
        PUSH     {R7,LR}
//  233     /* Get the flash parameter version */
//  234 
//  235     /* Write the flash FCCOB registers with the values for a read resource command */
//  236     FTFA_FCCOB0 = 0x03;
        MOVS     R0,#+3
        LDR      R1,??DataTable2_26  ;; 0x40020007
        STRB     R0,[R1, #+0]
//  237     FTFA_FCCOB1 = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_27  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  238     FTFA_FCCOB2 = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_28  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  239     FTFA_FCCOB3 = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_29  ;; 0x40020004
        STRB     R0,[R1, #+0]
//  240     FTFA_FCCOB8 = 0x01;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_30  ;; 0x4002000f
        STRB     R0,[R1, #+0]
//  241 
//  242     /* All required FCCOBx registers are written, so launch the command */
//  243     FTFA_FSTAT = FTFA_FSTAT_CCIF_MASK;
        MOVS     R0,#+128
        LDR      R1,??DataTable2_31  ;; 0x40020000
        STRB     R0,[R1, #+0]
//  244 
//  245     /* Wait for the command to complete */
//  246     while(!(FTFA_FSTAT & FTFA_FSTAT_CCIF_MASK));
??flash_identify_0:
        LDR      R0,??DataTable2_31  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??flash_identify_0
//  247     
//  248     printf("Flash parameter version %d ",FTFA_FCCOB4);
        LDR      R0,??DataTable2_32  ;; 0x4002000b
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_33
        BL       printf
//  249     printf(" %d ",FTFA_FCCOB5);
        LDR      R0,??DataTable2_34  ;; 0x4002000a
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_35
        BL       printf
//  250     printf(" %d ",FTFA_FCCOB6);
        LDR      R0,??DataTable2_36  ;; 0x40020009
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_35
        BL       printf
//  251     printf(" %d\n\r",FTFA_FCCOB7);
        LDR      R0,??DataTable2_37  ;; 0x40020008
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_38
        BL       printf
//  252 
//  253     /* Get the flash version ID */   
//  254 
//  255     /* Write the flash FCCOB registers with the values for a read resource command */
//  256     FTFA_FCCOB0 = 0x03;
        MOVS     R0,#+3
        LDR      R1,??DataTable2_26  ;; 0x40020007
        STRB     R0,[R1, #+0]
//  257     FTFA_FCCOB1 = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_27  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  258     FTFA_FCCOB2 = 0x00;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_28  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  259     FTFA_FCCOB3 = 0x04;
        MOVS     R0,#+4
        LDR      R1,??DataTable2_29  ;; 0x40020004
        STRB     R0,[R1, #+0]
//  260     FTFA_FCCOB8 = 0x01;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_30  ;; 0x4002000f
        STRB     R0,[R1, #+0]
//  261 
//  262     /* All required FCCOBx registers are written, so launch the command */
//  263     FTFA_FSTAT = FTFA_FSTAT_CCIF_MASK;
        MOVS     R0,#+128
        LDR      R1,??DataTable2_31  ;; 0x40020000
        STRB     R0,[R1, #+0]
//  264 
//  265     /* Wait for the command to complete */
//  266     while(!(FTFA_FSTAT & FTFA_FSTAT_CCIF_MASK));
??flash_identify_1:
        LDR      R0,??DataTable2_31  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??flash_identify_1
//  267 
//  268     printf("Flash version ID %d ",FTFA_FCCOB4);  
        LDR      R0,??DataTable2_32  ;; 0x4002000b
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_39
        BL       printf
//  269     printf(" %d",FTFA_FCCOB5);  
        LDR      R0,??DataTable2_34  ;; 0x4002000a
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        ADR      R0,??DataTable2_40  ;; " %d"
        BL       printf
//  270     printf(" %d ",FTFA_FCCOB6);  
        LDR      R0,??DataTable2_36  ;; 0x40020009
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_35
        BL       printf
//  271     printf("%d\n\r",FTFA_FCCOB7);  
        LDR      R0,??DataTable2_37  ;; 0x40020008
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1
        LDR      R0,??DataTable2_41
        BL       printf
//  272 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     ?_19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     ?_20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     ?_21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     ?_22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     ?_23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     ?_24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ?_25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     ?_26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     ?_27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     ?_28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     ?_29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x4004804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     ?_30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     ?_31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     ?_32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     ?_33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     ?_34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     ?_35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     ?_36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     ?_37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     0x4002000f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_31:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_32:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_33:
        DC32     ?_38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_34:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_35:
        DC32     ?_39

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_36:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_37:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_38:
        DC32     ?_40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_39:
        DC32     ?_41

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_40:
        DC8      " %d"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_41:
        DC32     ?_43

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "\012\015\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "\012\015KL0"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "\012\015KL1"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "\012\015KL2"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "\012\015KL3"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "\012\015KL4"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "\012\015Unrecognized Kinetis family device.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "4\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "5\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "6\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "\012\015Unrecognized Kinetis sub-family device.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "16pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "24pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "32pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "48pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "64pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "80pin\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_17:
        DATA
        DC8 "100pin\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_18:
        DATA
        DC8 "\012\015Unrecognized Kinetis package code.      "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_19:
        DATA
        DC8 "\012\015Low Power Line with Cortex M0+\012\015\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_20:
        DATA
        DC8 "\012\015Unrecognized Kinetis family attribute.\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_21:
        DATA
        DC8 "SRAM  size: 0.5 KB\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_22:
        DATA
        DC8 "SRAM  size:  1 KB\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_23:
        DATA
        DC8 "SRAM  size:  2 KB\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_24:
        DATA
        DC8 "SRAM  size:  4 KB\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_25:
        DATA
        DC8 "SRAM  size:  8 KB\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_26:
        DATA
        DC8 "SRAM  size:  16 KB\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_27:
        DATA
        DC8 "SRAM  size:  32 KB\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_28:
        DATA
        DC8 "SRAM  size:  64 KB\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_29:
        DATA
        DC8 "\012\015Unrecognized SRAM Size.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_30:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 38H, 20H, 4BH
        DC8 42H, 20H, 70H, 72H, 6FH, 67H, 72H, 61H
        DC8 6DH, 20H, 66H, 6CH, 61H, 73H, 68H, 2CH
        DC8 20H, 30H, 2EH, 32H, 35H, 20H, 4BH, 42H
        DC8 20H, 70H, 72H, 6FH, 74H, 65H, 63H, 74H
        DC8 69H, 6FH, 6EH, 20H, 72H, 65H, 67H, 69H
        DC8 6FH, 6EH, 0AH, 0DH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_31:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 31H, 36H, 20H
        DC8 4BH, 42H, 20H, 70H, 72H, 6FH, 67H, 72H
        DC8 61H, 6DH, 20H, 66H, 6CH, 61H, 73H, 68H
        DC8 2CH, 20H, 30H, 2EH, 35H, 20H, 4BH, 42H
        DC8 20H, 70H, 72H, 6FH, 74H, 65H, 63H, 74H
        DC8 69H, 6FH, 6EH, 20H, 72H, 65H, 67H, 69H
        DC8 6FH, 6EH, 0AH, 0DH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_32:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 33H, 32H, 20H
        DC8 4BH, 42H, 20H, 70H, 72H, 6FH, 67H, 72H
        DC8 61H, 6DH, 20H, 66H, 6CH, 61H, 73H, 68H
        DC8 2CH, 20H, 31H, 20H, 4BH, 42H, 20H, 70H
        DC8 72H, 6FH, 74H, 65H, 63H, 74H, 69H, 6FH
        DC8 6EH, 20H, 72H, 65H, 67H, 69H, 6FH, 6EH
        DC8 0AH, 0DH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_33:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 36H, 34H, 20H
        DC8 4BH, 42H, 20H, 70H, 72H, 6FH, 67H, 72H
        DC8 61H, 6DH, 20H, 66H, 6CH, 61H, 73H, 68H
        DC8 2CH, 20H, 32H, 20H, 4BH, 42H, 20H, 70H
        DC8 72H, 6FH, 74H, 65H, 63H, 74H, 69H, 6FH
        DC8 6EH, 20H, 72H, 65H, 67H, 69H, 6FH, 6EH
        DC8 0AH, 0DH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_34:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 31H, 32H, 38H
        DC8 20H, 4BH, 42H, 20H, 70H, 72H, 6FH, 67H
        DC8 72H, 61H, 6DH, 20H, 66H, 6CH, 61H, 73H
        DC8 68H, 2CH, 20H, 34H, 20H, 4BH, 42H, 20H
        DC8 70H, 72H, 6FH, 74H, 65H, 63H, 74H, 69H
        DC8 6FH, 6EH, 20H, 72H, 65H, 67H, 69H, 6FH
        DC8 6EH, 0AH, 0DH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_35:
        DATA
        DC8 46H, 6CH, 61H, 73H, 68H, 20H, 73H, 69H
        DC8 7AH, 65H, 3AH, 20H, 20H, 32H, 35H, 36H
        DC8 20H, 4BH, 42H, 20H, 70H, 72H, 6FH, 67H
        DC8 72H, 61H, 6DH, 20H, 66H, 6CH, 61H, 73H
        DC8 68H, 2CH, 20H, 34H, 20H, 4BH, 42H, 20H
        DC8 70H, 72H, 6FH, 74H, 65H, 63H, 74H, 69H
        DC8 6FH, 6EH, 20H, 72H, 65H, 67H, 69H, 6FH
        DC8 6EH, 0AH, 0DH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_36:
        DATA
        DC8 "ERR!! Undefined flash size\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_37:
        DATA
        DC8 "Silicon rev %d\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_38:
        DATA
        DC8 "Flash parameter version %d "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_39:
        DATA
        DC8 " %d "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_40:
        DATA
        DC8 " %d\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_41:
        DATA
        DC8 "Flash version ID %d "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 " %d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_43:
        DATA
        DC8 "%d\012\015"
        DC8 0, 0, 0

        END
//  273 /********************************************************************/
//  274 
// 
// 1 036 bytes in section .rodata
//   932 bytes in section .text
// 
//   932 bytes of CODE  memory
// 1 036 bytes of CONST memory
//
//Errors: none
//Warnings: none
