// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULS_v.do


////////////////////
 // Behavior Model
////////////////////
module FMULS_v
  (
     input  unsigned [7:0] i_rd ,
     input  unsigned [7:0] i_rr ,
     output unsigned [7:0] o_r1, 
     output unsigned [7:0] o_r0 
   );
  
  wire unsigned [15:0] r_i = i_rd * i_rr;

  assign o_r1 = r_i[14:7];
  assign o_r0 = {r_i[6:0], 1'b0};
  
    
endmodule 


