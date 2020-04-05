
module half_adder_v
  (
     i_a,
     i_b,
     o_s,
     o_carry
   );
 
  input  i_a;
  input  i_b;
  output o_s;
  output o_carry;
 
  assign o_s     = i_a ^ i_b; 
  assign o_carry = i_a & i_b; 
 
endmodule 