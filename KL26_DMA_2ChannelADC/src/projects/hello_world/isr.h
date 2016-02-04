/******************************************************************************
* File:    isr.h
* Purpose: Define interrupt service routines referenced by the vector table.
* Note: Only "vectors.c" should include this header file.
******************************************************************************/

#ifndef __ISR_H
#define __ISR_H 1


/* Example */
/*
#undef  VECTOR_101
#define VECTOR_101 lpt_isr


// ISR(s) are defined in your project directory.
extern void lpt_isr(void);
*/
extern void DMA1_IRQHandler(void);

#undef  VECTOR_017
#define VECTOR_017 DMA1_IRQHandler

#endif  //__ISR_H

/* End of "isr.h" */
