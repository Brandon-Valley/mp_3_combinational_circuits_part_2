// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__full_adder_v.do

`timescale 1ms/1ms

module full_adder_tb_v;
  
  // reg        a     ;
  // reg        b     ;
  // reg        c     ;
  // reg  [1:0] i_code;
  // wire       o_f   ;

  reg  i_a    ;
  reg  i_b    ;
  reg  i_carry;
  wire o_s    ;
  wire o_carry;
  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  full_adder_v  duv (
                            .i_a    (i_a    ),
                            .i_b    (i_b    ),
                            .i_carry(i_carry),
                            .o_s    (o_s    ),
                            .o_carry(o_carry)
  );

  //procedure statement
  initial begin

      //                      |
      //                      |
      //                      V
      for (i = 0 ; i < ( 2 ** 3 ) + 2 ; i = i + 1) begin
        #1000 i_a     = d_in[0];
              i_b     = d_in[1];
              i_carry = d_in[2];
              
      
        // #1000 i_code = d_in;
        // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        d_in = d_in + 1;
      end
          
    end

endmodule
