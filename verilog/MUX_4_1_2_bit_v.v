// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__MUX_4_1_2_bit_v.do



//  Component Model
module MUX_4_1_2_bit_v
  (
  input        i_en,
  input  [1:0] i_code_0,
  input  [1:0] i_code_1,
  input  [1:0] i_code_2,
  input  [1:0] i_code_3,
  input  [1:0] i_sel_code, 
  output [1:0] o_code);   
  
  
  MUX_4_1_v mux0 (i_en, {i_code_0[0], i_code_1[0], i_code_2[0], i_code_3[0]}, i_sel_code, o_code[0]);
  MUX_4_1_v mux1 (i_en, {i_code_0[1], i_code_1[1], i_code_2[1], i_code_3[1]}, i_sel_code, o_code[1]);
  
  
endmodule






