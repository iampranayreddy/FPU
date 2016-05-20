//-----------------------------------------------------------
// File: fpu_tb.v
// FPU Test Bench
//-----------------------------------------------------------
`timescale 1 ns/100 ps
module fpu_tb ();
 //----------------------------------------------------------
 // inputs to the DUT are reg type
 reg clock;
 reg [31:0] a, b;
 reg [1:0] op;
 reg [31:0] correct;
 //----------------------------------------------------------
 // outputs from the DUT are wire type
 wire [31:0] out;
 wire [49:0] pro;
 //----------------------------------------------------------
 // instantiate the Device Under Test (DUT)
 // using named instantiation
 fpu U1 (
          .clk(clock),
          .A(a),
          .B(b),
          .opcode(op),
          .O(out)
        );
 //----------------------------------------------------------
 // create a 10Mhz clock
 always
 #100 clock = ~clock; // every 100 nanoseconds invert
 //----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial
 begin
 $dumpfile("fpu_tb.vcd");
 $dumpvars(0,clock, a, b, op, out);
 clock = 0;op = 2'b11;
a = 32'b11101011110110011101010110100101;
b = 32'b10110111111001011011111011001010;
correct = 32'b01100100010000110111111001110101;
#400 //-5.26692e+26 * -2.73878e-05 = 1.44249e+22
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
a = 32'b11011000011010011111101010011101;
b = 32'b00100001110101010100000000001000;
correct = 32'b10111010110000101110100000001011;
#400 //-1.02905e+15 * 1.44504e-18 = -0.00148702
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
a = 32'b01011101001000111110101110000010;
b = 32'b01000010001010101000010111100010;
correct = 32'b01011111110110100110000000111101;
#400 //7.3823e+17 * 42.6307 = 3.14713e+19
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
a = 32'b01001011001111010101110010101101;
b = 32'b00111001101001000010110111101010;
correct = 32'b01000101011100101110001010101010;
#400 //1.241e+07 * 0.000313147 = 3886.17
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
a = 32'b00110111110100111110110100000100;
b = 32'b01110011000100010110100111101101;
correct = 32'b01101011011100001100000111011111;
#400 //2.52635e-05 * 1.15209e+31 = 2.91058e+26
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
a = 32'b00110001100100000100110010010000;
b = 32'b00111110001100100111110100010101;
correct = 32'b00110000010010010011011101111011;
#400 //4.19966e-09 * 0.174305 = 7.32022e-10
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
$display ("Output : %b %b %b", out[31], out[30:23], out[22:0]);
$display ("Correct: %b %b %b",correct[31], correct[30:23], correct[22:0]); end
$display ("Done.");
$finish;
 // stop the simulation
 end

endmodule