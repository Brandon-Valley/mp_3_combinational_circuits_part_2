// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__xor4_gate_gate_v.do

module xor2_gate_gate_v
  (input i_a, i_b,
   output o_f);
     
  wire or1o, and1o, not1_gateo; // internal outputs
   
  or2_gate_v or1   (i_a  , i_b  , or1o );
  AND2_v and1 (i_a  , i_b  , and1o);
  not1_gate_v not1_gate (and1o, not1_gateo       );
  AND2_v and2 (or1o , not1_gateo, o_f  );
  
endmodule







