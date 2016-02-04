///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       04/Feb/2016  13:23:57
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\printf.c
//    Command line =  
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\printf.c -D IAR -D
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
//        D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\build\iar\hello_world\FLASH_128KB\List\printf.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idiv
        EXTERN __aeabi_uidiv
        EXTERN out_char
        EXTERN strlen

        PUBLIC printf
        PUBLIC printk
        PUBLIC sprintf

// D:\jicheng_dma_adc\KL26_DMA_2ChannelADC\src\common\printf.c
//    1 /*
//    2  * File:        printk.c
//    3  * Purpose:     The standard C library routine printf()
//    4  */
//    5 
//    6 #include "common.h"
//    7 #include <stdarg.h>
//    8 
//    9 /********************************************************************/
//   10 
//   11 typedef struct
//   12 {
//   13     int dest;
//   14     void (*func)(char);
//   15     char *loc;
//   16 } PRINTK_INFO;
//   17 
//   18 int 
//   19 printk (PRINTK_INFO *, const char *, va_list);
//   20 
//   21 /********************************************************************/
//   22 
//   23 #define DEST_CONSOLE    (1)
//   24 #define DEST_STRING     (2)
//   25 
//   26 #define FLAGS_MINUS     (0x01)
//   27 #define FLAGS_PLUS      (0x02)
//   28 #define FLAGS_SPACE     (0x04)
//   29 #define FLAGS_ZERO      (0x08)
//   30 #define FLAGS_POUND     (0x10)
//   31 
//   32 #define IS_FLAG_MINUS(a)    (a & FLAGS_MINUS)
//   33 #define IS_FLAG_PLUS(a)     (a & FLAGS_PLUS)
//   34 #define IS_FLAG_SPACE(a)    (a & FLAGS_SPACE)
//   35 #define IS_FLAG_ZERO(a)     (a & FLAGS_ZERO)
//   36 #define IS_FLAG_POUND(a)    (a & FLAGS_POUND)
//   37 
//   38 #define LENMOD_h        (0x01)
//   39 #define LENMOD_l        (0x02)
//   40 #define LENMOD_L        (0x04)
//   41 
//   42 #define IS_LENMOD_h(a)  (a & LENMOD_h)
//   43 #define IS_LENMOD_l(a)  (a & LENMOD_l)
//   44 #define IS_LENMOD_L(a)  (a & LENMOD_L)
//   45 
//   46 #define FMT_d   (0x0001)
//   47 #define FMT_o   (0x0002)
//   48 #define FMT_x   (0x0004)
//   49 #define FMT_X   (0x0008)
//   50 #define FMT_u   (0x0010)
//   51 #define FMT_c   (0x0020)
//   52 #define FMT_s   (0x0040)
//   53 #define FMT_p   (0x0080)
//   54 #define FMT_n   (0x0100)
//   55 
//   56 #define IS_FMT_d(a)     (a & FMT_d)
//   57 #define IS_FMT_o(a)     (a & FMT_o)
//   58 #define IS_FMT_x(a)     (a & FMT_x)
//   59 #define IS_FMT_X(a)     (a & FMT_X)
//   60 #define IS_FMT_u(a)     (a & FMT_u)
//   61 #define IS_FMT_c(a)     (a & FMT_c)
//   62 #define IS_FMT_s(a)     (a & FMT_s)
//   63 #define IS_FMT_p(a)     (a & FMT_p)
//   64 #define IS_FMT_n(a)     (a & FMT_n)
//   65 
//   66 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 static void
//   68 printk_putc (int c, int *count, PRINTK_INFO *info)
//   69 {
printk_putc:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   70     switch (info->dest)
        LDR      R1,[R2, #+0]
        CMP      R1,#+1
        BEQ      ??printk_putc_0
        CMP      R1,#+2
        BEQ      ??printk_putc_1
        B        ??printk_putc_2
//   71     {
//   72         case DEST_CONSOLE:
//   73             info->func((char)c);
??printk_putc_0:
        UXTB     R0,R0
        LDR      R1,[R2, #+4]
        BLX      R1
//   74             break;
        B        ??printk_putc_3
//   75         case DEST_STRING:
//   76             *(info->loc) = (unsigned char)c;
??printk_putc_1:
        LDR      R1,[R2, #+8]
        STRB     R0,[R1, #+0]
//   77             ++(info->loc);
        LDR      R0,[R2, #+8]
        ADDS     R0,R0,#+1
        STR      R0,[R2, #+8]
//   78             break;
        B        ??printk_putc_3
//   79         default:
//   80             break;
//   81     }
//   82     *count += 1;
??printk_putc_2:
??printk_putc_3:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+0]
//   83 }
        POP      {R4,PC}          ;; return
//   84 
//   85 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 static int
//   87 printk_mknumstr (char *numstr, void *nump, int neg, int radix)
//   88 {
printk_mknumstr:
        PUSH     {R4-R7,LR}
        MOVS     R4,R3
//   89     int a,b,c;
//   90     unsigned int ua,ub,uc;
//   91 
//   92     int nlen;
//   93     char *nstrp;
//   94 
//   95     nlen = 0;
        MOVS     R6,#+0
//   96     nstrp = numstr;
        MOVS     R5,R0
//   97     *nstrp++ = '\0';
        MOVS     R0,#+0
        STRB     R0,[R5, #+0]
        ADDS     R5,R5,#+1
//   98 
//   99     if (neg)
        CMP      R2,#+0
        BEQ      ??printk_mknumstr_0
//  100     {
//  101         a = *(int *)nump;
        LDR      R7,[R1, #+0]
//  102         if (a == 0)
        CMP      R7,#+0
        BNE      ??printk_mknumstr_1
//  103         {
//  104             *nstrp = '0';
        MOVS     R0,#+48
        STRB     R0,[R5, #+0]
//  105             ++nlen;
        ADDS     R6,R6,#+1
//  106             goto done;
//  107         }
//  108         while (a != 0)
//  109         {
//  110             b = (int)a / (int)radix;
//  111             c = (int)a - ((int)b * (int)radix);
//  112             if (c < 0)
//  113             {
//  114                 c = ~c + 1 + '0';
//  115             }
//  116             else
//  117             {
//  118                 c = c + '0';
//  119             }
//  120             a = b;
//  121             *nstrp++ = (char)c;
//  122             ++nlen;
//  123         }
//  124     }
//  125     else
//  126     {
//  127         ua = *(unsigned int *)nump;
//  128         if (ua == 0)
//  129         {
//  130             *nstrp = '0';
//  131             ++nlen;
//  132             goto done;
//  133         }
//  134         while (ua != 0)
//  135         {
//  136             ub = (unsigned int)ua / (unsigned int)radix;
//  137             uc = (unsigned int)ua - ((unsigned int)ub * (unsigned int)radix);
//  138             if (uc < 10)
//  139             {
//  140                 uc = uc + '0';
//  141             }
//  142             else
//  143             {
//  144                 uc = uc - 10 + 'A';
//  145             }
//  146             ua = ub;
//  147             *nstrp++ = (char)uc;
//  148             ++nlen;
//  149         }
//  150     }
//  151     done:
//  152     return nlen;
??printk_mknumstr_2:
        MOVS     R0,R6
        POP      {R4-R7,PC}       ;; return
??printk_mknumstr_3:
        ADDS     R2,R2,#+48
??printk_mknumstr_4:
        MOVS     R7,R1
        STRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        ADDS     R6,R6,#+1
??printk_mknumstr_1:
        CMP      R7,#+0
        BEQ      ??printk_mknumstr_2
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_idiv
        MOVS     R1,R0
        MOVS     R0,R1
        MULS     R0,R4,R0
        SUBS     R2,R7,R0
        CMP      R2,#+0
        BPL      ??printk_mknumstr_3
        MVNS     R0,R2
        MOVS     R2,R0
        ADDS     R2,R2,#+49
        B        ??printk_mknumstr_4
??printk_mknumstr_0:
        LDR      R7,[R1, #+0]
        CMP      R7,#+0
        BNE      ??printk_mknumstr_5
        MOVS     R0,#+48
        STRB     R0,[R5, #+0]
        ADDS     R6,R6,#+1
        B        ??printk_mknumstr_2
??printk_mknumstr_6:
        ADDS     R1,R1,#+55
??printk_mknumstr_7:
        MOVS     R7,R0
        STRB     R1,[R5, #+0]
        ADDS     R5,R5,#+1
        ADDS     R6,R6,#+1
??printk_mknumstr_5:
        CMP      R7,#+0
        BEQ      ??printk_mknumstr_2
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_uidiv
        MOVS     R1,R0
        MULS     R1,R4,R1
        SUBS     R1,R7,R1
        CMP      R1,#+10
        BCS      ??printk_mknumstr_6
        ADDS     R1,R1,#+48
        B        ??printk_mknumstr_7
//  153 }
//  154 
//  155 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  156 static void
//  157 printk_pad_zero (int curlen, int field_width, int *count, PRINTK_INFO *info)
//  158 {
printk_pad_zero:
        PUSH     {R3-R7,LR}
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R7,R3
//  159     int i;
//  160 
//  161     for (i = curlen; i < field_width; i++)
        MOVS     R4,R0
        B        ??printk_pad_zero_0
//  162     {
//  163         printk_putc('0',count, info);
??printk_pad_zero_1:
        MOVS     R2,R7
        MOVS     R1,R5
        MOVS     R0,#+48
        BL       printk_putc
//  164     }
        ADDS     R4,R4,#+1
??printk_pad_zero_0:
        CMP      R4,R6
        BLT      ??printk_pad_zero_1
//  165 }
        POP      {R0,R4-R7,PC}    ;; return
//  166 
//  167 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 static void
//  169 printk_pad_space (int curlen, int field_width, int *count, PRINTK_INFO *info)
//  170 {
printk_pad_space:
        PUSH     {R3-R7,LR}
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R7,R3
//  171     int i;
//  172 
//  173     for (i = curlen; i < field_width; i++)
        MOVS     R4,R0
        B        ??printk_pad_space_0
//  174     {
//  175         printk_putc(' ',count, info);
??printk_pad_space_1:
        MOVS     R2,R7
        MOVS     R1,R5
        MOVS     R0,#+32
        BL       printk_putc
//  176     }
        ADDS     R4,R4,#+1
??printk_pad_space_0:
        CMP      R4,R6
        BLT      ??printk_pad_space_1
//  177 }
        POP      {R0,R4-R7,PC}    ;; return
//  178 
//  179 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 int
//  181 printk (PRINTK_INFO *info, const char *fmt, va_list ap)
//  182 {
printk:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R2
//  183     /* va_list ap; */
//  184     char *p;
//  185     int c;
//  186 
//  187     char vstr[33];
//  188     char *vstrp;
//  189     int vlen;
//  190 
//  191     int done;
//  192     int count = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  193 
//  194     int flags_used;
//  195     int field_width;
//  196 #if 0
//  197     int precision_used;
//  198     int precision_width;
//  199     int length_modifier;
//  200 #endif
//  201 
//  202     int ival;
//  203     int schar, dschar;
//  204     int *ivalp;
//  205     char *sval;
//  206     int cval;
//  207     unsigned int uval;
//  208 
//  209     /*
//  210      * Start parsing apart the format string and display appropriate
//  211      * formats and data.
//  212      */
//  213     for (p = (char *)fmt; (c = *p) != 0; p++)
        MOVS     R5,R1
        B        ??printk_0
//  214     {
//  215         /*
//  216          * All formats begin with a '%' marker.  Special chars like
//  217          * '\n' or '\t' are normally converted to the appropriate
//  218          * character by the __compiler__.  Thus, no need for this
//  219          * routine to account for the '\' character.
//  220          */
//  221         if (c != '%')
//  222         {
//  223             /*
//  224              * This needs to be replaced with something like
//  225              * 'out_char()' or call an OS routine.
//  226              */
//  227 #ifndef UNIX_DEBUG
//  228             if (c != '\n')
//  229             {
//  230                 printk_putc(c, &count, info);
//  231             }
//  232             else
//  233             {
//  234                 printk_putc(0x0D /* CR */, &count, info);
//  235                 printk_putc(0x0A /* LF */, &count, info);
//  236             }
//  237 #else
//  238             printk_putc(c, &count, info);
//  239 #endif
//  240 
//  241             /*
//  242              * By using 'continue', the next iteration of the loop
//  243              * is used, skipping the code that follows.
//  244              */
//  245             continue;
//  246         }
//  247 
//  248         /*
//  249          * First check for specification modifier flags.
//  250          */
//  251         flags_used = 0;
//  252         done = FALSE;
//  253         while (!done)
//  254         {
//  255             switch (/* c = */ *++p)
//  256             {
//  257                 case '-':
//  258                     flags_used |= FLAGS_MINUS;
//  259                     break;
//  260                 case '+':
//  261                     flags_used |= FLAGS_PLUS;
//  262                     break;
//  263                 case ' ':
//  264                     flags_used |= FLAGS_SPACE;
//  265                     break;
//  266                 case '0':
//  267                     flags_used |= FLAGS_ZERO;
//  268                     break;
//  269                 case '#':
//  270                     flags_used |= FLAGS_POUND;
//  271                     break;
//  272                 default:
//  273                     /* we've gone one char too far */
//  274                     --p;
//  275                     done = TRUE;
//  276                     break;
//  277             }
//  278         }
//  279 
//  280         /*
//  281          * Next check for minimum field width.
//  282          */
//  283         field_width = 0;
//  284         done = FALSE;
//  285         while (!done)
//  286         {
//  287             switch (c = *++p)
//  288             {
//  289                 case '0':
//  290                 case '1':
//  291                 case '2':
//  292                 case '3':
//  293                 case '4':
//  294                 case '5':
//  295                 case '6':
//  296                 case '7':
//  297                 case '8':
//  298                 case '9':
//  299                     field_width = (field_width * 10) + (c - '0');
//  300                     break;
//  301                 default:
//  302                     /* we've gone one char too far */
//  303                     --p;
//  304                     done = TRUE;
//  305                     break;
//  306             }
//  307         }
//  308 
//  309         /*
//  310          * Next check for the width and precision field separator.
//  311          */
//  312         if (*++p == '.')
//  313         {
//  314 
//  315             /*
//  316              * Must get precision field width, if present.
//  317              */
//  318             done = FALSE;
//  319             while (!done)
//  320             {
//  321                 switch (/* c = uncomment if used below */ *++p)
//  322                 {
//  323                     case '0':
//  324                     case '1':
//  325                     case '2':
//  326                     case '3':
//  327                     case '4':
//  328                     case '5':
//  329                     case '6':
//  330                     case '7':
//  331                     case '8':
//  332                     case '9':
//  333 #if 0
//  334                         precision_width = (precision_width * 10) +
//  335                             (c - '0');
//  336 #endif
//  337                         break;
//  338                     default:
//  339                         /* we've gone one char too far */
//  340                         --p;
//  341                         done = TRUE;
//  342                         break;
//  343                 }
//  344             }
//  345         }
//  346         else
//  347         {
//  348             /* we've gone one char too far */
//  349             --p;
//  350 #if 0
//  351             precision_used = FALSE;
//  352             precision_width = 0;
//  353 #endif
//  354         }
//  355 
//  356         /*
//  357          * Check for the length modifier.
//  358          */
//  359         switch (*++p)
//  360         {
//  361             case 'h':
//  362                 break;
//  363             case 'l':
//  364                 break;
//  365             case 'L':
//  366                 break;
//  367             default:
//  368                 /* we've gone one char too far */
//  369                 --p;
//  370                 break;
//  371         }
//  372 
//  373         /*
//  374          * Now we're ready to examine the format.
//  375          */
//  376         switch (c = *++p)
//  377         {
//  378             case 'd':
//  379             case 'i':
//  380                 ival = (int)va_arg(ap, int);
//  381                 vlen = printk_mknumstr(vstr,&ival,TRUE,10);
//  382                 vstrp = &vstr[vlen];
//  383 
//  384                 if (ival < 0)
//  385                 {
//  386                     schar = '-';
//  387                     ++vlen;
//  388                 }
//  389                 else
//  390                 {
//  391                     if (IS_FLAG_PLUS(flags_used))
//  392                     {
//  393                         schar = '+';
//  394                         ++vlen;
//  395                     }
//  396                     else
//  397                     {
//  398                         if (IS_FLAG_SPACE(flags_used))
//  399                         {
//  400                             schar = ' ';
//  401                             ++vlen;
//  402                         }
//  403                         else
//  404                         {
//  405                             schar = 0;
//  406                         }
//  407                     }
//  408                 }
//  409                 dschar = FALSE;
//  410             
//  411                 /*
//  412                  * do the ZERO pad.
//  413                  */
//  414                 if (IS_FLAG_ZERO(flags_used))
//  415                 {
//  416                     if (schar)
//  417                         printk_putc(schar, &count, info);
//  418                     dschar = TRUE;
//  419             
//  420                     printk_pad_zero (vlen, field_width, &count, info);
//  421                     vlen = field_width;
//  422                 }
//  423                 else
//  424                 {
//  425                     if (!IS_FLAG_MINUS(flags_used))
//  426                     {
//  427                         printk_pad_space (vlen, field_width, &count, info);
//  428             
//  429                         if (schar)
//  430                             printk_putc(schar, &count, info);
//  431                         dschar = TRUE;
//  432                     }
//  433                 }
//  434             
//  435                 /* the string was built in reverse order, now display in */
//  436                 /* correct order */
//  437                 if (!dschar && schar)
//  438                 {
//  439                     printk_putc(schar, &count, info);
//  440                 }
//  441                 goto cont_xd;
//  442 
//  443             case 'x':
//  444             case 'X':
//  445                 uval = (unsigned int)va_arg(ap, unsigned int);
//  446                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
//  447                 vstrp = &vstr[vlen];
//  448 
//  449                 dschar = FALSE;
//  450                 if (IS_FLAG_ZERO(flags_used))
//  451                 {
//  452                     if (IS_FLAG_POUND(flags_used))
//  453                     {
//  454                         printk_putc('0', &count, info);
//  455                         printk_putc('x', &count, info);
//  456                         /*vlen += 2;*/
//  457                         dschar = TRUE;
//  458                     }
//  459                     printk_pad_zero (vlen, field_width, &count, info);
//  460                     vlen = field_width;
//  461                 }
//  462                 else
//  463                 {
//  464                     if (!IS_FLAG_MINUS(flags_used))
//  465                     {
//  466                         if (IS_FLAG_POUND(flags_used))
//  467                         {
//  468                             vlen += 2;
//  469                         }
//  470                         printk_pad_space (vlen, field_width, &count, info);
//  471                         if (IS_FLAG_POUND(flags_used))
//  472                         {
//  473                             printk_putc('0', &count, info);
//  474                             printk_putc('x', &count, info);
//  475                             dschar = TRUE;
//  476                         }
//  477                     }
//  478                 }
//  479 
//  480                 if ((IS_FLAG_POUND(flags_used)) && !dschar)
//  481                 {
//  482                     printk_putc('0', &count, info);
//  483                     printk_putc('x', &count, info);
//  484                     vlen += 2;
//  485                 }
//  486                 goto cont_xd;
//  487 
//  488             case 'o':
//  489                 uval = (unsigned int)va_arg(ap, unsigned int);
//  490                 vlen = printk_mknumstr(vstr,&uval,FALSE,8);
//  491                 goto cont_u;
//  492             case 'b':
//  493                 uval = (unsigned int)va_arg(ap, unsigned int);
//  494                 vlen = printk_mknumstr(vstr,&uval,FALSE,2);
//  495                 goto cont_u;
//  496             case 'p':
//  497                 uval = (unsigned int)va_arg(ap, void *);
//  498                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
//  499                 goto cont_u;
//  500             case 'u':
//  501                 uval = (unsigned int)va_arg(ap, unsigned int);
//  502                 vlen = printk_mknumstr(vstr,&uval,FALSE,10);
//  503 
//  504                 cont_u:
//  505                     vstrp = &vstr[vlen];
//  506 
//  507                     if (IS_FLAG_ZERO(flags_used))
//  508                     {
//  509                         printk_pad_zero (vlen, field_width, &count, info);
//  510                         vlen = field_width;
//  511                     }
//  512                     else
//  513                     {
//  514                         if (!IS_FLAG_MINUS(flags_used))
//  515                         {
//  516                             printk_pad_space (vlen, field_width, &count, info);
//  517                         }
//  518                     }
//  519 
//  520                 cont_xd:
//  521                     while (*vstrp)
//  522                         printk_putc(*vstrp--, &count, info);
//  523 
//  524                     if (IS_FLAG_MINUS(flags_used))
//  525                     {
//  526                         printk_pad_space (vlen, field_width, &count, info);
//  527                     }
//  528                 break;
//  529 
//  530             case 'c':
//  531                 cval = (char)va_arg(ap, unsigned int);
//  532                 printk_putc(cval,&count, info);
//  533                 break;
//  534             case 's':
//  535                 sval = (char *)va_arg(ap, char *);
//  536                 if (sval)
//  537                 {
//  538                     vlen = strlen(sval);
//  539                     if (!IS_FLAG_MINUS(flags_used))
//  540                     {
//  541                         printk_pad_space (vlen, field_width, &count, info);
//  542                     }
//  543                     while (*sval)
//  544                         printk_putc(*sval++,&count, info);
//  545                     if (IS_FLAG_MINUS(flags_used))
//  546                     {
//  547                         printk_pad_space (vlen, field_width, &count, info);
//  548                     }
//  549                 }
//  550                 break;
//  551             case 'n':
//  552                 ivalp = (int *)va_arg(ap, int *);
//  553                 *ivalp = count;
//  554                 break;
//  555             default:
//  556                 printk_putc(c,&count, info);
??printk_1:
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        BL       printk_putc
//  557                 break;
??printk_2:
        ADDS     R5,R5,#+1
??printk_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??printk_3
        CMP      R0,#+37
        BEQ      ??printk_4
        CMP      R0,#+10
        BEQ      ??printk_5
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        BL       printk_putc
        B        ??printk_6
??printk_5:
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+13
        BL       printk_putc
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+10
        BL       printk_putc
??printk_6:
        B        ??printk_2
??printk_4:
        MOVS     R7,#+0
        MOVS     R1,#+0
        B        ??printk_7
??printk_8:
        MOVS     R0,R7
        MOVS     R7,#+1
        ORRS     R7,R7,R0
??printk_7:
        CMP      R1,#+0
        BNE      ??printk_9
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        CMP      R0,#+32
        BEQ      ??printk_10
        CMP      R0,#+35
        BEQ      ??printk_11
        CMP      R0,#+43
        BEQ      ??printk_12
        CMP      R0,#+45
        BEQ      ??printk_8
        CMP      R0,#+48
        BEQ      ??printk_13
        B        ??printk_14
??printk_12:
        MOVS     R0,R7
        MOVS     R7,#+2
        ORRS     R7,R7,R0
        B        ??printk_7
??printk_10:
        MOVS     R0,R7
        MOVS     R7,#+4
        ORRS     R7,R7,R0
        B        ??printk_7
??printk_13:
        MOVS     R0,R7
        MOVS     R7,#+8
        ORRS     R7,R7,R0
        B        ??printk_7
??printk_11:
        MOVS     R0,R7
        MOVS     R7,#+16
        ORRS     R7,R7,R0
        B        ??printk_7
??printk_14:
        SUBS     R5,R5,#+1
        MOVS     R1,#+1
        B        ??printk_7
??printk_9:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R1,#+0
        B        ??printk_15
??printk_16:
        LDR      R2,[SP, #+8]
        MOVS     R3,#+10
        MULS     R2,R3,R2
        ADDS     R0,R2,R0
        SUBS     R0,R0,#+48
        STR      R0,[SP, #+8]
??printk_15:
        CMP      R1,#+0
        BNE      ??printk_17
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        MOVS     R2,R0
        SUBS     R2,R2,#+48
        CMP      R2,#+9
        BLS      ??printk_16
??printk_18:
        SUBS     R5,R5,#+1
        MOVS     R1,#+1
        B        ??printk_15
??printk_17:
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        CMP      R0,#+46
        BNE      ??printk_19
        MOVS     R1,#+0
        B        ??printk_20
??printk_21:
??printk_20:
        CMP      R1,#+0
        BNE      ??printk_22
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+9
        BLS      ??printk_21
??printk_23:
        SUBS     R5,R5,#+1
        MOVS     R1,#+1
        B        ??printk_20
??printk_19:
        SUBS     R5,R5,#+1
??printk_22:
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        CMP      R0,#+76
        BEQ      ??printk_24
        CMP      R0,#+104
        BEQ      ??printk_25
        CMP      R0,#+108
        BEQ      ??printk_26
        B        ??printk_27
??printk_25:
        B        ??printk_28
??printk_26:
        B        ??printk_28
??printk_24:
        B        ??printk_28
??printk_27:
        SUBS     R5,R5,#+1
??printk_28:
        ADDS     R5,R5,#+1
        LDRB     R0,[R5, #+0]
        MOVS     R1,R0
        CMP      R1,#+88
        BEQ      ??printk_29
        CMP      R1,#+98
        BNE      .+4
        B        ??printk_30
        CMP      R1,#+99
        BNE      .+4
        B        ??printk_31
        CMP      R1,#+100
        BEQ      ??printk_32
        CMP      R1,#+105
        BEQ      ??printk_32
        CMP      R1,#+110
        BNE      .+4
        B        ??printk_33
        CMP      R1,#+111
        BNE      .+4
        B        ??printk_34
        CMP      R1,#+112
        BNE      .+4
        B        ??printk_35
        CMP      R1,#+115
        BNE      .+4
        B        ??printk_36
        CMP      R1,#+117
        BNE      .+4
        B        ??printk_37
        CMP      R1,#+120
        BEQ      ??printk_29
        B        ??printk_1
??printk_32:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+24]
        MOVS     R3,#+10
        MOVS     R2,#+1
        ADD      R1,SP,#+24
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
        ADD      R0,SP,#+28
        ADDS     R0,R0,R6
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+24]
        CMP      R0,#+0
        BPL      ??printk_38
        MOVS     R0,#+45
        STR      R0,[SP, #+4]
        ADDS     R6,R6,#+1
        B        ??printk_39
??printk_38:
        LSLS     R0,R7,#+30
        BPL      ??printk_40
        MOVS     R0,#+43
        STR      R0,[SP, #+4]
        ADDS     R6,R6,#+1
        B        ??printk_39
??printk_40:
        LSLS     R0,R7,#+29
        BPL      ??printk_41
        MOVS     R0,#+32
        STR      R0,[SP, #+4]
        ADDS     R6,R6,#+1
        B        ??printk_39
??printk_41:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
??printk_39:
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        LSLS     R0,R7,#+28
        BPL      ??printk_42
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??printk_43
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        LDR      R0,[SP, #+4]
        BL       printk_putc
??printk_43:
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_zero
        LDR      R6,[SP, #+8]
        B        ??printk_44
??printk_42:
        LSLS     R0,R7,#+31
        BMI      ??printk_44
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??printk_45
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        LDR      R0,[SP, #+4]
        BL       printk_putc
??printk_45:
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
??printk_44:
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE      ??printk_46
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??printk_46
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        LDR      R0,[SP, #+4]
        BL       printk_putc
??printk_46:
        B        ??printk_47
??printk_29:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+12]
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
        ADD      R0,SP,#+28
        ADDS     R0,R0,R6
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        LSLS     R0,R7,#+28
        BPL      ??printk_48
        LSLS     R0,R7,#+27
        BPL      ??printk_49
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
??printk_49:
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_zero
        LDR      R6,[SP, #+8]
        B        ??printk_50
??printk_48:
        LSLS     R0,R7,#+31
        BMI      ??printk_50
        LSLS     R0,R7,#+27
        BPL      ??printk_51
        ADDS     R6,R6,#+2
??printk_51:
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
        LSLS     R0,R7,#+27
        BPL      ??printk_50
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
??printk_50:
        LSLS     R0,R7,#+27
        BPL      ??printk_52
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE      ??printk_52
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        ADDS     R6,R6,#+2
??printk_52:
        B        ??printk_47
??printk_34:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+12]
        MOVS     R3,#+8
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
        B        ??printk_53
??printk_30:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+12]
        MOVS     R3,#+2
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
        B        ??printk_53
??printk_35:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+12]
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
        B        ??printk_53
??printk_37:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+12]
        MOVS     R3,#+10
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       printk_mknumstr
        MOVS     R6,R0
??printk_53:
        ADD      R0,SP,#+28
        ADDS     R0,R0,R6
        STR      R0,[SP, #+20]
        LSLS     R0,R7,#+28
        BPL      ??printk_54
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_zero
        LDR      R6,[SP, #+8]
        B        ??printk_47
??printk_54:
        LSLS     R0,R7,#+31
        BMI      ??printk_47
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
        B        ??printk_47
??printk_55:
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        LDR      R0,[SP, #+20]
        LDRB     R0,[R0, #+0]
        BL       printk_putc
        LDR      R0,[SP, #+20]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+20]
??printk_47:
        LDR      R0,[SP, #+20]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??printk_55
        LSLS     R0,R7,#+31
        BPL      ??printk_56
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
??printk_56:
        B        ??printk_2
??printk_31:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        UXTB     R0,R0
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        BL       printk_putc
        B        ??printk_2
??printk_36:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??printk_57
        LDR      R0,[SP, #+4]
        BL       strlen
        MOVS     R6,R0
        LSLS     R0,R7,#+31
        BMI      ??printk_58
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
        B        ??printk_58
??printk_59:
        LDR      R2,[SP, #+64]
        MOV      R1,SP
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        BL       printk_putc
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
??printk_58:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??printk_59
        LSLS     R0,R7,#+31
        BPL      ??printk_57
        LDR      R3,[SP, #+64]
        MOV      R2,SP
        LDR      R1,[SP, #+8]
        MOVS     R0,R6
        BL       printk_pad_space
??printk_57:
        B        ??printk_2
??printk_33:
        LDR      R0,[R4, #+0]
        ADDS     R4,R4,#+4
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
        B        ??printk_2
//  558         }
//  559     }
//  560     return count;
??printk_3:
        LDR      R0,[SP, #+0]
        ADD      SP,SP,#+68
        POP      {R4-R7,PC}       ;; return
//  561 }
//  562 
//  563 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  564 int
//  565 printf (const char *fmt, ...)
//  566 {
printf:
        PUSH     {R1-R3}
        PUSH     {LR}
        SUB      SP,SP,#+16
//  567     va_list ap;
//  568     int rvalue;
//  569     PRINTK_INFO info;
//  570 
//  571 
//  572     info.dest = DEST_CONSOLE;
        MOVS     R1,#+1
        STR      R1,[SP, #+0]
//  573     info.func = &out_char;
        LDR      R1,??DataTable0
        STR      R1,[SP, #+4]
//  574     /*
//  575      * Initialize the pointer to the variable length argument list.
//  576      */
//  577     va_start(ap, fmt);
        ADD      R2,SP,#+20
//  578     rvalue = printk(&info, fmt, ap);
        MOVS     R1,R0
        MOV      R0,SP
        BL       printk
//  579     /*
//  580      * Cleanup the variable length argument list.
//  581      */
//  582     va_end(ap);
//  583     return rvalue;
        LDR      R1,[SP, #+16]
        ADD      SP,SP,#+32
        BX       R1               ;; return
//  584 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     out_char
//  585 
//  586 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  587 int
//  588 sprintf (char *s, const char *fmt, ...)
//  589 {
sprintf:
        PUSH     {R2,R3}
        PUSH     {R5-R7,LR}
        MOVS     R2,R0
//  590     va_list ap;
//  591     int rvalue = 0;
        MOVS     R0,#+0
//  592     PRINTK_INFO info;
//  593 
//  594     /*
//  595      * Initialize the pointer to the variable length argument list.
//  596      */
//  597     if (s != 0)
        CMP      R2,#+0
        BEQ      ??sprintf_0
//  598     {
//  599         info.dest = DEST_STRING;
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
//  600         info.loc = s;
        STR      R2,[SP, #+8]
//  601         va_start(ap, fmt);
        ADD      R2,SP,#+16
//  602         rvalue = printk(&info, fmt, ap);
        MOV      R0,SP
        BL       printk
//  603         *info.loc = '\0';
        MOVS     R1,#+0
        LDR      R2,[SP, #+8]
        STRB     R1,[R2, #+0]
//  604         va_end(ap);
//  605     }
//  606     return rvalue;
??sprintf_0:
        LDR      R1,[SP, #+12]
        ADD      SP,SP,#+24
        BX       R1               ;; return
//  607 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  608 
//  609 /********************************************************************/
// 
// 1 244 bytes in section .text
// 
// 1 244 bytes of CODE memory
//
//Errors: none
//Warnings: none
