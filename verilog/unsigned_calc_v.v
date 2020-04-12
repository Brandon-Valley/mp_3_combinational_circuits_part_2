// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__unsigned_calc_v.do

// ////////////////////
 // // Behavior Model
// ////////////////////
// module unsigned_calc_v
  // (
     // input  unsigned [3:0] i_au ,
     // input  unsigned [3:0] i_bu ,
     // input  unsigned [3:0] i_cu ,
     // output   signed [7:0] o_fu 
   // );
  
  // assign o_fu = (7 * i_au) - (3 * i_bu) + (6 * i_cu);
    
// endmodule 






// 7X-3Y+6Z
////////////////////////
 // Component Model
////////////////////////
module unsigned_calc_v
  (
     input  unsigned [3:0] i_au ,
     input  unsigned [3:0] i_bu ,
     input  unsigned [3:0] i_cu ,
     output   signed [7:0] o_fu 
   );
  
  // wire unsigned [4:0] bu_x_2;     // biggest = 30
  
  
  
  // internal 
  wire unsigned [6:0] au_i_m = 7 * i_au;
  wire   signed [6:0] bu_i_m = 3 * i_bu;
  wire unsigned [6:0] cu_i_m = 6 * i_cu;
  
  
  
  
  wire unsigned [7:0] sum_ab;
  
  wire sum_ab_co_0  ;
  wire sum_ab_co_1  ;
  wire sum_ab_co_2  ;
  wire sum_ab_co_3  ;
  wire sum_ab_co_4  ;
  wire sum_ab_co_5  ;
  wire sum_ab_co_6  ;

  wire sum_abc_co_0  ;
  wire sum_abc_co_1  ;
  wire sum_abc_co_2  ;
  wire sum_abc_co_3  ;
  wire sum_abc_co_4  ;
  wire sum_abc_co_5  ;
  

  //=====================================================================================================
  //  7X
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // 6X = 2X + 4X
  wire unsigned [6:0] au_x_6; // biggest = 15 * 6 = 90 = 101 1010
  wire sum_2x_4x_co_0;
  wire sum_2x_4x_co_1;
  wire sum_2x_4x_co_2;
  wire sum_2x_4x_co_3;
  wire sum_2x_4x_co_4;
  wire sum_2x_4x_co_5;
  wire unused_2;
  
  // 7X = X + 6X
  wire unsigned [7:0] au_x_7;
  wire sum_x_6x_co_0;
  wire sum_x_6x_co_1;
  wire sum_x_6x_co_2;
  wire sum_x_6x_co_3;
  wire sum_x_6x_co_4;
  wire sum_x_6x_co_5;
  wire sum_x_6x_co_6;
  wire unused_3;
  
  // 6X = 2X + 4X              2X     +  4X
  full_adder_v fa_6x_0      (1'b0     , 1'b0     , 1'b0          , au_x_6[0], sum_2x_4x_co_0);
  full_adder_v fa_6x_1      (i_au[0]  , 1'b0     , sum_2x_4x_co_0, au_x_6[1], sum_2x_4x_co_1);
  full_adder_v fa_6x_2      (i_au[1]  , i_au[0]  , sum_2x_4x_co_1, au_x_6[2], sum_2x_4x_co_2);
  full_adder_v fa_6x_3      (i_au[2]  , i_au[1]  , sum_2x_4x_co_2, au_x_6[3], sum_2x_4x_co_3);
  full_adder_v fa_6x_4      (i_au[3]  , i_au[2]  , sum_2x_4x_co_3, au_x_6[4], sum_2x_4x_co_4);
  full_adder_v fa_6x_5      (1'b0     , i_au[3]  , sum_2x_4x_co_4, au_x_6[5], sum_2x_4x_co_5);
  full_adder_v fa_6x_6      (1'b0     , 1'b0     , sum_2x_4x_co_5, au_x_6[6], unused_2      );
  
  // 7X = X + 6X              X     +   6X
  full_adder_v fa_7x_0      (i_au[0]  , au_x_6[0], 1'b0          , au_x_7[0], sum_x_6x_co_0 );
  full_adder_v fa_7x_1      (i_au[1]  , au_x_6[1], sum_x_6x_co_0 , au_x_7[1], sum_x_6x_co_1 );
  full_adder_v fa_7x_2      (i_au[2]  , au_x_6[2], sum_x_6x_co_1 , au_x_7[2], sum_x_6x_co_2 );
  full_adder_v fa_7x_3      (i_au[3]  , au_x_6[3], sum_x_6x_co_2 , au_x_7[3], sum_x_6x_co_3 );
  full_adder_v fa_7x_4      (1'b0     , au_x_6[4], sum_x_6x_co_3 , au_x_7[4], sum_x_6x_co_4 );
  full_adder_v fa_7x_5      (1'b0     , au_x_6[5], sum_x_6x_co_4 , au_x_7[5], sum_x_6x_co_5 );
  full_adder_v fa_7x_6      (1'b0     , au_x_6[6], sum_x_6x_co_5 , au_x_7[6], sum_x_6x_co_6 );
  full_adder_v fa_7x_7      (1'b0     , 1'b0     , sum_x_6x_co_6 , au_x_7[7], unused_3      );

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  7X
  //=====================================================================================================
  
  
  
  
  //=====================================================================================================
  //  -3Y
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // Y + 2Y = 3Y 
  wire unsigned [5:0] bu_x_3;     // biggest = 45 = 10 1101
  wire sum_y_2y_co_0;
  wire sum_y_2y_co_1;
  wire sum_y_2y_co_2;
  wire sum_y_2y_co_3;
  wire sum_y_2y_co_4;
  wire unused_0;
  
  // -3Y = 2's complement of 3Y
  wire unsigned [7:0] bu_x_neg_3; // biggest = -45, but make 8 bit anyway
  wire sum_neg_3y_co_0;
  wire sum_neg_3y_co_1;
  wire sum_neg_3y_co_2;
  wire sum_neg_3y_co_3;
  wire sum_neg_3y_co_4;
  wire sum_neg_3y_co_5;
  wire sum_neg_3y_co_6;
  wire unused_1;
  
  // 2Y
  
  // Y + 2Y = 3Y              Y              2Y
  full_adder_v fa_3y_0      (i_bu[0],      1'b0   , 1'b0         ,   bu_x_3[0],     sum_y_2y_co_0 );
  full_adder_v fa_3y_1      (i_bu[1],      i_bu[0], sum_y_2y_co_0,   bu_x_3[1],     sum_y_2y_co_1 );
  full_adder_v fa_3y_2      (i_bu[2],      i_bu[1], sum_y_2y_co_1,   bu_x_3[2],     sum_y_2y_co_2 );
  full_adder_v fa_3y_3      (i_bu[3],      i_bu[2], sum_y_2y_co_2,   bu_x_3[3],     sum_y_2y_co_3 );
  full_adder_v fa_3y_4      (1'b0   ,      i_bu[3], sum_y_2y_co_3,   bu_x_3[4],     sum_y_2y_co_4 );
  full_adder_v fa_3y_5      (1'b0   ,      1'b0   , sum_y_2y_co_4,   bu_x_3[5],     unused_0      );
  
  // -3Y = 2's complement of 3Y
  full_adder_v fa_neg_3y_0  ( ~ bu_x_3[0], 1'b1,    1'b0           , bu_x_neg_3[0], sum_neg_3y_co_0);
  full_adder_v fa_neg_3y_1  ( ~ bu_x_3[1], 1'b0,    sum_neg_3y_co_0, bu_x_neg_3[1], sum_neg_3y_co_1);
  full_adder_v fa_neg_3y_2  ( ~ bu_x_3[2], 1'b0,    sum_neg_3y_co_1, bu_x_neg_3[2], sum_neg_3y_co_2);
  full_adder_v fa_neg_3y_3  ( ~ bu_x_3[3], 1'b0,    sum_neg_3y_co_2, bu_x_neg_3[3], sum_neg_3y_co_3);
  full_adder_v fa_neg_3y_4  ( ~ bu_x_3[4], 1'b0,    sum_neg_3y_co_3, bu_x_neg_3[4], sum_neg_3y_co_4);
  full_adder_v fa_neg_3y_5  ( ~ bu_x_3[5], 1'b0,    sum_neg_3y_co_4, bu_x_neg_3[5], sum_neg_3y_co_5);
  full_adder_v fa_neg_3y_6  (   1'b1     , 1'b0,    sum_neg_3y_co_5, bu_x_neg_3[6], sum_neg_3y_co_6);
  full_adder_v fa_neg_3y_7  (   1'b1     , 1'b0,    sum_neg_3y_co_6, bu_x_neg_3[7], unused_1       );

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  -3Y
  //=====================================================================================================
  
  
  
  
  
  //=====================================================================================================
  //  6Z
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // 6X = 2X + 4X
  wire unsigned [7:0] cu_x_6; 
  wire sum_2z_4z_co_0;
  wire sum_2z_4z_co_1;
  wire sum_2z_4z_co_2;
  wire sum_2z_4z_co_3;
  wire sum_2z_4z_co_4;
  wire sum_2z_4z_co_5;
  wire sum_2z_4z_co_6;
  wire unused_4;
  

  // 6Z = 2Z + 4Z              2Z     +  4Z
  full_adder_v fa_6z_0      (1'b0     , 1'b0     , 1'b0          , cu_x_6[0], sum_2z_4z_co_0);
  full_adder_v fa_6z_1      (i_cu[0]  , 1'b0     , sum_2z_4z_co_0, cu_x_6[1], sum_2z_4z_co_1);
  full_adder_v fa_6z_2      (i_cu[1]  , i_cu[0]  , sum_2z_4z_co_1, cu_x_6[2], sum_2z_4z_co_2);
  full_adder_v fa_6z_3      (i_cu[2]  , i_cu[1]  , sum_2z_4z_co_2, cu_x_6[3], sum_2z_4z_co_3);
  full_adder_v fa_6z_4      (i_cu[3]  , i_cu[2]  , sum_2z_4z_co_3, cu_x_6[4], sum_2z_4z_co_4);
  full_adder_v fa_6z_5      (1'b0     , i_cu[3]  , sum_2z_4z_co_4, cu_x_6[5], sum_2z_4z_co_5);
  full_adder_v fa_6z_6      (1'b0     , 1'b0     , sum_2z_4z_co_5, cu_x_6[6], sum_2z_4z_co_6);
  full_adder_v fa_6z_7      (1'b0     , 1'b0     , sum_2z_4z_co_6, cu_x_6[7], unused_4      );


  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  7Z
  //=====================================================================================================
  

  
  // 7X-3Y                          VV subtract VV
  full_adder_v fa_ab_0  (au_i_m[0], bu_i_m[0] ^ 1, 1           , sum_ab[0], sum_ab_co_0 );
  full_adder_v fa_ab_1  (au_i_m[1], bu_i_m[1] ^ 1, sum_ab_co_0 , sum_ab[1], sum_ab_co_1 );
  full_adder_v fa_ab_2  (au_i_m[2], bu_i_m[2] ^ 1, sum_ab_co_1 , sum_ab[2], sum_ab_co_2 );
  full_adder_v fa_ab_3  (au_i_m[3], bu_i_m[3] ^ 1, sum_ab_co_2 , sum_ab[3], sum_ab_co_3 );
  full_adder_v fa_ab_4  (au_i_m[4], bu_i_m[4] ^ 1, sum_ab_co_3 , sum_ab[4], sum_ab_co_4 );
  full_adder_v fa_ab_5  (au_i_m[5], bu_i_m[5] ^ 1, sum_ab_co_4 , sum_ab[5], sum_ab_co_5 );
  full_adder_v fa_ab_6  (au_i_m[6], bu_i_m[6] ^ 1, sum_ab_co_5 , sum_ab[6], sum_ab_co_6 ); 
  
  assign sum_ab[7] = sum_ab_co_6 ^ 1; // MSB will always be 0 because this is subtraction
  
  // (7X-3Y) + 6Z
  full_adder_v fa_abc_0 (sum_ab[0], cu_i_m[0]    , 0           ,   o_fu[0], sum_abc_co_0);
  full_adder_v fa_abc_1 (sum_ab[1], cu_i_m[1]    , sum_abc_co_0,   o_fu[1], sum_abc_co_1);
  full_adder_v fa_abc_2 (sum_ab[2], cu_i_m[2]    , sum_abc_co_1,   o_fu[2], sum_abc_co_2);
  full_adder_v fa_abc_3 (sum_ab[3], cu_i_m[3]    , sum_abc_co_2,   o_fu[3], sum_abc_co_3);
  full_adder_v fa_abc_4 (sum_ab[4], cu_i_m[4]    , sum_abc_co_3,   o_fu[4], sum_abc_co_4);
  full_adder_v fa_abc_5 (sum_ab[5], cu_i_m[5]    , sum_abc_co_4,   o_fu[5], sum_abc_co_5);
  full_adder_v fa_abc_6 (sum_ab[6], cu_i_m[6]    , sum_abc_co_5,   o_fu[6], o_fu[7]     );

endmodule 









/////////////////////////////////////////////////////////////////////////////////////////////////////

// // 7X-3Y+6Z
// ////////////////////
 // // Component Model
// ////////////////////
// module unsigned_calc_v
  // (
     // input  unsigned [3:0] i_au ,
     // input  unsigned [3:0] i_bu ,
     // input  unsigned [3:0] i_cu ,
     // output unsigned [7:0] o_fu 
   // );
  
  
  // // internal 
  // wire unsigned [6:0] au_i_m = 7 * i_au;
  // wire unsigned [6:0] bu_i_m = 3 * i_bu;
  // wire unsigned [6:0] cu_i_m = 6 * i_cu;
  
  // wire unsigned [7:0] sum_ab;
  
  // wire sum_ab_co_0  ;
  // wire sum_ab_co_1  ;
  // wire sum_ab_co_2  ;
  // wire sum_ab_co_3  ;
  // wire sum_ab_co_4  ;
  // wire sum_ab_co_5  ;
  // wire sum_ab_co_6  ;

  // wire sum_abc_co_0  ;
  // wire sum_abc_co_1  ;
  // wire sum_abc_co_2  ;
  // wire sum_abc_co_3  ;
  // wire sum_abc_co_4  ;
  // wire sum_abc_co_5  ;

  
  // // 7X-3Y                          VV subtract VV
  // full_adder_v fa_ab_0  (au_i_m[0], bu_i_m[0] ^ 1, 1           , sum_ab[0], sum_ab_co_0 );
  // full_adder_v fa_ab_1  (au_i_m[1], bu_i_m[1] ^ 1, sum_ab_co_0 , sum_ab[1], sum_ab_co_1 );
  // full_adder_v fa_ab_2  (au_i_m[2], bu_i_m[2] ^ 1, sum_ab_co_1 , sum_ab[2], sum_ab_co_2 );
  // full_adder_v fa_ab_3  (au_i_m[3], bu_i_m[3] ^ 1, sum_ab_co_2 , sum_ab[3], sum_ab_co_3 );
  // full_adder_v fa_ab_4  (au_i_m[4], bu_i_m[4] ^ 1, sum_ab_co_3 , sum_ab[4], sum_ab_co_4 );
  // full_adder_v fa_ab_5  (au_i_m[5], bu_i_m[5] ^ 1, sum_ab_co_4 , sum_ab[5], sum_ab_co_5 );
  // full_adder_v fa_ab_6  (au_i_m[6], bu_i_m[6] ^ 1, sum_ab_co_5 , sum_ab[6], sum_ab_co_6 ); 
  
  // assign sum_ab[7] = sum_ab_co_6 ^ 1; // MSB will always be 0 because this is subtraction
  
  // // (7X-3Y) + 6Z
  // full_adder_v fa_abc_0 (sum_ab[0], cu_i_m[0]    , 0           ,   o_fu[0], sum_abc_co_0);
  // full_adder_v fa_abc_1 (sum_ab[1], cu_i_m[1]    , sum_abc_co_0,   o_fu[1], sum_abc_co_1);
  // full_adder_v fa_abc_2 (sum_ab[2], cu_i_m[2]    , sum_abc_co_1,   o_fu[2], sum_abc_co_2);
  // full_adder_v fa_abc_3 (sum_ab[3], cu_i_m[3]    , sum_abc_co_2,   o_fu[3], sum_abc_co_3);
  // full_adder_v fa_abc_4 (sum_ab[4], cu_i_m[4]    , sum_abc_co_3,   o_fu[4], sum_abc_co_4);
  // full_adder_v fa_abc_5 (sum_ab[5], cu_i_m[5]    , sum_abc_co_4,   o_fu[5], sum_abc_co_5);
  // full_adder_v fa_abc_6 (sum_ab[6], cu_i_m[6]    , sum_abc_co_5,   o_fu[6], o_fu[7]     );

// endmodule 

