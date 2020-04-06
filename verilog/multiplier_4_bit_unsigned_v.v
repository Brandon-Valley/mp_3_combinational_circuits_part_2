// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do


// 6X-11Y
////////////////////////
 // Behavior Model
////////////////////////
module multiplier_4_bit_unsigned_v
  (
     input  signed [4:0] i_as ,
     input  signed [4:0] i_bs ,
     output signed [8:0] o_fs   //  (15 * 6) = 90   (15 * 11) = 165 = 1 0101 1011   -90 - 165 = -225 = 1 1111 1111
   );
  
  assign o_fs = (6 * i_as) - (11 * i_bs);
    
endmodule 


















