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
  
  
  // make -3Y
  // 2Y
  // assign bu_x_2 = {i_bu, 1'b0};`````````````````````````````````````````````````````````
  
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
  
  
  // wire signed [

  
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

