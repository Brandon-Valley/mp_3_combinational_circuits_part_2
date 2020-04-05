// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do

`timescale 1ms/1ms

// 7X-3Y+6Z
module signed_calc_tb_v;


  // reg  i_a    ;
  // reg  i_b    ;
  // reg  i_carry;
  // wire o_s    ;
  // wire o_carry;

  reg  unsigned [3:0] i_as ;
  reg  unsigned [3:0] i_bs ;
  reg  unsigned [3:0] i_cs ;
  wire unsigned [7:0] o_fs ;

  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  signed_calc_v  duv (
                            .i_as (i_as ),
                            .i_bs (i_bs ),
                            .i_cs (i_cs ),
                            .o_fs (o_fs )
  );

  //procedure statement
  initial begin
  
  #1000 i_as  = 4'b0000;
        i_bs  = 4'b0000;
        i_cs  = 4'b0000;
        
  
  #1000 i_as  = 4'b1111;
        i_bs  = 4'b1111;
        i_cs  = 4'b1111;
  
  #1000 i_as  = 4'b1111;
        i_bs  = 4'b0000;
        i_cs  = 4'b1111;
  
  #1000 i_as  = 4'b0001;
        i_bs  = 4'b0010;
        i_cs  = 4'b0100;  
        
        
        

  // not executed
  #1000 i_as  = 0000;
        i_bs  = 0000;
        i_cs  = 0000;        


      // //                      |
      // //                      |
      // //                      V
      // for (i = 0 ; i < ( 2 ** 3 ) + 2 ; i = i + 1) begin
        // #1000 i_as  = d_in[0];
              // i_bs  = d_in[1];
              // i_cs  = d_in[2];
      
        // // #1000 i_code = d_in;
        // // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        // d_in = d_in + 1;
      // end
          
    end

endmodule
