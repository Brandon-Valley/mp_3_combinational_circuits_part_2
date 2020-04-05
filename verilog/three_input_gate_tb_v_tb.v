// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate_v.do

`timescale 1ms/1ms

module three_input_gate_tb_v;
  
  // reg  [3:0] i_code;
  // wire [1:0] o_code;
  // wire       o_valid;  
  
  reg        a     ;
  reg        b     ;
  reg        c     ;
  reg  [1:0] i_code;
  wire       o_f   ;
  
  // reg i_a, i_b, i_c, i_d;
  reg [4:0] d_in = 5'b00000;
  integer i;
  
  // duv port map options:
  // three_input_gate_v__no_always duv (.i_code(i_code), .o_code(o_code), .o_valid(o_valid));  // BEHAVIOR MODEL!!!!!!!!!!!!!!!!!!
  // three_input_gate_v__always duv (.i_code(i_code), .o_code(o_code), .o_valid(o_valid)); 
  // three_input_gate_v__equation duv (.i_code(i_code), .o_code(o_code), .o_valid(o_valid)); 
  // three_input_gate_v__equation duv (
  three_input_gate_v__cmpnt       duv (
  // three_input_gate_v__behavior duv (
                                      .a     (a     ),
                                      .b     (b     ),
                                      .c     (c     ),
                                      .i_code(i_code),
                                      .o_f   (o_f   )
                                    );
                                    
                                    
                                    
                                    
                                    
                                    
                                    // .i_code(i_code), .o_code(o_code), .o_valid(o_valid)); 
  
  //procedure statement
  initial begin

      
      
      for (i = 0 ; i < 34 ; i = i + 1) begin
        #1000 a      = d_in[0];
              b      = d_in[1];
              c      = d_in[2];
              i_code = d_in[4:3];
      
      
      
        // #1000 i_code = d_in;
        // #1000 o_code[0] = d_in[0]; o_code[1] = d_in[1]; o_code[2] = d_in[]; i_d = d_in[4];
        d_in = d_in + 1;
      end
          
    end

endmodule
