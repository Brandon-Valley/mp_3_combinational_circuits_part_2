// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULSU_v.do


////////////////////
 // Behavior Model
////////////////////
module FMULSU_v
  (
     input  signed [7:0] i_rd ,
     input  signed [7:0] i_rr ,
     output signed [7:0] o_r1, 
     output signed [7:0] o_r0 
   );
  
  wire signed [15:0] r_i = i_rd * i_rr;

  assign o_r1 = r_i[14:7];
  assign o_r0 = {r_i[6:0], 1'b0};
  
    
endmodule 


