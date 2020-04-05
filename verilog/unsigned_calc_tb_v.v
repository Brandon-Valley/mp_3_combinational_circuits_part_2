// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__unsigned_calc_v.do

`timescale 1ms/1ms

module unsigned_calc_tb_v;


  // reg  i_a    ;
  // reg  i_b    ;
  // reg  i_carry;
  // wire o_s    ;
  // wire o_carry;

  reg  unsigned [3:0] i_au ;
  reg  unsigned [3:0] i_bu ;
  reg  unsigned [3:0] i_cu ;
  wire unsigned [7:0] o_fu ;

  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  unsigned_calc_v  duv (
                            .i_au (i_au ),
                            .i_bu (i_bu ),
                            .i_cu (i_cu ),
                            .o_fu (o_fu )
  );

  //procedure statement
  initial begin
  
  #1000 i_au  = 0000;
        i_bu  = 0000;
        i_cu  = 0000;
        
  
  #1000 i_au  = 1111;
        i_bu  = 1111;
        i_cu  = 1111;
  
  #1000 i_au  = 1111;
        i_bu  = 0000;
        i_cu  = 1111;
  
  #1000 i_au  = 0001;
        i_bu  = 0010;
        i_cu  = 0100;  


  // not executed
  #1000 i_au  = 0000;
        i_bu  = 0000;
        i_cu  = 0000;        


      // //                      |
      // //                      |
      // //                      V
      // for (i = 0 ; i < ( 2 ** 3 ) + 2 ; i = i + 1) begin
        // #1000 i_au  = d_in[0];
              // i_bu  = d_in[1];
              // i_cu  = d_in[2];
      
        // // #1000 i_code = d_in;
        // // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        // d_in = d_in + 1;
      // end
          
    end

endmodule
