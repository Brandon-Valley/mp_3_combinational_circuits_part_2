// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULSU_v.do


////////////////////
 // Behavior Model
////////////////////
module FMULSU_v
  (
     input  signed [7:0] i_rd ,
     input  unsigned [7:0] i_rr ,
     output signed [7:0] o_r1, 
     output signed [7:0] o_r0 
   );
  
  wire unsigned [7:0] rd_2s_comp = (~i_rd) + 1'b1;// & 8'b11111111;// + 1'b1;
  
  
  // wire signed [15:0] r_i = i_rd * i_rr;
  wire signed [15:0] r_i = ! i_rd[7] ? i_rd * i_rr :        // if i_rd positive, just multiply like normal
                                    0 - (rd_2s_comp * i_rr);  // else multiply by i_rd's 2's comp

  assign o_r1 = r_i[14:7];
  assign o_r0 = {r_i[6:0], 1'b0};


  // assign o_r1 = ! i_rd[7] ? r_i[14:7]:
  // assign o_r0 = {r_i[6:0], 1'b0};
  
  
  // wire signed[15:0] rr_signed = (! i_rr) + 1'b1;
  
  // wire signed [15:0] r_i = i_rd * rr_signed;

  // assign o_r1 = r_i[14:7];
  // assign o_r0 = {r_i[6:0], 1'b0};  
  
    
endmodule 


