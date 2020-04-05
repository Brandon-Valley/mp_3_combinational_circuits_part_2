// module full_adder 
  // (
   // i_bit1,
   // i_bit2,
   // i_carry,
   // o_sum,
   // o_carry
   // );
 
  // input  i_bit1;
  // input  i_bit2;
  // input  i_carry;
  // output o_sum;
  // output o_carry;
 
  // wire   w_WIRE_1;
  // wire   w_WIRE_2;
  // wire   w_WIRE_3;
       
  // assign w_WIRE_1 = i_bit1 ^ i_bit2;
  // assign w_WIRE_2 = w_WIRE_1 & i_carry;
  // assign w_WIRE_3 = i_bit1 & i_bit2;
 
  // assign o_sum   = w_WIRE_1 ^ i_carry;
  // assign o_carry = w_WIRE_2 | w_WIRE_3;
 
 
  // // FYI: Code above using wires will produce the same results as:
  // // assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  // // assign o_carry = (i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
 
  // // Wires are just used to be explicit. 
   
// endmodule // full_adder




// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__full_adder_v.do

////////////////////////////////
//  Behavior Model
////////////////////////////////

module full_adder_v

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


// ////////////////////////////////
// //  Component Model - Uses MUX
// ////////////////////////////////

// module full_adder_v

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





















