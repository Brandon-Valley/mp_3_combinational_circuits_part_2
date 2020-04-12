// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__XOR4_gate_v.do

////////////////////////////////
// Equation Model
////////////////////////////////
module XOR4_gate_v
  (input i_a, i_b, i_c, i_d,
   output o_f);
   
  assign o_f = (i_a ^ i_b) ^ (i_c ^ i_d);
  
endmodule


// ////////////////////////////////
// // Behavior Model
// ////////////////////////////////
// module XOR4_gate_v__behavior
  // (input i_a, i_b, i_c, i_d,
   // output o_f);
   
  // assign o_f = (~ i_a & ~ i_b & ~ i_c &   i_d) | 
               // (~ i_a & ~ i_b &   i_c & ~ i_d) |
               // (~ i_a &   i_b & ~ i_c & ~ i_d) |
               // (  i_a & ~ i_b & ~ i_c & ~ i_d) |
               // (  i_a &   i_b &   i_c & ~ i_d) |
               // (  i_a &   i_b & ~ i_c &   i_d) |
               // (  i_a & ~ i_b &   i_c &   i_d) |
               // (~ i_a &   i_b &   i_c &   i_d) ? 1 : 0;
  
// endmodule



// ////////////////////////////////
// // Component Model - Self - made of primatives
// ////////////////////////////////
// module XOR4_gate_v__cmpnt_self
  // (input i_a, i_b, i_c, i_d,
  // output o_f);
   
  // wire fi1, fi2; // internal outputs
   
  // XOR2_gate_v xor1 (i_a, i_b, fi1);
  // XOR2_gate_v XOR2_gate (i_c, i_d, fi2);
  // XOR2_gate_v xor3 (fi1, fi2, o_f);

    
// endmodule







