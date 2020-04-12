// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do


////////////////////////
 // Behavior Model
////////////////////////
module multiplier_4_bit_unsigned_v
  (
     input  unsigned [3:0] i_au ,
     input  unsigned [3:0] i_bu ,
     output unsigned [7:0] o_fu 
   );
  
  assign o_fu = i_au * i_bu;
    
endmodule 



// ////////////////////////
// //  Component Model
// ////////////////////////
// module multiplier_4_bit_unsigned_v
  // (
     // input  unsigned [3:0] i_au ,
     // input  unsigned [3:0] i_bu ,
     // output unsigned [7:0] o_fu 
   // );
  
  // // assign o_fu = i_au * i_bu;
  
  
  
  
    
// endmodule 




// binary_4_bit_adder_v









