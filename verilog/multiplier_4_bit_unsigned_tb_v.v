// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__multiplier_4_bit_unsigned_v.do

`timescale 1ms/1ms

module multiplier_4_bit_unsigned_tb_v;

  reg  unsigned [3:0] i_au ;
  reg  unsigned [3:0] i_bu ;
  wire unsigned [7:0] o_fu ;

  
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
  
  #1000 i_au  = 0;  
        i_bu  = 0;  

  #1000 i_au  = 15; 
        i_bu  = 15 ;

  #1000 i_au  = 15; 
        i_bu  = 0  ;

  #1000 i_au  = 5;  
        i_bu  = 6;  
        
        
        

  // not executed
  #1000 i_au  = 0;
        i_bu  = 0;


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
