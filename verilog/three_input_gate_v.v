// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate_v.do

////////////////////////////////
//  Behavior Model
////////////////////////////////

module three_input_gate_v__behavior

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
  
  
  
  
  
  
  
  
  // assign o_f = 1;
  
   
  // // behavior model
  // // line 0 hase highest priority
  // assign o_code = i_code[0] ? 2'b00:
                  // i_code[1] ? 2'b01:
                  // i_code[2] ? 2'b10:
                  // i_code[3] ? 2'b11:
                  // 2'b00;
           
  // assign o_valid = i_code[0] ? 1'b1:
                   // i_code[1] ? 1'b1:
                   // i_code[2] ? 1'b1:
                   // i_code[3] ? 1'b1:
                   // 1'b0;
                   
                   
           
                 
endmodule

