// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate_v.do

// ////////////////////////////////
// //  Behavior Model
// ////////////////////////////////

// module three_input_gate_v

  // (
    // input        a     ,
    // input        b     ,
    // input        c     ,
    // input  [1:0] i_code,
    // output       o_f
  // );
  
  // assign o_f = i_code == 00 ?    a ^ b ^ c    : 
               // i_code == 01 ? ~ (a & b & c)   : 
               // i_code == 10 ? ~ ( a |  b | c) : 
                              // (~a & ~b & ~c) | (~a & b & c) | (a & ~b & c) | (a & b & ~c);
// endmodule


////////////////////////////////
//  Component Model - Uses MUX
////////////////////////////////

module three_input_gate_v

  (
    input        a     ,
    input        b     ,
    input        c     ,
    input  [1:0] i_code,
    output       o_f
  );
  
  assign o_f = i_code == 00 ?    a ^ b ^ c    : 
               i_code == 01 ? ~ (a & b & c)   : 
               i_code == 10 ? ~ ( a |  b | c) : 
                              (~a & ~b & ~c) | (~a & b & c) | (a & ~b & c) | (a & b & ~c);
endmodule



// // ////////////////////////////////
// // // Component Model - Self
// // ////////////////////////////////
// // module NAND4_gate_v
// // // module nand4_gate_v__cmpnt_self
  // // (input i_a, i_b, i_c, i_d,
  // // output o_f);
   
  // // wire fi1, fi2, fi3, fi4; // internal outputs
   
  // // NAND2_gate_v nand1_gate (i_a, i_b, fi1);
  // // NAND2_gate_v nand2_gate (fi1, fi1, fi2); // NOT
  // // NAND2_gate_v nand3_gate (i_c, i_d, fi3);
  // // NAND2_gate_v nand4_gate (fi3, fi3, fi4); // NOT
  // // NAND2_gate_v nand5_gate (fi2, fi4, o_f);
    
// // endmodule





















