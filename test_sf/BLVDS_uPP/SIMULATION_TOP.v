module SIMULATION_TOP 
(
    input         iCLK,                               // Сигнал тактирования для PLL

    output [15:0] oDATA_UPP,                          //
    output        oC1_112MHZ,oC3_140MHZ,oC3_70MHZ_PS, // Сигналы с выхода PLL для SignalTap II и uPP
    output        oENA                                // Сигнал enable для uPP
);

    wire          wC0_56MHZ,wC2_70MHZ;
    wire          wGPIO_0;             
    reg    [25:0] rTIME_CNT;
    reg           rBLVDS_TX_INIT;
    wire          wGPIO5;
    wire   [17:0] wDATA_BLVDS;
// Константа для отправки кадра по BLVDS (симуляция) с определенной периодичностью BLVDS_INIT_PERIOD
    localparam BLVDS_INIT_PERIOD = 26'd50000000; // 26'd50000000 - раз в секунду
// Мегафункция ALTPLL для формирования тактирующих сигналов
pll1 pll1_inst (
    .inclk0 ( iCLK         ),
    .c0     ( wC0_56MHZ    ),
    .c1     ( oC1_112MHZ   ),
    .c2     ( wC2_70MHZ    ),
    .c3     ( oC3_70MHZ_PS ),
    .c4     ( oC3_140MHZ   )
);
// Инициализация отправки кадра по BLVDS (симуляция) с определенной периодичностью BLVDS_INIT_PERIOD
always @(posedge wC0_56MHZ) begin
    if (rTIME_CNT < BLVDS_INIT_PERIOD) begin
        rTIME_CNT      <= rTIME_CNT + 26'd1;
        rBLVDS_TX_INIT <= 0;
    end
    else begin
        rBLVDS_TX_INIT <= 1;
        rTIME_CNT      <= 0;
    end
end
// Модуль верхнего уровня интерфейсов BLVDS и uPP
BLVDS_uPP_TOP BLVDS_uPP_TOP_inst (
    .iC0_56MHZ   ( wC0_56MHZ   ) ,
    .iC2_70MHZ   ( wC2_70MHZ   ) ,
    .iGPIO5      ( wGPIO5      ) ,      
    .iDATA_BLVDS ( wDATA_BLVDS ) ,
    .oGPIO_0     ( wGPIO_0     ) , 
    .oDATA_UPP   ( oDATA_UPP   ) ,
    .oENA        ( oENA        )    
);
// Модуль формирования и отправки кадров по BLVDS (симуляция)
user_bcvs user_bcvs_inst (
    .iclk           ( wC0_56MHZ             ) ,                     
    .ireset         (                       ) ,                            
    .isig_initial   ( rBLVDS_TX_INIT        ) ,        
    .iIm_Re_sample  ( {6'b110011,rTIME_CNT} ) ,
    .format         (                       ) ,                            
    .channels       (                       ) ,                          
    .num_pack       ( 8'd2                  ) ,                      
    .numOI          ( 16'hFFFF              ) ,                     
    .numTIR         ( 16'hFFFF              ) ,                    
    .lPPS           ( 32'hF5F5F5F5          ) ,                  
    .ARUSH          ( 32'hF5F5F5F5          ) ,                 
    .Bcur           ( 16'hFFFF              ) ,                      
    .Icur           ( 16'hFFFF              ) ,                      
    .size_pack      ( 8'd2                  ) ,                     
    .osig_init_sig  (                       ) ,                     
    .oRd_addr_BLVDS (                       ) ,                    
    .oUser_data     ( wDATA_BLVDS           )               
);
// Модуль симуляции прерываний от DSP
gpio5_sim gpio5_sim_inst (
    .iclk        ( wC2_70MHZ ) ,
    .ibutton     ( wGPIO_0   ) ,
    .o_start_str ( wGPIO5    )  
);

defparam gpio5_sim_inst.HIGH_LENGTH = 9'd200; // Регулируемая длительность удержания GPIO_5 в состоянии лог. "1"
defparam gpio5_sim_inst.LOW_LENGTH  = 9'd200; // Регулируемая длительность удержания GPIO_5 в состоянии лог. "0"

endmodule
