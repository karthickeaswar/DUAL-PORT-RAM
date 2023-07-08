module DualPortRAM (
  input wire clk,
  input wire [9:0] addr_a,
  input wire [9:0] addr_b,
  input wire [7:0] data_a,
  input wire [7:0] data_b,
  input wire we_a,
  input wire we_b,
  output reg [7:0] q_a,
  output reg [7:0] q_b
);

  reg [7:0] mem [0:1023];

  always @(posedge clk) begin
    if (we_a)
      mem[addr_a] <= data_a;
    if (we_b)
      mem[addr_b] <= data_b;
    q_a <= mem[addr_a];
    q_b <= mem[addr_b];
  end

endmodule
