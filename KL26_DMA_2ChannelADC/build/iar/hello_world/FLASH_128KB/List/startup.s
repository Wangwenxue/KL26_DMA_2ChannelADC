///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  13:23:59
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\startup.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\startup.c -D IAR
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
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\startup.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        EXTERN __VECTOR_RAM
        EXTERN __VECTOR_TABLE
        EXTERN write_vtor

        PUBLIC common_startup

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\startup.c
//    1 /*
//    2  * File:    startup.c
//    3  * Purpose: Generic Kinetis startup code
//    4  *
//    5  * Notes:
//    6  */
//    7 
//    8 #include "common.h"
//    9 
//   10 #if (defined(IAR))
//   11 	#pragma section = ".data"
//   12 	#pragma section = ".data_init"
//   13 	#pragma section = ".bss"
//   14 	#pragma section = "CodeRelocate"
//   15 	#pragma section = "CodeRelocateRam"
//   16 #endif
//   17 
//   18 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   19 void
//   20 common_startup(void)
//   21 {
common_startup:
        PUSH     {R7,LR}
//   22 
//   23 #if (defined(CW))	
//   24     extern char __START_BSS[];
//   25     extern char __END_BSS[];
//   26     extern uint32 __DATA_ROM[];
//   27     extern uint32 __DATA_RAM[];
//   28     extern char __DATA_END[];
//   29 #endif
//   30 
//   31     /* Declare a counter we'll use in all of the copy loops */
//   32     uint32 n;
//   33 
//   34 #ifndef KEIL
//   35     /* Declare pointers for various data sections. These pointers
//   36      * are initialized using values pulled in from the linker file
//   37      */
//   38     uint8 * data_ram, * data_rom, * data_rom_end;
//   39     uint8 * bss_start, * bss_end;
//   40 #endif
//   41 
//   42 #if (defined(KEIL))
//   43 	extern uint32 Image$$VECTOR_ROM$$Base[];
//   44 	extern uint32 Image$$VECTOR_RAM$$Base[];
//   45 	#define __VECTOR_TABLE Image$$VECTOR_ROM$$Base  
//   46 	#define __VECTOR_RAM Image$$VECTOR_RAM$$Base  
//   47 #endif
//   48     /* Addresses for VECTOR_TABLE and VECTOR_RAM come from the linker file */
//   49     extern uint32 __VECTOR_TABLE[];
//   50     extern uint32 __VECTOR_RAM[];
//   51 
//   52     /* Copy the vector table to RAM */
//   53     if (__VECTOR_RAM != __VECTOR_TABLE)
        LDR      R0,??common_startup_0
        LDR      R1,??common_startup_0+0x4
        CMP      R0,R1
        BEQ      ??common_startup_1
//   54     {
//   55         for (n = 0; n < 0x104; n++)
        MOVS     R0,#+0
        B        ??common_startup_2
//   56             __VECTOR_RAM[n] = __VECTOR_TABLE[n];
??common_startup_3:
        LDR      R1,??common_startup_0+0x4
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDR      R2,??common_startup_0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
        ADDS     R0,R0,#+1
??common_startup_2:
        MOVS     R1,#+130
        LSLS     R1,R1,#+1        ;; #+260
        CMP      R0,R1
        BCC      ??common_startup_3
//   57     }
//   58     /* Point the VTOR to the new copy of the vector table */
//   59     write_vtor((uint32)__VECTOR_RAM);    
??common_startup_1:
        LDR      R0,??common_startup_0
        BL       write_vtor
//   60     
//   61     /* Get the addresses for the .data section (initialized data section) */
//   62     #if (defined(CW))
//   63         data_ram = (uint8 *)__DATA_RAM;
//   64 	data_rom = (uint8 *)__DATA_ROM;
//   65 	data_rom_end  = (uint8 *)__DATA_END; /* This is actually a RAM address in CodeWarrior */
//   66 	n = data_rom_end - data_ram;
//   67     #elif (defined(IAR))
//   68 	data_ram = __section_begin(".data");
        LDR      R1,??common_startup_0+0x8
//   69 	data_rom = __section_begin(".data_init");
        LDR      R2,??common_startup_0+0xC
//   70 	data_rom_end = __section_end(".data_init");
        LDR      R0,??common_startup_0+0x10
//   71 	n = data_rom_end - data_rom;
        SUBS     R0,R0,R2
        B        ??common_startup_4
//   72     #endif		
//   73 
//   74 #ifndef __CC_ARM
//   75 		
//   76 	/* Copy initialized data from ROM to RAM */
//   77 	while (n--)
//   78 		*data_ram++ = *data_rom++;
??common_startup_5:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??common_startup_4:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE      ??common_startup_5
//   79 	
//   80 	
//   81     /* Get the addresses for the .bss section (zero-initialized data) */
//   82     #if (defined(CW))
//   83 	bss_start = (uint8 *)__START_BSS;
//   84 	bss_end = (uint8 *)__END_BSS;
//   85     #elif (defined(IAR))
//   86 	bss_start = __section_begin(".bss");
        LDR      R1,??common_startup_0+0x14
//   87 	bss_end = __section_end(".bss");
        LDR      R0,??common_startup_0+0x18
//   88     #endif
//   89 	
//   90 
//   91     /* Clear the zero-initialized data section */
//   92     n = bss_end - bss_start;
        SUBS     R0,R0,R1
        B        ??common_startup_6
//   93     while(n--)
//   94       *bss_start++ = 0;
??common_startup_7:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
        ADDS     R1,R1,#+1
??common_startup_6:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        CMP      R2,#+0
        BNE      ??common_startup_7
//   95 #endif
//   96 
//   97     /* Get addresses for any code sections that need to be copied from ROM to RAM.
//   98      * The IAR tools have a predefined keyword that can be used to mark individual
//   99      * functions for execution from RAM. Add "__ramfunc" before the return type in
//  100      * the function prototype for any routines you need to execute from RAM instead
//  101      * of ROM. ex: __ramfunc void foo(void);
//  102      */
//  103     #if (defined(IAR))
//  104   	uint8* code_relocate_ram = __section_begin("CodeRelocateRam");
        LDR      R1,??common_startup_0+0x1C
//  105 	uint8* code_relocate = __section_begin("CodeRelocate");
        LDR      R2,??common_startup_0+0x20
//  106         uint8* code_relocate_end = __section_end("CodeRelocate");
        LDR      R0,??common_startup_0+0x24
//  107 
//  108         /* Copy functions from ROM to RAM */
//  109         n = code_relocate_end - code_relocate;
        SUBS     R0,R0,R2
        B        ??common_startup_8
//  110         while (n--)
//  111           *code_relocate_ram++ = *code_relocate++;
??common_startup_9:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??common_startup_8:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE      ??common_startup_9
//  112     #endif
//  113 }
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??common_startup_0:
        DC32     __VECTOR_RAM
        DC32     __VECTOR_TABLE
        DC32     SFB(`.data`)
        DC32     SFB(`.data_init`)
        DC32     SFE(`.data_init`)
        DC32     SFB(`.bss`)
        DC32     SFE(`.bss`)
        DC32     SFB(CodeRelocateRam)
        DC32     SFB(CodeRelocate)
        DC32     SFE(CodeRelocate)

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  114 /********************************************************************/
// 
// 164 bytes in section .text
// 
// 164 bytes of CODE memory
//
//Errors: none
//Warnings: none
