// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus Prime Version 16.0 (Build Build 211 04/27/2016)
// Created on Mon Mar 23 09:02:45 2020

GPIO_SOLVER GPIO_SOLVER_inst
(
	.iCLK(iCLK_sig) ,	// input  iCLK_sig
	.iRST(iRST_sig) ,	// input  iRST_sig
	.iSTART(iSTART_sig) ,	// input  iSTART_sig
	.iGPIO_5(iGPIO_5_sig) ,	// input  iGPIO_5_sig
	.iEMPTY(iEMPTY_sig) ,	// input  iEMPTY_sig
	.iFULL(iFULL_sig) ,	// input  iFULL_sig
	.iSEL_CHANNEL(iSEL_CHANNEL_sig) ,	// input  iSEL_CHANNEL_sig
	.iUSEDW(iUSEDW_sig) ,	// input [8:0] iUSEDW_sig
	.iFIFO_OUT(iFIFO_OUT_sig) ,	// input [15:0] iFIFO_OUT_sig
	.oDATA_UPP(oDATA_UPP_sig) ,	// output [15:0] oDATA_UPP_sig
	.oRD_REQ(oRD_REQ_sig) ,	// output  oRD_REQ_sig
	.oACLR_FIFO(oACLR_FIFO_sig) ,	// output  oACLR_FIFO_sig
	.oGPIO_0(oGPIO_0_sig) ,	// output  oGPIO_0_sig
	.oSEL_CHANNEL(oSEL_CHANNEL_sig) ,	// output  oSEL_CHANNEL_sig
	.oENA(oENA_sig) 	// output  oENA_sig
);

defparam GPIO_SOLVER_inst.GPIO_5 = 0;
defparam GPIO_SOLVER_inst.USEDW = 1;
defparam GPIO_SOLVER_inst.FIFO_LATENCY = 2;
defparam GPIO_SOLVER_inst.DATA_READ = 3;
defparam GPIO_SOLVER_inst.GPIO_0 = 4;
defparam GPIO_SOLVER_inst.END_LATENCY = 5;
