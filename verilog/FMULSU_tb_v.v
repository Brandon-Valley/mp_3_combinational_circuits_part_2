// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULSU_v.do

`timescale 1ms/1ms

module FMULSU_tb_v;

  reg  signed [7:0] i_rd  ;
  reg  signed [7:0] i_rr  ;
  wire signed [7:0] o_r1 ;
  wire signed [7:0] o_r0 ;

  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  FMULSU_v  duv (
                            .i_rd  (i_rd  ),
                            .i_rr  (i_rr  ),
                            .o_r1 (o_r1 ),
                            .o_r0 (o_r0 )
  );

  //procedure statement
  initial begin
  
  #1000 i_rd  = 8'b10000000;  
        i_rr  = 8'b10000000;  
                 
  #1000 i_rd  = 8'b10000000 ; 
        i_rr  = 8'b00000000 ;
                 
  #1000 i_rd  = 8'b01000000; 
        i_rr  = 8'b01000000;
        
  #1000 i_rd  = 8'b00000001; 
        i_rr  = 8'b00000001;        
                 
  #1000 i_rd  = 8'b01000000;  
        i_rr  = 8'b11000000;  
        
        
        

  // not executed
  #1000 i_rd  = 0;
        i_rr  = 0;


      // //                      |
      // //                      |
      // //                      V
      // for (i = 0 ; i < ( 2 ** 3 ) + 2 ; i = i + 1) begin
        // #1000 i_rd  = d_in[0];
              // i_rr  = d_in[1];
              // i_cs  = d_in[2];
      
        // // #1000 i_code = d_in;
        // // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        // d_in = d_in + 1;
      // end
          
    end

endmodule
