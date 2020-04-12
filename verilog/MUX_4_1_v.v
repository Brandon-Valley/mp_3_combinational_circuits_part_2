// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__MUX_4_1_2_bit_v.do



//  Behavior Model
module MUX_4_1_v
  (
  input        i_en,
  input  [3:0] i_code,
  input  [1:0] i_sel_code, 
  output       o_f);
  

  assign o_f = i_sel_code == 2'b00 & i_code[0] & i_en ? 1 :
               i_sel_code == 2'b01 & i_code[1] & i_en ? 1 :
               i_sel_code == 2'b10 & i_code[2] & i_en ? 1 :
               i_sel_code == 2'b11 & i_code[3] & i_en ? 1 : 0;
  
endmodule