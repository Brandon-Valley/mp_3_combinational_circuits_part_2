// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__full_adder_v.do

// ////////////////////////////////
// //  Equation Model
// ////////////////////////////////
// module full_adder_v
  // (
     // input  i_a     ,
     // input  i_b     ,
     // input  i_carry ,
     // output o_s     ,
     // output o_carry
   // );
 
  // assign o_s     = i_a ^ i_b ^ i_carry;
  // assign o_carry = ((i_a ^ i_b) & i_carry) | (i_a & i_b);
    
// endmodule 

////////////////////////////////
//  Behavior Model
////////////////////////////////
module full_adder_v
  (
     input  i_a     ,
     input  i_b     ,
     input  i_carry ,
     output o_s     ,
     output o_carry
   );
 
  assign o_s     = 0  ?  ! i_a && ! i_b && ! i_carry  :
                   1  ?  ! i_a && ! i_b &&   i_carry  :
                   1  ?  ! i_a &&   i_b && ! i_carry  :
                   0  ?  ! i_a &&   i_b &&   i_carry  :
                   1  ?    i_a && ! i_b && ! i_carry  :
                   0  ?    i_a && ! i_b &&   i_carry  :
                   0  ?    i_a &&   i_b && ! i_carry  :
                   1  ?    i_a &&   i_b &&   i_carry  : 0; // never else
                                                
  assign o_carry = 0  ?  ! i_a && ! i_b && ! i_carry  :
                   0  ?  ! i_a && ! i_b &&   i_carry  :
                   0  ?  ! i_a &&   i_b && ! i_carry  :
                   1  ?  ! i_a &&   i_b &&   i_carry  :
                   0  ?    i_a && ! i_b && ! i_carry  :
                   1  ?    i_a && ! i_b &&   i_carry  :
                   1  ?    i_a &&   i_b && ! i_carry  :
                   1  ?    i_a &&   i_b &&   i_carry  : 0; // never else                       
endmodule 






// ////////////////////////////////////////////////
// //  Behavior Model
// ////////////////////////////////////////////////
// SC_MODULE(full_adder__behavior) 
// {
    // //  Define IO Ports
    // sc_in  <bool> i_a ;
    // sc_in  <bool> i_b ;
    // sc_in  <bool> i_ci;
    // sc_out <bool> o_co;
    // sc_out <bool> o_s ;


    // // Architecture Statement - Similar to Process Statement
    // void p1()
    // {
        // if ( ! i_a && ! i_b && ! i_ci )  {  o_s = 0;  o_co = 0;  }
        // if ( ! i_a && ! i_b &&   i_ci )  {  o_s = 1;  o_co = 0;  }
        // if ( ! i_a &&   i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        // if ( ! i_a &&   i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        // if (   i_a && ! i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        // if (   i_a && ! i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        // if (   i_a &&   i_b && ! i_ci )  {  o_s = 0;  o_co = 1;  }
        // if (   i_a &&   i_b &&   i_ci )  {  o_s = 1;  o_co = 1;  }
    // }


    // // Constructor
    // SC_CTOR(full_adder__behavior) 
    // {
        // SC_METHOD(p1);

        // //  Input Sensitivity List
        // sensitive << i_a 
                  // << i_b 
                  // << i_ci
                  // ;
    // }
// };


// ////////////////////////////////////////////////
// //  Component Model - With Half Adders
// ////////////////////////////////////////////////
// #include "half_adder.h"
// SC_MODULE(full_adder__cmpnt) 
// {
    // //  Define IO Ports
    // sc_in  <bool> i_a ;
    // sc_in  <bool> i_b ;
    // sc_in  <bool> i_ci;
    // sc_out <bool> o_co;
    // sc_out <bool> o_s ;


    // //  Component Instances
    // half_adder ha_1;
    // half_adder ha_2;

    // //  Internal Signals
    // sc_signal <bool> ha_1_s;
    // sc_signal <bool> ha_1_co;
    // sc_signal <bool> ha_2_co;

    // // Constructor
    // SC_CTOR(full_adder__cmpnt) : 
                                // ha_1("G1"),
                                // ha_2("G2")
    // {
        // ha_1(i_a     , i_b    , ha_1_co, ha_1_s);
        // ha_2(ha_1_s  , i_ci   , ha_2_co, o_s );
        // o_co = ha_2_co || ha_1_co;
    // }
// };

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





















