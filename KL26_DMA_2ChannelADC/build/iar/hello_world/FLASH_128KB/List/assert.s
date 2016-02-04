///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  09:22:40
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\src\common\assert.c
//    Command line =  
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\src\common\assert.c" -D IAR -D FREEDOM -lCN
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\" -lB
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\" -o
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\Obj\"
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.2\arm\INC\c\DLib_Config_Normal.h" -I
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\projects\hello_world\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\common\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\cpu\" -I
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\cpu\headers\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\llwu\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\lptmr\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\mcg\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\pmc\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\rcm\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\rtc\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\smc\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\uart\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\wdog\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\drivers\cmp\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\..\..\src\platforms\"
//        -I "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\..\" -Ol
//    List file    =  
//        C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\assert.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN printf

        PUBLIC ASSERT_FAILED_STR
        PUBLIC assert_failed

// C:\Users\b51443\Desktop\jicheng dma\KL26_DMA_2ChannelADC\src\common\assert.c
//    1 /*
//    2  * File:        assert.c
//    3  * Purpose:     Provide macro for software assertions
//    4  *
//    5  * Notes:       ASSERT macro defined in assert.h calls assert_failed()
//    6  */
//    7 
//    8 #include "common.h"
//    9 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   10 const char ASSERT_FAILED_STR[] = "Assertion failed in %s at line %d\n";
ASSERT_FAILED_STR:
        DATA
        DC8 "Assertion failed in %s at line %d\012"
        DC8 0
//   11 
//   12 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   13 void
//   14 assert_failed(char *file, int line)
//   15 {
assert_failed:
        PUSH     {R7,LR}
//   16     int i;
//   17     
//   18     printf(ASSERT_FAILED_STR, file, line);
        MOVS     R2,R1
        MOVS     R1,R0
        LDR      R0,??assert_failed_0
        BL       printf
//   19 
//   20     while (1)
//   21     {
//   22 //        platform_led_display(0xFF);
//   23         for (i = 100000; i; i--) ;
??assert_failed_1:
        LDR      R0,??assert_failed_0+0x4  ;; 0x186a0
        B        ??assert_failed_2
??assert_failed_3:
        SUBS     R0,R0,#+1
??assert_failed_2:
        CMP      R0,#+0
        BNE      ??assert_failed_3
//   24 //        platform_led_display(0x00);
//   25         for (i = 100000; i; i--) ;
        LDR      R0,??assert_failed_0+0x4  ;; 0x186a0
??assert_failed_4:
        CMP      R0,#+0
        BEQ      ??assert_failed_1
        SUBS     R0,R0,#+1
        B        ??assert_failed_4
        DATA
??assert_failed_0:
        DC32     ASSERT_FAILED_STR
        DC32     0x186a0
//   26     }
//   27 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   28 /********************************************************************/
// 
// 36 bytes in section .rodata
// 40 bytes in section .text
// 
// 40 bytes of CODE  memory
// 36 bytes of CONST memory
//
//Errors: none
//Warnings: none
