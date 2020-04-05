// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__nand4_gate_v.do

////////////////////////////////
// Equation Model
////////////////////////////////
// module nand4_gate_v__equation
module NAND4_gate_v
  (input i_a, i_b, i_c, i_d,
   output o_f);
   
  assign o_f = ~(i_a & i_b & i_c & i_d);
  
endmodule


// ////////////////////////////////
// // Behavior Model
// ////////////////////////////////
// module NAND4_gate_v
// // module nand4_gate_v__behavior
  // (input i_a, i_b, i_c, i_d,
   // output o_f);
   
  // assign o_f = i_a & i_b & i_c & i_d ? 0 : 1;
  // // assign o_f = 0 ? i_a & i_b & i_c & i_d : 1;
  // // assign o_f = 0 ? i_a  : 1;
  
// endmodule



// ////////////////////////////////
// // Component Model - Self
// ////////////////////////////////
// module NAND4_gate_v
// // module nand4_gate_v__cmpnt_self
  // (input i_a, i_b, i_c, i_d,
  // output o_f);
   
  // wire fi1, fi2, fi3, fi4; // internal outputs
   
  // NAND2_gate_v nand1_gate (i_a, i_b, fi1);
  // NAND2_gate_v nand2_gate (fi1, fi1, fi2); // NOT
  // NAND2_gate_v nand3_gate (i_c, i_d, fi3);
  // NAND2_gate_v nand4_gate (fi3, fi3, fi4); // NOT
  // NAND2_gate_v nand5_gate (fi2, fi4, o_f);
    
// endmodule


// ////////////////////////////
// // Component Model - Primative
// ////////////////////////////
// module NAND4_gate_v
// // module nand4_gate_v__cmpnt_prim
  // (input i_a, i_b, i_c, i_d,
  // output o_f);
   
  // wire fi1, fi2, fi3; // internal outputs
   
  // AND2_gate_v and1_gate (i_a, i_b, fi1);
  // AND2_gate_v and2_gate (i_c, i_d, fi2);
  // AND2_gate_v and3_gate (fi1, fi2, fi3);
  // not1_gate_v not1_gate (fi3, o_f);

    
// endmodule





