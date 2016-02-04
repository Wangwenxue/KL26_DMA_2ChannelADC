/*
  This is customer modified application

*/


#pragma data_alignment = 32
uint32_t ADC_Channel[4]={A_TEST1_CHNL,A_TEST2_CHNL,A_TEST3_CHNL,BAT_VOL_CHNL};   // adc 的四个Channel    
uint32_t DMA_BCR0[2]={DMA_DSR_BCR_DONE_MASK,DMA_DSR_BCR_BCR(sizeof(uint32_t) * DMA_BUFFER_SIZE)};      
uint32_t DMA_BCR1[2]={DMA_DSR_BCR_DONE_MASK,DMA_DSR_BCR_BCR(sizeof(uint16_t) * DMA_BUFFER_SIZE)};      
#pragma data_alignment = 1024
uint16_t DMA_Result_Buffer[DMA_BUFFER_SIZE * 2]={0}; // 4*64 *2(2倍)= 512 个元素   1K 字节



void init_adc16(void)
{
	// Turn on the ADC0 clock 
	SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK);

	ADC0_CFG1 = ADC_CFG1_ADIV(0) |       //divide ratio is 2 and the clock rate is (input clock)/2.
	           ADC_CFG1_MODE(1) |       //single-end 16bit mode
	           ADC_CFG1_ADICLK(0);     //Bus clock         
	ADC0_CFG2 = ADC_CFG2_MUXSEL(1);
	ADC0_SC2 = ADC_SC2_DMAEN(1);  //ADC conversion complete DMA enable
	ADC0_SC3 = ADC_SC3_AVGE(1) |
		      ADC_SC3_AVGS(0);
	return;
}

void init_tpm1(void)
{
	uint32_t freqTpm;
	tpm_status_t ret;
	uint32_t tpmInstance;
	tpm_general_config_t tpmConfig =
	{
		.isDBGMode = false,
		.isGlobalTimeBase = true,
		.isTriggerMode = false,
		.triggerSource = kTpmTrigSel9,
		.isCountReloadOnTrig = true, // reload on overflow
	};

	// init the TPM driver
	tpmInstance = 1;
	ret = TPM_DRV_Init(tpmInstance, &tpmConfig);
	SIM_SCGC6 |= (SIM_SCGC6_TPM1_MASK);    //fix api bug
	SIM_WR_SOPT2_TPMSRC(SIM, 1);		   //fix api bug

	// set clock source to be IRC48MHz or from FLL/PLL source clock.
	TPM_DRV_SetClock(tpmInstance, kTpmClockSourceModuleClk, kTpmDividedBy1);

	// retrive the final TPM counting clock freq
	freqTpm = CLOCK_SYS_GetTpmFreq(tpmInstance) / (1 << kTpmDividedBy1);

	//rt_kprintf("freqTpm=%d\r\n",freqTpm);

	freqTpm /= (INPUT_SIGNAL_FREQ * ADC_SAMPLE_POINTS * DMA_OBJ_MAX); // convert to ms

	//rt_kprintf("freqTpm=%d\r\n",freqTpm);
	TPM_DRV_CounterStart(tpmInstance, kTpmCountingUp, freqTpm, false);
	TPM_WR_SC_DMA(TPM1, 1);
	return;
}

void init_adc_dma(void)
{
	SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;
	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;

	/*********************************************************************/
	/*DMA0作用:TPM1触发DMA0将ADC_Channel中的通道号传给ADC0_SC1A寄存器*/
	DMA_SAR0 = (uint32_t)ADC_Channel;    //Set source address to ADC_Channel
	DMA_DSR_BCR0 = DMA_DSR_BCR_BCR(sizeof(uint32_t) * DMA_BUFFER_SIZE);    //Set BCR to know how many bytes to transfer, 8 bytes for two 32-bit transfer
	if ((DMA_DSR_BCR0 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
	DMA_DSR_BCR0 |= DMA_DSR_BCR_DONE_MASK; 
	DMA_DCR0 |= (DMA_DCR_SSIZE(0)  | //32bits
				DMA_DCR_DSIZE(0)  | //32bits
				DMA_DCR_CS_MASK   |
				DMA_DCR_ERQ_MASK  | 
				DMA_DCR_SINC_MASK | //source increase enable
				DMA_DCR_SMOD(1)   | //32 bytes circular buffer,ADC_Channel数组
				DMA_DCR_LINKCC(3) | //linkcc=3,DMA0 BCR=0时将自动连接到link chanel,即DMA2
				DMA_DCR_LCH1(2));   // DMA Channel 2
	DMA_DAR0 = (uint32_t) &ADC0_SC1A;//0x4003B000;    //Set dest address to ADC0_SC1A
	DMAMUX0_CHCFG0 = DMAMUX_CHCFG_SOURCE(55);    //Select TPM1 overflow as channel source
	DMAMUX0_CHCFG0 |= DMAMUX_CHCFG_ENBL_MASK;    //Enable the DMA MUX channel


	/*********************************************************************/
	/*DMA2作用:DMA0 BCR=0时触发DMA2将DMA0的BCR恢复 */
	DMA_SAR2 = (uint32_t)(&DMA_BCR0[0]);	 //Set source address to ADC_Channel
	DMA_DSR_BCR2 = DMA_DSR_BCR_BCR(sizeof(DMA_BCR0));    //Set BCR to know how many bytes to transfer
	if ((DMA_DSR_BCR2 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
	DMA_DSR_BCR2 |= DMA_DSR_BCR_DONE_MASK; 
	DMA_DCR2 |= (DMA_DCR_SSIZE(0)  | //32bits
				DMA_DCR_DSIZE(0)  | //32bits
				DMA_DCR_SINC_MASK |
				DMA_DCR_ERQ_MASK);  //32 bytes circular buffer,ADC_Channel数组
	DMA_DAR2 = (uint32_t)&DMA_DSR_BCR0;//Set dest address to ADC0_SC1A	



	/*********************************************************************/
	/*DMA1作用:ADC0采样完成触发DMA1将采样值传到DMA_Result_Buffer */
	DMA_SAR1 = (uint32_t) &ADC0_RA;//0x4003B010;    //Set source address to ADC0_RA
	DMA_DSR_BCR1 = DMA_DSR_BCR_BCR(sizeof(uint16_t) * DMA_BUFFER_SIZE);    //Set BCR to know how many bytes to transfer
	if ((DMA_DSR_BCR1 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
	DMA_DSR_BCR1 |= DMA_DSR_BCR_DONE_MASK; 
	DMA_DCR1 |= (DMA_DCR_SSIZE(2) | //16bits
				DMA_DCR_DSIZE(2) | //16bits
				DMA_DCR_CS_MASK  | 
				DMA_DCR_ERQ_MASK | 
				DMA_DCR_DINC_MASK| // the destination address increments after each successful transfer.
				DMA_DCR_DMOD(7)  |  //1K bytes,DMA_Result_Buffer
				DMA_DCR_LINKCC(3)|  //linkcc=3,DMA1 BCR=0时将自动连接到link chanel,即DMA3
			    DMA_DCR_LCH1(3));   // DMA Channel 3
	DMA_DAR1 = (uint32_t)DMA_Result_Buffer;     //Set dest address to result buffer
	DMAMUX0_CHCFG1 = DMAMUX_CHCFG_SOURCE(40);   //Select ADC0 COCO flag as channel source
	DMAMUX0_CHCFG1 |= DMAMUX_CHCFG_ENBL_MASK;   //Enable the DMA MUX channel



	/*********************************************************************/
	/*DMA3作用:DMA1 BCR=0时触发DMA3将DMA1的BCR恢复,并且在DMA3的中断中将DMA2,DMA3的BCR改为8,通知任务取20ms的采样数据 */
	DMA_SAR3 = (uint32_t) (&DMA_BCR1[0]);//0x4003B010;	//Set source address to ADC0_RA
	DMA_DSR_BCR3 = DMA_DSR_BCR_BCR(sizeof(DMA_BCR1));    //Set BCR to know how many bytes to transfer
	if ((DMA_DSR_BCR3 & DMA_DSR_BCR_DONE_MASK) == DMA_DSR_BCR_DONE_MASK)
	DMA_DSR_BCR3 |= DMA_DSR_BCR_DONE_MASK; 
	DMA_DCR3 |= (DMA_DCR_SSIZE(0) | //32bits
				DMA_DCR_DSIZE(0) | //32bits
				DMA_DCR_SINC_MASK|
				DMA_DCR_ERQ_MASK |
				DMA_DCR_EINT_MASK); 
	DMA_DAR3 = (uint32_t) &DMA_DSR_BCR1; 	//Set dest address to result buffer
	NVIC_SetPriority (DMA3_IRQn, 2); /* set Priority for DMA Channel3 Interrupt*/
	INT_SYS_EnableIRQ(DMA3_IRQn);    

	return;
}


void DMA3_IRQHandler(void)
{
	if (DMA_DSR_BCR3 & DMA_DSR_BCR_DONE_MASK)
	{  
		DMA_DSR_BCR2 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
		DMA_DSR_BCR2 = DMA_DSR_BCR_BCR(sizeof(DMA_BCR0));      // Reset DMA Channel2 BCR
		DMA_SAR2 = (uint32_t)(&DMA_BCR0[0]);  //Set source address to ADC_Channel

		DMA_DSR_BCR3 |= DMA_DSR_BCR_DONE_MASK;      //Clear Done bit 
		DMA_DSR_BCR3 = DMA_DSR_BCR_BCR(sizeof(DMA_BCR1));      //Clear Done bit 
		DMA_SAR3 = (uint32_t)(&DMA_BCR1[0]);  //Set source address to ADC_Channel

		pCounter++;
		//dwtest++;
		rt_sem_release(g_adcManage.sample_finish_sem);
	}
}
