// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do

`timescale 1ms/1ms

module signed_calc_tb_v;

  reg  signed [4:0] i_as ;
  reg  signed [4:0] i_bs ;
  wire signed [8:0] o_fs ;

  
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  signed_calc_v  duv (
                            .i_as (i_as ),
                            .i_bs (i_bs ),
                            .o_fs (o_fs )
  );

  //procedure statement
  initial begin
  
  #1000 i_as  = 0;//5'b00000;
        i_bs  = 0;//5'b00000;

  #1000 i_as  = -15;//5'b11111;
        i_bs  = 15 ;//5'b01111;

  #1000 i_as  = -15;//5'b11111;
        i_bs  = 0  ;//5'b00000;

  #1000 i_as  = 1;//5'b00010;
        i_bs  = 3;//5'b00100;
        
        
        

  // not executed
  #1000 i_as  = 5'b00000;
        i_bs  = 5'b00000;


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
