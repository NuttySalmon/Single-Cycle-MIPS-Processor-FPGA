`timescale 1ns / 1ps
module tb_gpio;
    reg tb_clk, tb_rst;
    reg [1:0] tb_A;
    reg tb_WE;
    reg [31:0] tb_WD;
    wire [31:0] tb_RD;
    reg [31:0] tb_gpI1, tb_gpI2;
    wire [31:0] tb_gpO1, tb_gp02;
    
    GPIO DUT(
        .clk        (tb_clk),
        .rst        (tb_rst),
        .A          (tb_A),
        .we         (tb_WE),
        .wd         (tb_WD),
        .rd         (tb_RD),
        .gpI1       (tb_gpI1),
        .gpI2       (tb_gpI2),
        .gpO1       (tb_gpO1),
        .gpO2       (tb_gp02)
    
    );
    
    task tick; 
    begin 
        tb_clk = 1'b0; #5;
        tb_clk = 1'b1; #5;
    end
    endtask

    task reset;
    begin 
        tb_rst = 1'b1; #5;
        tb_rst = 1'b0; #5;
    end
    endtask
    
    initial begin
        reset;
        tb_gpI1 = 32'b11;
        tb_gpI2 = 32'b10;
        tb_WD = 32'b01;
        tb_WE = 1'b1;
        tb_A = 2'b00; //gpI1
        tick;
        
        tb_A = 2'b01; //gpI2
        tick;
        
        tb_A = 2'b10; //gpO1
        tick;
        
        tb_A = 2'b11; //gpO2
        tick;
        
        $finish;
    
    end    
    
    
    

endmodule
