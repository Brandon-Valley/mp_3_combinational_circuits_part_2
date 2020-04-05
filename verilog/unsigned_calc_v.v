// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__unsigned_calc_v.do

////////////////////////////
//  Behavior Model
////////////////////////////
module unsigned_calc_v
  (
     input  unsigned [3:0] i_au ,
     input  unsigned [3:0] i_bu ,
     input  unsigned [3:0] i_cu ,
     output unsigned [7:0] o_fu 
   );
 
  // assign o_s     = i_a ^ i_b ^ i_carry;
  // assign o_carry = ((i_a ^ i_b) & i_carry) | (i_a & i_b);
  
  // assign o_fu = 00010010;
  
  assign o_fu = (7 * i_au) - (3 * i_bu) + (6 * i_cu);
    
endmodule 




// ////////////////////////////////
// //  Behavior Model
// ////////////////////////////////
// module unsigned_calc_v
  // (
     // input  i_a     ,
     // input  i_b     ,
     // input  i_carry ,
     // output o_s     ,
     // output o_carry
   // );
 
  // assign o_s     = 0  ?  ! i_a && ! i_b && ! i_carry  :
                   // 1  ?  ! i_a && ! i_b &&   i_carry  :
                   // 1  ?  ! i_a &&   i_b && ! i_carry  :
                   // 0  ?  ! i_a &&   i_b &&   i_carry  :
                   // 1  ?    i_a && ! i_b && ! i_carry  :
                   // 0  ?    i_a && ! i_b &&   i_carry  :
                   // 0  ?    i_a &&   i_b && ! i_carry  :
                   // 1  ?    i_a &&   i_b &&   i_carry  : 0; // never else
                                                
  // assign o_carry = 0  ?  ! i_a && ! i_b && ! i_carry  :
                   // 0  ?  ! i_a && ! i_b &&   i_carry  :
                   // 0  ?  ! i_a &&   i_b && ! i_carry  :
                   // 1  ?  ! i_a &&   i_b &&   i_carry  :
                   // 0  ?    i_a && ! i_b && ! i_carry  :
                   // 1  ?    i_a && ! i_b &&   i_carry  :
                   // 1  ?    i_a &&   i_b && ! i_carry  :
                   // 1  ?    i_a &&   i_b &&   i_carry  : 0; // never else                       
// endmodule 



// //////////////////////////////////////////
// //  Component Model - With Half Adders
// //////////////////////////////////////////
// module unsigned_calc_v
  // (
     // input  i_a     ,
     // input  i_b     ,
     // input  i_carry ,
     // output o_s     ,
     // output o_carry
   // );
  // wire ha_1_co, ha_1_s, ha_2_co;
  // half_adder_v ha1 (i_a     , i_b    , ha_1_co, ha_1_s);
  // half_adder_v ha2 (ha_1_s  , i_carry, ha_2_co, o_s );
  // assign o_carry = ((i_a ^ i_b) & i_carry) | (i_a & i_b);
// endmodule 



