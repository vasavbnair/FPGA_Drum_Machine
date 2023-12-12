`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Zuofu Cheng
// 
// Create Date: 12/11/2022 10:48:49 AM
// Design Name: 
// Module Name: mb_usb_hdmi_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Top level for mb_lwusb test project, copy mb wrapper here from Verilog and modify
// to SV
// Dependencies: microblaze block design
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss, 
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,  
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,     
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB,
    //audio signals
    output logic mosi, 
    input logic miso, 
    output logic cs, 
    output logic sclk, 
    //pwmouts
    output logic PWML,
    output logic PWMR
    );
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk48khz, clk50Mhz, clk_125MHz, clk, clk_100MHz;
    logic locked;
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    
    // NEW STUFFFFFF
    
    //clock divider
    logic [15:0] countest;
    
    //fifo variables
    logic[15:0] fifo_out;
    logic full;
    logic fullcheck;
    logic emptycheck;
    
    //sdcard init variables
    logic raminiterror;
    logic raminitdone;
    logic[15:0] ramdataout;
    logic [24:0] ramaddress;
    logic ramwe;
    logic [7:0] outputofsd;
    
    //pwm vars
    logic pwmright, pwmleft;
    
    //posedgedetector vars
    logic blueballs;
    logic superblueballs;
    enum logic [12:0]{INIT, READBLOCK, READL_0, READL_1, READH_0, READH_1, WRITE, ERROR, DONE, HOLUP, HOLUP2, LESGO, RESET} state_r, state_x;

    //graphics 
    logic [3:0] current_channel;
    logic [3:0][11:0] beats;
    logic [11:0] channelzero;
    logic [11:0] channelone;
    logic [11:0] channeltwo;
    logic [11:0] channelthree;
    logic go;
    logic go2;
    logic[1:0] pauseb;
    
    
    logic[3:0] soundselect;
    //Keycode HEX drivers
    HexDriver HexA (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], keycode0_gpio[19:16]}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    HexDriver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );
    
    mb_usb mb_block_i(
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );

    
    //Ball Module
    ball ball_instance(
        .Reset(reset_ah),
        .frame_clk(vsync),                    //Figure out what this should be so that the ball will move
        .pause(pauseb),
        .BallX(ballxsig),
        .BallY(ballysig),
        .BallS(ballsizesig)
    );
    
    //Color Mapper Module   
    color_mapper color_instance(
        .BallX(ballxsig),
        .BallY(ballysig),
        .DrawX(drawX),
        .DrawY(drawY),
        .Ball_size(ballsizesig),
        .channelnum(current_channel),
        .channel0(channelzero),
        .channel1(channelone),
        .channel2(channeltwo),
        .channel3(channelthree),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
    clockdivider dividebruh( // CREATES MY 50 MHZ CLOCK
    .clkin(Clk),
    .clkout(clk50Mhz)
    );

    clockdivider48 audioclock( // CREATES MY 48 kHZ CLOCK
    .clkin(Clk),
    .clkout(clk48khz),
    .counter(countest)
    );
    

    //pwm module
    pwm pwmer(
    .clk(clk50Mhz),
    .sample(fifo_out),   
    .right_channel(PWMR),
    .left_channel(PWML)
    );


    //make the fifo
    fifo_generator_0 bruhwork (
    .full(fullcheck),    //don't use it now may later
    .din(ramdataout),
    .wr_en(ramwe),
    .empty(emptycheck),  //don't use it now may later
    .dout(fifo_out),
    .rd_en(blueballs),
    .clk(clk50Mhz),
    .srst(reset_ah),
    .prog_full(full)     // DO I EVER USE THIS? 
    );
    
//    //pos_edge_detect module
    pos_edge_detect edgeallover(
    .clk(clk50Mhz),
    .signal(clk48khz),          // SHOULD BE 48 KHZ
    .reset(reset_ah),
    .align(blueballs)
    );
    
    pos_edge_detect edgealloverv2(
    .clk(clk50Mhz),
    .signal(go),          // SHOULD BE 48 KHZ
    .reset(reset_ah),
    .align(superblueballs)
    );

//    //sdcard_init module
    sdcard_init ihatethis (
    .GO(superblueballs),
    .clk50(clk50Mhz),
    .reset(reset_ah),
    .ram_we(ramwe),
    .ram_address(ramaddress),
    .ram_data(ramdataout),
    .ram_op_begun(blueballs),
    .ram_init_error(raminiterror),
    .ram_init_done(raminitdone),
    .cs_bo(cs),
    .sclk_o(sclk),
    .mosi_o(mosi),
    .miso_i(miso),
    .outs(outputofsd),
    .sound_select(soundselect),
    .state_r(state_r), 
    .state_x(state_x)    
    );
    
    graphics_fsm graphic(
    .Clk(vsync),
    .keycode(keycode0_gpio[7:0]),
    .channelnum(current_channel),
     .GO(go2)
    );
    
    beatselect playbeats(
     .Clk(vsync),
     .Reset(reset_ah),
     .channelnum(current_channel),
     .keycode(keycode0_gpio[7:0]),
     .channel0(channelzero),
     .channel1(channelone),
     .channel2(channeltwo),
     .channel3(channelthree)
     );
     
     pause pausebutton(
     .Clk(vsync),
     .keycode(keycode0_gpio[7:0]),
     .pause(pauseb)
     );
     
     
     cursorcheck check(
     .Clk(vsync),
     .BallX(ballxsig), 
     .channelnum(current_channel),
     .channel0(channelzero),
     .channel1(channelone),
     .channel2(channeltwo),
     .channel3(channelthree),
     .soundselect(soundselect),
     .GO(go)
     );
    
    ila_0 myila (
    .clk(Clk),
    .probe0(clk_100Mhz),
    .probe1(clk48khz),   //changing to 25 bit temp
    .probe2(clk50Mhz),      
    .probe3(superblueballs),  //read enable 
    .probe4(PWMR),       
    .probe5(PWML),
    .probe6(fifo_out),      //16 bit
    .probe7(ramaddress),     //25 bit
    .probe8(ramdataout),      //16 bit
    .probe9(countest),         // 16 bit
    .probe10(ram_we),
    .probe11(state_r)
    ); 
    
endmodule
