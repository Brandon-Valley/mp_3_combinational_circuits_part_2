// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate_v.do

////////////////////////////////
//  Behavior Model
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


// ////////////////////////////////
// //  Component Model - Uses MUX
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






















