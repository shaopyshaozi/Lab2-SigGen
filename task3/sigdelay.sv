module sigdelay #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
)(
    //interface signals
    input logic             clk,    //clock
    input logic             rst,    //reset
    input logic             en,     //enable
    input logic [A_WIDTH-1:0]            incr,   //increment for addr counter
    input logic             wr,
    input logic             rd,
    input logic [D_WIDTH-1:0]       mic_signal,
    input logic [A_WIDTH-1:0]         offset,
    output logic [D_WIDTH-1:0]           delayed_signal    // output data
);

    logic [A_WIDTH-1:0]         address; //interconnect wire
;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

ramdual Ram_Delay (
    .clk(clk),
    .wr(wr),
    .rd(rd),
    .wr_addr (address),
    .offset (offset),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
