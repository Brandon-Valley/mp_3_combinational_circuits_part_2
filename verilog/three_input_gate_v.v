// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate_v.do
//
////////////////////////////////
// Not Using Always - Behavior
////////////////////////////////

module three_input_gate_v__no_always
  (input  [3:0] i_code,
   output [1:0] o_code,
   output       o_valid);
   
  // behavior model
  // line 0 hase highest priority
  assign o_code = i_code[0] ? 2'b00:
                  i_code[1] ? 2'b01:
                  i_code[2] ? 2'b10:
                  i_code[3] ? 2'b11:
                  2'b00;
           
  assign o_valid = i_code[0] ? 1'b1:
                   i_code[1] ? 1'b1:
                   i_code[2] ? 1'b1:
                   i_code[3] ? 1'b1:
                   1'b0;
           
                 
endmodule


////////////////////////////////
// Using Always
////////////////////////////////
module three_input_gate_v__always (
  input  [3:0] i_code,
  output reg [1:0] o_code,
  output reg     o_valid);

  always @*
    case (i_code)
      4'b0000 : begin o_code = 2'b00; o_valid = 0; end
      4'b0001 : begin o_code = 2'b00; o_valid = 1; end
      4'b0010 : begin o_code = 2'b01; o_valid = 1; end
      4'b0011 : begin o_code = 2'b00; o_valid = 1; end
      4'b0100 : begin o_code = 2'b10; o_valid = 1; end
      4'b0101 : begin o_code = 2'b00; o_valid = 1; end
      4'b0110 : begin o_code = 2'b01; o_valid = 1; end
      4'b0111 : begin o_code = 2'b00; o_valid = 1; end
      4'b1000 : begin o_code = 2'b11; o_valid = 1; end
      4'b1001 : begin o_code = 2'b00; o_valid = 1; end
      4'b1010 : begin o_code = 2'b01; o_valid = 1; end
      4'b1011 : begin o_code = 2'b00; o_valid = 1; end
      4'b1100 : begin o_code = 2'b10; o_valid = 1; end
      4'b1101 : begin o_code = 2'b00; o_valid = 1; end
      4'b1110 : begin o_code = 2'b01; o_valid = 1; end
      4'b1111 : begin o_code = 2'b00; o_valid = 1; end
    endcase
                 
endmodule


////////////////////////////////
//  Equation Model
////////////////////////////////
module three_input_gate_v__equation
  (input  [3:0] i_code,
   output [1:0] o_code,
   output       o_valid);
  
  
  assign o_code[0] = (i_code[1] & ~i_code[0]) | (i_code[3] & ~i_code[2] & ~i_code[0]);
  assign o_code[1] = (i_code[2] & ~i_code[1] & ~i_code[0]) | (i_code[3] & ~i_code[1] & ~i_code[0]);
 
  // equation model
  assign o_valid  = i_code[0] |
                    i_code[1] |
                    i_code[2] |
                    i_code[3];
                 
endmodule

