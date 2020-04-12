// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__unsigned_calc_v.do

`timescale 1ms/1ms

// 7X-3Y+6Z
module unsigned_calc_tb_v;

  reg  unsigned [3:0] i_au ;
  reg  unsigned [3:0] i_bu ;
  reg  unsigned [3:0] i_cu ;
  wire unsigned [8:0] o_fu ;

  
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
  
  #1000 i_au  = 4'b0000;
        i_bu  = 4'b0000;
        i_cu  = 4'b0000;
        
  
  #1000 i_au  = 4'b1111;
        i_bu  = 4'b1111;
        i_cu  = 4'b1111;
  
  #1000 i_au  = 4'b1111;
        i_bu  = 4'b0000;
        i_cu  = 4'b1111;
  
  #1000 i_au  = 4'b0001;
        i_bu  = 4'b0010;
        i_cu  = 4'b0100;  
        
  #1000 i_au  = 4'b0000;
        i_bu  = 4'b1111;
        i_cu  = 4'b0000;  
        
        
        

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







// vsim -voptargs=+acc work.unsigned_calc_tb_v
 
// add wave -position insertpoint    \
// sim:/unsigned_calc_tb_v/i_au\
// sim:/unsigned_calc_tb_v/i_bu\
// sim:/unsigned_calc_tb_v/i_cu\
// sim:/unsigned_calc_tb_v/o_fu\
// sim:/unsigned_calc_tb_v/duv/au_x_7 \
// sim:/unsigned_calc_tb_v/duv/bu_x_neg_3 \
// sim:/unsigned_calc_tb_v/duv/cu_x_6\
// sim:/unsigned_calc_tb_v/duv/sum_7x_neg_3y_f

// run -all
