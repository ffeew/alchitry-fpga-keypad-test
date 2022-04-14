/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [3:0] keypadrow,
    input [3:0] keypadcol,
    output reg outled
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [4-1:0] M_keypadInstance_out_row;
  wire [1-1:0] M_keypadInstance_button_0;
  wire [1-1:0] M_keypadInstance_button_1;
  wire [1-1:0] M_keypadInstance_button_2;
  wire [1-1:0] M_keypadInstance_button_3;
  wire [1-1:0] M_keypadInstance_button_4;
  wire [1-1:0] M_keypadInstance_button_5;
  wire [1-1:0] M_keypadInstance_button_6;
  wire [1-1:0] M_keypadInstance_button_7;
  wire [1-1:0] M_keypadInstance_button_8;
  wire [1-1:0] M_keypadInstance_button_9;
  wire [1-1:0] M_keypadInstance_button_a;
  wire [1-1:0] M_keypadInstance_button_b;
  wire [1-1:0] M_keypadInstance_button_c;
  wire [1-1:0] M_keypadInstance_button_d;
  wire [1-1:0] M_keypadInstance_button_asterisk;
  wire [1-1:0] M_keypadInstance_button_hash;
  reg [4-1:0] M_keypadInstance_in_col;
  keypadDriver_2 keypadInstance (
    .clk(clk),
    .rst(rst),
    .in_col(M_keypadInstance_in_col),
    .out_row(M_keypadInstance_out_row),
    .button_0(M_keypadInstance_button_0),
    .button_1(M_keypadInstance_button_1),
    .button_2(M_keypadInstance_button_2),
    .button_3(M_keypadInstance_button_3),
    .button_4(M_keypadInstance_button_4),
    .button_5(M_keypadInstance_button_5),
    .button_6(M_keypadInstance_button_6),
    .button_7(M_keypadInstance_button_7),
    .button_8(M_keypadInstance_button_8),
    .button_9(M_keypadInstance_button_9),
    .button_a(M_keypadInstance_button_a),
    .button_b(M_keypadInstance_button_b),
    .button_c(M_keypadInstance_button_c),
    .button_d(M_keypadInstance_button_d),
    .button_asterisk(M_keypadInstance_button_asterisk),
    .button_hash(M_keypadInstance_button_hash)
  );
  reg [15:0] M_keypadVal_d, M_keypadVal_q = 32'h0000000f;
  wire [8-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [24-1:0] M_led_strip_color;
  ws2812b_writer_3 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .color(M_led_strip_color),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  localparam LEDCOLOR = 144'hff000000ff000000ff0ff000000ff0f0000f;
  
  always @* begin
    M_keypadVal_d = M_keypadVal_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_keypadInstance_in_col = keypadcol;
    keypadrow = M_keypadInstance_out_row;
    outled = 1'h0;
    io_led = 24'h000000;
    io_led[16+2+3-:4] = M_keypadInstance_out_row;
    io_led[16+7+0-:1] = 1'h1;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    usb_tx = usb_rx;
    M_keypadVal_d[0+0-:1] = M_keypadInstance_button_1;
    M_keypadVal_d[1+0-:1] = M_keypadInstance_button_2;
    M_keypadVal_d[2+0-:1] = M_keypadInstance_button_3;
    M_keypadVal_d[3+0-:1] = M_keypadInstance_button_a;
    M_keypadVal_d[4+0-:1] = M_keypadInstance_button_4;
    M_keypadVal_d[5+0-:1] = M_keypadInstance_button_5;
    M_keypadVal_d[6+0-:1] = M_keypadInstance_button_6;
    M_keypadVal_d[7+0-:1] = M_keypadInstance_button_b;
    M_keypadVal_d[8+0-:1] = M_keypadInstance_button_7;
    M_keypadVal_d[9+0-:1] = M_keypadInstance_button_8;
    M_keypadVal_d[10+0-:1] = M_keypadInstance_button_9;
    M_keypadVal_d[11+0-:1] = M_keypadInstance_button_c;
    M_keypadVal_d[12+0-:1] = M_keypadInstance_button_asterisk;
    M_keypadVal_d[13+0-:1] = M_keypadInstance_button_0;
    M_keypadVal_d[14+0-:1] = M_keypadInstance_button_hash;
    M_keypadVal_d[15+0-:1] = M_keypadInstance_button_d;
    M_led_strip_update = 1'h1;
    M_led_strip_color = LEDCOLOR[(M_led_strip_pixel)*24+23-:24];
    outled = M_led_strip_led;
    
    case (M_keypadVal_q)
      16'h0001: begin
        io_led[0+0+0-:1] = 1'h1;
      end
      16'h0002: begin
        io_led[0+1+0-:1] = 1'h1;
      end
      16'h0004: begin
        io_led[0+2+0-:1] = 1'h1;
      end
      16'h0008: begin
        io_led[0+3+0-:1] = 1'h1;
      end
      16'h0010: begin
        io_led[0+4+0-:1] = 1'h1;
      end
      16'h0020: begin
        io_led[0+5+0-:1] = 1'h1;
      end
      16'h0040: begin
        io_led[0+6+0-:1] = 1'h1;
      end
      16'h0080: begin
        io_led[0+7+0-:1] = 1'h1;
      end
      16'h0100: begin
        io_led[8+0+0-:1] = 1'h1;
      end
      16'h0200: begin
        io_led[8+1+0-:1] = 1'h1;
      end
      16'h0400: begin
        io_led[8+2+0-:1] = 1'h1;
      end
      16'h0800: begin
        io_led[8+3+0-:1] = 1'h1;
      end
      16'h1000: begin
        io_led[8+4+0-:1] = 1'h1;
      end
      16'h2000: begin
        io_led[8+5+0-:1] = 1'h1;
      end
      16'h4000: begin
        io_led[8+6+0-:1] = 1'h1;
      end
      16'h8000: begin
        io_led[8+7+0-:1] = 1'h1;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_keypadVal_q <= 32'h0000000f;
    end else begin
      M_keypadVal_q <= M_keypadVal_d;
    end
  end
  
endmodule