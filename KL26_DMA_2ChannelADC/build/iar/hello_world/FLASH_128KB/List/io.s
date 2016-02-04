///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  09:22:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\src\common\io.c
//    Command line =  
//        "C:\Users\b51443\Desktop\jicheng
//        dma\KL26_DMA_2ChannelADC\src\common\io.c" -D IAR -D FREEDOM -lCN
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
//        dma\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\io.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN uart0_getchar
        EXTERN uart0_getchar_present
        EXTERN uart0_putchar

        PUBLIC char_present
        PUBLIC in_char
        PUBLIC out_char

// C:\Users\b51443\Desktop\jicheng dma\KL26_DMA_2ChannelADC\src\common\io.c
//    1 /*
//    2  * File:		io.c
//    3  * Purpose:		Serial Input/Output routines
//    4  *
//    5  * Notes:       TERMINAL_PORT defined in <board>.h
//    6  */
//    7 
//    8 #include "common.h"
//    9 #include "uart.h"
//   10 
//   11 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   12 char
//   13 in_char (void)
//   14 {
in_char:
        PUSH     {R7,LR}
//   15   if (TERM_PORT_NUM == 0)
//   16     return uart0_getchar(UART0_BASE_PTR);
        LDR      R0,??DataTable2  ;; 0x4006a000
        BL       uart0_getchar
        POP      {R1,PC}          ;; return
//   17   else if (TERM_PORT_NUM == 1)
//   18     return uart_getchar(UART1_BASE_PTR);
//   19   else
//   20     return uart_getchar(UART2_BASE_PTR);
//   21  
//   22 }
//   23 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void
//   25 out_char (char ch)
//   26 {
out_char:
        PUSH     {R7,LR}
//   27   if (TERM_PORT_NUM == 0)
//   28     uart0_putchar(UART0_BASE_PTR, ch);
        MOVS     R1,R0
        UXTB     R1,R1
        LDR      R0,??DataTable2  ;; 0x4006a000
        BL       uart0_putchar
//   29   else if (TERM_PORT_NUM == 1)
//   30     uart_putchar(UART1_BASE_PTR, ch);
//   31   else
//   32     uart_putchar(UART2_BASE_PTR, ch);
//   33   
//   34 }
        POP      {R0,PC}          ;; return
//   35 
//   36 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   37 int
//   38 char_present (void)
//   39 {
char_present:
        PUSH     {R7,LR}
//   40   if (TERM_PORT_NUM == 0)
//   41     return uart0_getchar_present(UART0_BASE_PTR);
        LDR      R0,??DataTable2  ;; 0x4006a000
        BL       uart0_getchar_present
        POP      {R1,PC}          ;; return
//   42   else if (TERM_PORT_NUM == 1)
//   43     return uart_getchar_present(UART1_BASE_PTR);
//   44   else
//   45     return uart_getchar_present(UART2_BASE_PTR);
//   46   
//   47 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4006a000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   48 /********************************************************************/
// 
// 38 bytes in section .text
// 
// 38 bytes of CODE memory
//
//Errors: none
//Warnings: none
