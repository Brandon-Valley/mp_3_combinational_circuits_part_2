// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__multiplier_4_bit_unsigned_v.do

`timescale 1ms/1ms

module multiplier_4_bit_unsigned_tb_v;

  reg  signed [4:0] i_au ;
  reg  signed [4:0] i_bu ;
  wire signed [8:0] o_fu ;

  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  multiplier_4_bit_unsigned_v  duv (
                            .i_au (i_au ),
                            .i_bu (i_bu ),
                            .o_fu (o_fu )
  );

  //procedure statement
  initial begin
  
  #1000 i_au  = 0;//5'b00000;
        i_bu  = 0;//5'b00000;

  #1000 i_au  = -15;//5'b11111;
        i_bu  = 15 ;//5'b01111;

  #1000 i_au  = -15;//5'b11111;
        i_bu  = 0  ;//5'b00000;

  #1000 i_au  = 1;//5'b00010;
        i_bu  = 3;//5'b00100;
        
        
        

  // not executed
  #1000 i_au  = 5'b00000;
        i_bu  = 5'b00000;


      // //                      |
      // //                      |
      // //                      V
      // for (i = 0 ; i < ( 2 ** 3 ) + 2 ; i = i + 1) begin
        // #1000 i_au  = d_in[0];
              // i_bu  = d_in[1];
              // i_cs  = d_in[2];
      
        // // #1000 i_code = d_in;
        // // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        // d_in = d_in + 1;
      // end
          
    end

endmodule
