// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__multiplier_4_bit_unsigned_v.do


// ////////////////////
 // // Behavior Model
// ////////////////////
// module multiplier_4_bit_unsigned_v
  // (
     // input  unsigned [3:0] i_au ,
     // input  unsigned [3:0] i_bu ,
     // output unsigned [3:0] o_fu0, 
     // output unsigned [3:0] o_fu1 
   // );
  
  // wire [7:0] f_i;
  
  // assign f_i = i_au * i_bu;
  // assign o_fu0 = f_i[3:0];
  // assign o_fu1 = f_i[7:4];
  
    
// endmodule 



////////////////////////
//  Component Model
////////////////////////
module multiplier_4_bit_unsigned_v
  (
     input  unsigned [3:0] i_au ,
     input  unsigned [3:0] i_bu ,
     output unsigned [3:0] o_fu0, 
     output unsigned [3:0] o_fu1 
   );
  
    // ba0 ////////////////////////////////////////////
    wire [3:0] ba0_i0;
    wire [3:0] ba0_i1;
    wire [4:0] ba0_f;
    
    assign o_fu0[0]  = i_au[0] & i_bu[0];               // o_fu0[0]
    assign ba0_i0[0] = i_au[0] & i_bu[1];
    assign ba0_i0[1] = i_au[0] & i_bu[2];
    assign ba0_i0[2] = i_au[0] & i_bu[3];
    assign ba0_i0[3] = 1'b0;
    assign ba0_i1[0] = i_au[1] & i_bu[0];
    assign ba0_i1[1] = i_au[1] & i_bu[1];
    assign ba0_i1[2] = i_au[1] & i_bu[2];
    assign ba0_i1[3] = i_au[1] & i_bu[3];
    
    binary_4_bit_adder_v ba0 (ba0_i1, ba0_i0, ba0_f);
    
    assign o_fu0[1] = ba0_f[0];                        // o_fu0[1]
    
    // ba1 ////////////////////////////////////////////
    wire [3:0] ba1_i0;
    wire [3:0] ba1_i1;
    wire [4:0] ba1_f;
    
    assign ba1_i0[0] = ba0_f[1];
    assign ba1_i0[1] = ba0_f[2];
    assign ba1_i0[2] = ba0_f[3];
    assign ba1_i0[3] = ba0_f[4];
    assign ba1_i1[0] = i_au[2] & i_bu[0];
    assign ba1_i1[1] = i_au[2] & i_bu[1];
    assign ba1_i1[2] = i_au[2] & i_bu[2];
    assign ba1_i1[3] = i_au[2] & i_bu[3];
    
    binary_4_bit_adder_v ba1 (ba1_i1, ba1_i0, ba1_f);
    
    assign o_fu0[2] = ba1_f[0];                        // o_fu0[2]
    
    // ba2 ////////////////////////////////////////////
    wire [3:0] ba2_i0;
    wire [3:0] ba2_i1;
    wire [4:0] ba2_f;
    
    assign ba2_i0[0] = ba1_f[1];
    assign ba2_i0[1] = ba1_f[2];
    assign ba2_i0[2] = ba1_f[3];
    assign ba2_i0[3] = ba1_f[4];
    assign ba2_i1[0] = i_au[3] & i_bu[0];
    assign ba2_i1[1] = i_au[3] & i_bu[1];
    assign ba2_i1[2] = i_au[3] & i_bu[2];
    assign ba2_i1[3] = i_au[3] & i_bu[3];
    
    binary_4_bit_adder_v ba2 (ba2_i1, ba2_i0, ba2_f);
    
    assign o_fu0[3] = ba2_f[0];                        // o_fu0[3]
    assign o_fu1[0] = ba2_f[1];                        // o_fu1[0]
    assign o_fu1[1] = ba2_f[2];                        // o_fu1[1]
    assign o_fu1[2] = ba2_f[3];                        // o_fu1[2]
    assign o_fu1[3] = ba2_f[4];                        // o_fu1[3]
    
endmodule 











