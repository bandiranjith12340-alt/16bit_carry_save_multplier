`timescale 1ns/1ps
module csa_multiplier_16bit_tb;

reg  [31:0] a, b;
wire [63:0] p;

csa_multiplier_16bit uut(.A(a), .B(b), .P(p));

initial begin
    $monitor("Time=%0t A=%d B=%d -> P=%d", $time, a, b, p);

    a=3;         b=5;         #10;
    a=1000;      b=2000;      #10;
    a=65535;     b=65535;     #10;
    a=123456;    b=789012;    #10;
    a=32'hFFFF_FFFF; b=32'hFFFF_FFFF; #10;

    $finish;
end

endmodule
