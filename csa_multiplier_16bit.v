// =============================================================
// 16-bit Carry-Save Multiplier (Structural CSA Design)
// =============================================================

module csa_multiplier_16bit (
    input  [15:0] A, B,
    output [31:0] P
);

wire [15:0] pp [15:0];

// Generate Partial Products
genvar i,j;
generate
for(i=0;i<16;i=i+1) begin
    for(j=0;j<16;j=j+1) begin
        assign pp[i][j] = A[j] & B[i];
    end
end
endgenerate

// Align & Expand to 32 bit
wire [31:0] pp_ext [15:0];
generate
for(i=0;i<16;i=i+1) begin
    assign pp_ext[i] = { {16-i{1'b0}}, pp[i], {i{1'b0}} };
end
endgenerate

// CSA stages
wire [31:0] sum[14:0], carry[14:0];

CSA_32bit csa0 (pp_ext[0], pp_ext[1], pp_ext[2], sum[0], carry[0]);

generate
for(i = 1; i < 14; i=i+1) begin
    CSA_32bit csa (sum[i-1], carry[i-1]<<1, pp_ext[i+2], sum[i], carry[i]);
end
endgenerate

// Final CPA
assign P = sum[13] + (carry[13] << 1);

endmodule


// =================== 32-bit CSA block =======================
module CSA_32bit(input [31:0] x, y, z,
                 output [31:0] sum, carry);
genvar k;
generate
for(k=0;k<32;k=k+1) begin
    assign sum[k]   = x[k] ^ y[k] ^ z[k];
    assign carry[k] = (x[k] & y[k]) | (y[k] & z[k]) | (x[k] & z[k]);
end
endgenerate
endmodule
