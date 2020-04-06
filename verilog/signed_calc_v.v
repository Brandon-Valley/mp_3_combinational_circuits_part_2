// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do


// 6X-11Y
////////////////////////
 // Behavior Model
////////////////////////
module signed_calc_v
  (
     input  signed [4:0] i_as ,
     input  signed [4:0] i_bs ,
     output signed [8:0] o_fs   //  (15 * 6) = 90   (15 * 11) = 165 = 1 0101 1011   -90 - 165 = -225 = 11 0000 0001
   );
  
  assign o_fs = (6 * i_as) - (11 * i_bs);
    
endmodule 

// // 7X-3Y+6Z
// ////////////////////
 // // Component Model
// ////////////////////
// module signed_calc_v
  // (
     // input  unsigned [3:0] i_as ,
     // input  unsigned [3:0] i_bs ,
     // input  unsigned [3:0] i_cs ,
     // output unsigned [7:0] o_fs 
   // );
  
  
  // // internal 
  // wire unsigned [6:0] au_i_m = 7 * i_as;
  // wire unsigned [6:0] bu_i_m = 3 * i_bs;
  // wire unsigned [6:0] cu_i_m = 6 * i_cs;
  
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
  // full_adder_v fa_abc_0 (sum_ab[0], cu_i_m[0]    , 0           ,   o_fs[0], sum_abc_co_0);
  // full_adder_v fa_abc_1 (sum_ab[1], cu_i_m[1]    , sum_abc_co_0,   o_fs[1], sum_abc_co_1);
  // full_adder_v fa_abc_2 (sum_ab[2], cu_i_m[2]    , sum_abc_co_1,   o_fs[2], sum_abc_co_2);
  // full_adder_v fa_abc_3 (sum_ab[3], cu_i_m[3]    , sum_abc_co_2,   o_fs[3], sum_abc_co_3);
  // full_adder_v fa_abc_4 (sum_ab[4], cu_i_m[4]    , sum_abc_co_3,   o_fs[4], sum_abc_co_4);
  // full_adder_v fa_abc_5 (sum_ab[5], cu_i_m[5]    , sum_abc_co_4,   o_fs[5], sum_abc_co_5);
  // full_adder_v fa_abc_6 (sum_ab[6], cu_i_m[6]    , sum_abc_co_5,   o_fs[6], o_fs[7]     );

// endmodule 

