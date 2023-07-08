module DualPortRAM_TB;

  reg clk;
  reg [9:0] addr_a, addr_b;
  reg [7:0] data_a, data_b;
  reg we_a, we_b;
  wire [7:0] q_a, q_b;

  DualPortRAM dut (
    .clk(clk),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .data_a(data_a),
    .data_b(data_b),
    .we_a(we_a),
    .we_b(we_b),
    .q_a(q_a),
    .q_b(q_b)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    // Write data to both ports
    addr_a = 10;
    addr_b = 20;
    data_a = 8'hAA;
    data_b = 8'h55;
    we_a = 1;
    we_b = 1;
    #10;
    we_a = 0;
    we_b = 0;
    #10;

    // Read data from both ports
    addr_a = 10;
    addr_b = 20;
    we_a = 0;
    we_b = 0;
    #10;

    // Display the read values
    $display("Data read from Port A: %h", q_a);
    $display("Data read from Port B: %h", q_b);

    // Finish simulation
    $finish;
  end

endmodule
