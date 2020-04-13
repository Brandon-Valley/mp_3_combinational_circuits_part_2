// -- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc_v.do


// // 6X-11Y
// ////////////////////////
 // // Behavior Model
// ////////////////////////
// module signed_calc_v
  // (
     // input  signed [4:0] i_as ,
     // input  signed [4:0] i_bs ,
     // output signed [8:0] o_fs   //  (15 * 6) = 90   (15 * 11) = 165 = 1 0101 1011   -90 - 165 = -225 = 1 1111 1111
   // );
  
  // assign o_fs = (6 * i_as) - (11 * i_bs);
    
// endmodule 



// 6X-11Y
////////////////////
 // Component Model
////////////////////
module signed_calc_v
  (
     input  signed [4:0] i_as ,
     input  signed [4:0] i_bs ,
     output signed [8:0] o_fs 
   );
  
  
  
  //=====================================================================================================
  //  6X
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // 6X = 2X + 4X
  wire signed [8:0] as6 ; 
  wire sum_6x_co_0;
  wire sum_6x_co_1;
  wire sum_6x_co_2;
  wire sum_6x_co_3;
  wire sum_6x_co_4;
  wire sum_6x_co_5;
  wire sum_6x_co_6;
  wire sum_6x_co_7;
  wire unused_0;
  

  // 6X = 2X + 4X       2X     +  4X
  full_adder_v fa_6x_0 (1'b0     , 1'b0     , 1'b0       , as6[0], sum_6x_co_0);
  full_adder_v fa_6x_1 (i_as[0]  , 1'b0     , sum_6x_co_0, as6[1], sum_6x_co_1);
  full_adder_v fa_6x_2 (i_as[1]  , i_as[0]  , sum_6x_co_1, as6[2], sum_6x_co_2);
  full_adder_v fa_6x_3 (i_as[2]  , i_as[1]  , sum_6x_co_2, as6[3], sum_6x_co_3);
  full_adder_v fa_6x_4 (i_as[3]  , i_as[2]  , sum_6x_co_3, as6[4], sum_6x_co_4);
  full_adder_v fa_6x_5 (i_as[4]  , i_as[3]  , sum_6x_co_4, as6[5], sum_6x_co_5);
  full_adder_v fa_6x_6 (i_as[4]  , i_as[4]  , sum_6x_co_5, as6[6], sum_6x_co_6);
  full_adder_v fa_6x_7 (i_as[4]  , i_as[4]  , sum_6x_co_6, as6[7], sum_6x_co_7);
  full_adder_v fa_6x_8 (i_as[4]  , i_as[4]  , sum_6x_co_7, as6[8], unused_0   );


  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  6X
  //=====================================================================================================
  
  
  
  
  //=====================================================================================================
  //  -11Y
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // 2Y + 8Y = 10Y 
  wire signed [8:0] bs10;    
  wire sum_10y_co_0;
  wire sum_10y_co_1;
  wire sum_10y_co_2;
  wire sum_10y_co_3;
  wire sum_10y_co_4;
  wire sum_10y_co_5;
  wire sum_10y_co_6;
  wire sum_10y_co_7;
  wire unused_1;
  
  // Y + 10Y = 11Y
  wire signed [8:0] bs11;    
  wire sum_11y_co_0;
  wire sum_11y_co_1;
  wire sum_11y_co_2;
  wire sum_11y_co_3;
  wire sum_11y_co_4;
  wire sum_11y_co_5;
  wire sum_11y_co_6;
  wire sum_11y_co_7;
  wire unused_2;
  
  // -11Y = 2's complement of 11Y
  wire signed [8:0] bs_neg_11; // biggest = -45, but make 8 bit anyway
  wire sum_neg_11y_co_0;
  wire sum_neg_11y_co_1;
  wire sum_neg_11y_co_2;
  wire sum_neg_11y_co_3;
  wire sum_neg_11y_co_4;
  wire sum_neg_11y_co_5;
  wire sum_neg_11y_co_6;
  wire sum_neg_11y_co_7;
  wire unused_3;
  
  
  // 2Y + 8Y = 10Y             2Y        8Y
  full_adder_v fa_10y_0      (1'b0      , 1'b0   , 1'b0            , bs10[0]      , sum_10y_co_0 );
  full_adder_v fa_10y_1      (i_bs[0]   , 1'b0   , sum_10y_co_0    , bs10[1]      , sum_10y_co_1 );
  full_adder_v fa_10y_2      (i_bs[1]   , 1'b0   , sum_10y_co_1    , bs10[2]      , sum_10y_co_2 );
  full_adder_v fa_10y_3      (i_bs[2]   , i_bs[0], sum_10y_co_2    , bs10[3]      , sum_10y_co_3 );
  full_adder_v fa_10y_4      (i_bs[3]   , i_bs[1], sum_10y_co_3    , bs10[4]      , sum_10y_co_4 );
  full_adder_v fa_10y_5      (i_bs[4]   , i_bs[2], sum_10y_co_4    , bs10[5]      , sum_10y_co_5 );
  full_adder_v fa_10y_6      (i_bs[4]   , i_bs[3], sum_10y_co_5    , bs10[6]      , sum_10y_co_6 );
  full_adder_v fa_10y_7      (i_bs[4]   , i_bs[4], sum_10y_co_6    , bs10[7]      , sum_10y_co_7 );
  full_adder_v fa_10y_8      (i_bs[4]   , i_bs[4], sum_10y_co_7    , bs10[8]      , unused_1     );
                                                                                  
                                                                                  
  // Y + 10Y = 11Y              Y         10Y                                     
  full_adder_v fa_11y_0      (i_bs[0]   , bs10[0], 1'b0            , bs11[0]      , sum_11y_co_0 );
  full_adder_v fa_11y_1      (i_bs[1]   , bs10[1], sum_11y_co_0    , bs11[1]      , sum_11y_co_1 );
  full_adder_v fa_11y_2      (i_bs[2]   , bs10[2], sum_11y_co_1    , bs11[2]      , sum_11y_co_2 );
  full_adder_v fa_11y_3      (i_bs[3]   , bs10[3], sum_11y_co_2    , bs11[3]      , sum_11y_co_3 );
  full_adder_v fa_11y_4      (i_bs[4]   , bs10[4], sum_11y_co_3    , bs11[4]      , sum_11y_co_4 );
  full_adder_v fa_11y_5      (i_bs[4]   , bs10[5], sum_11y_co_4    , bs11[5]      , sum_11y_co_5 );
  full_adder_v fa_11y_6      (i_bs[4]   , bs10[6], sum_11y_co_5    , bs11[6]      , sum_11y_co_6 );
  full_adder_v fa_11y_7      (i_bs[4]   , bs10[7], sum_11y_co_6    , bs11[7]      , sum_11y_co_7 );
  full_adder_v fa_11y_8      (i_bs[4]   , bs10[8], sum_11y_co_7    , bs11[8]      , unused_2     );
  
  // -11Y = 2's complement of 11Y
  full_adder_v fa_neg_11y_0  ( ~ bs11[0], 1'b1   , 1'b0            , bs_neg_11[0] , sum_neg_11y_co_0);
  full_adder_v fa_neg_11y_1  ( ~ bs11[1], 1'b0   , sum_neg_11y_co_0, bs_neg_11[1] , sum_neg_11y_co_1);
  full_adder_v fa_neg_11y_2  ( ~ bs11[2], 1'b0   , sum_neg_11y_co_1, bs_neg_11[2] , sum_neg_11y_co_2);
  full_adder_v fa_neg_11y_3  ( ~ bs11[3], 1'b0   , sum_neg_11y_co_2, bs_neg_11[3] , sum_neg_11y_co_3);
  full_adder_v fa_neg_11y_4  ( ~ bs11[4], 1'b0   , sum_neg_11y_co_3, bs_neg_11[4] , sum_neg_11y_co_4);
  full_adder_v fa_neg_11y_5  ( ~ bs11[5], 1'b0   , sum_neg_11y_co_4, bs_neg_11[5] , sum_neg_11y_co_5);
  full_adder_v fa_neg_11y_6  ( ~ bs11[6], 1'b0   , sum_neg_11y_co_5, bs_neg_11[6] , sum_neg_11y_co_6);
  full_adder_v fa_neg_11y_7  ( ~ bs11[7], 1'b0   , sum_neg_11y_co_6, bs_neg_11[7] , sum_neg_11y_co_7);
  full_adder_v fa_neg_11y_8  ( ~ bs11[8], 1'b0   , sum_neg_11y_co_7, bs_neg_11[8] , unused_3        );

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  -11Y
  //=====================================================================================================





  
  //=====================================================================================================
  //  6X - 11Y
  //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  // o_fs = 6X - llY
  wire sum_fs_co_0;
  wire sum_fs_co_1;
  wire sum_fs_co_2;
  wire sum_fs_co_3;
  wire sum_fs_co_4;
  wire sum_fs_co_5;
  wire sum_fs_co_6;
  wire sum_fs_co_7;
  wire unused_4;
  

  // o_fs = 6X - llY      6X     +  -11Y
  full_adder_v fa_fs_0 (as6[0], bs_neg_11[0], 1'b0       , o_fs[0], sum_fs_co_0);
  full_adder_v fa_fs_1 (as6[1], bs_neg_11[1], sum_fs_co_0, o_fs[1], sum_fs_co_1);
  full_adder_v fa_fs_2 (as6[2], bs_neg_11[2], sum_fs_co_1, o_fs[2], sum_fs_co_2);
  full_adder_v fa_fs_3 (as6[3], bs_neg_11[3], sum_fs_co_2, o_fs[3], sum_fs_co_3);
  full_adder_v fa_fs_4 (as6[4], bs_neg_11[4], sum_fs_co_3, o_fs[4], sum_fs_co_4);
  full_adder_v fa_fs_5 (as6[5], bs_neg_11[5], sum_fs_co_4, o_fs[5], sum_fs_co_5);
  full_adder_v fa_fs_6 (as6[6], bs_neg_11[6], sum_fs_co_5, o_fs[6], sum_fs_co_6);
  full_adder_v fa_fs_7 (as6[7], bs_neg_11[7], sum_fs_co_6, o_fs[7], sum_fs_co_7);
  full_adder_v fa_fs_8 (as6[8], bs_neg_11[8], sum_fs_co_7, o_fs[8], unused_4   );


  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //  o_fs = 6X - llY
  //=====================================================================================================
endmodule 





// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
// // 6X-11Y
// ////////////////////
 // // Component Model
// ////////////////////
// module signed_calc_v
  // (
     // input  signed [4:0] i_as ,
     // input  signed [4:0] i_bs ,
     // output signed [8:0] o_fs 
   // );
  
  
  // // internal 
  // wire signed [8:0] au_i_m = (-1 * i_as[4]) * 6 * i_as;
  // wire signed [8:0] bu_i_m = (-1 * i_bs[4]) * 11 * i_bs;
  
  // // wire unsigned [7:0] sum_ab;
  
  // wire sum_ab_co_0  ;
  // wire sum_ab_co_1  ;
  // wire sum_ab_co_2  ;
  // wire sum_ab_co_3  ;
  // wire sum_ab_co_4  ;
  // wire sum_ab_co_5  ;
  // wire sum_ab_co_6  ;
  // wire sum_ab_co_7  ;

  // // wire sum_abc_co_0  ;
  // // wire sum_abc_co_1  ;
  // // wire sum_abc_co_2  ;
  // // wire sum_abc_co_3  ;
  // // wire sum_abc_co_4  ;
  // // wire sum_abc_co_5  ;

  // // wire sub = ~ (i_as[4] ^ ( i_bs[4] ) );
  // wire sub = 1;
  // wire comp;
  
  
  // // // 7X-3Y                          VV subtract VV
  // // full_adder_v fa_ab_0  (au_i_m[0], bu_i_m[0] ^ sub, sub         , sum_ab[0], sum_ab_co_0 );
  // // full_adder_v fa_ab_1  (au_i_m[1], bu_i_m[1] ^ sub, sum_ab_co_0 , sum_ab[1], sum_ab_co_1 );
  // // full_adder_v fa_ab_2  (au_i_m[2], bu_i_m[2] ^ sub, sum_ab_co_1 , sum_ab[2], sum_ab_co_2 );
  // // full_adder_v fa_ab_3  (au_i_m[3], bu_i_m[3] ^ sub, sum_ab_co_2 , sum_ab[3], sum_ab_co_3 );
  // // full_adder_v fa_ab_4  (au_i_m[4], bu_i_m[4] ^ sub, sum_ab_co_3 , sum_ab[4], sum_ab_co_4 );
  // // full_adder_v fa_ab_5  (au_i_m[5], bu_i_m[5] ^ sub, sum_ab_co_4 , sum_ab[5], sum_ab_co_5 );
  // // full_adder_v fa_ab_6  (au_i_m[6], bu_i_m[6] ^ sub, sum_ab_co_5 , sum_ab[6], sum_ab_co_6 ); 
  // // full_adder_v fa_ab_7  (au_i_m[7], bu_i_m[7] ^ sub, sum_ab_co_6 , sum_ab[7], sum_ab_co_7 ); 

  // // // 7X-3Y                          VV subtract VV
  // // full_adder_v fa_ab_0  (au_i_m[0], bu_i_m[0] ^ sub, sub         , o_fs[0], sum_ab_co_0 );
  // // full_adder_v fa_ab_1  (au_i_m[1], bu_i_m[1] ^ sub, sum_ab_co_0 , o_fs[1], sum_ab_co_1 );
  // // full_adder_v fa_ab_2  (au_i_m[2], bu_i_m[2] ^ sub, sum_ab_co_1 , o_fs[2], sum_ab_co_2 );
  // // full_adder_v fa_ab_3  (au_i_m[3], bu_i_m[3] ^ sub, sum_ab_co_2 , o_fs[3], sum_ab_co_3 );
  // // full_adder_v fa_ab_4  (au_i_m[4], bu_i_m[4] ^ sub, sum_ab_co_3 , o_fs[4], sum_ab_co_4 );
  // // full_adder_v fa_ab_5  (au_i_m[5], bu_i_m[5] ^ sub, sum_ab_co_4 , o_fs[5], sum_ab_co_5 );
  // // full_adder_v fa_ab_6  (au_i_m[6], bu_i_m[6] ^ sub, sum_ab_co_5 , o_fs[6], sum_ab_co_6 ); 
  // // full_adder_v fa_ab_7  (au_i_m[7], bu_i_m[7] ^ sub, sum_ab_co_6 , o_fs[7], sum_ab_co_7 ); 

  // // 7X-3Y                          VV subtract VV
  // full_adder_v fa_ab_0  (au_i_m[0], bu_i_m[0] ^ sub, sub         , o_fs[0], sum_ab_co_0 );
  // full_adder_v fa_ab_1  (au_i_m[1], bu_i_m[1] ^ sub, sum_ab_co_0 , o_fs[1], sum_ab_co_1 );
  // full_adder_v fa_ab_2  (au_i_m[2], bu_i_m[2] ^ sub, sum_ab_co_1 , o_fs[2], sum_ab_co_2 );
  // full_adder_v fa_ab_3  (au_i_m[3], bu_i_m[3] ^ sub, sum_ab_co_2 , o_fs[3], sum_ab_co_3 );
  // full_adder_v fa_ab_4  (au_i_m[4], bu_i_m[4] ^ sub, sum_ab_co_3 , o_fs[4], sum_ab_co_4 );
  // full_adder_v fa_ab_5  (au_i_m[5], bu_i_m[5] ^ sub, sum_ab_co_4 , o_fs[5], sum_ab_co_5 );
  // full_adder_v fa_ab_6  (au_i_m[6], bu_i_m[6] ^ sub, sum_ab_co_5 , o_fs[6], o_fs[7]     ); 
  
  // // assign sum_ab[8] = sum_ab_co_6 ^ 1; // MSB will always be 0 because this is subtraction
  // // assign sum_ab[8] = au_i_m < bu_i_m; // MSB will always be 0 because this is subtraction
  // // assign o_fs[8] = au_i_m < bu_i_m; // MSB will always be 0 because this is subtraction
  // assign o_fs[8] = 6 * i_as < 11 * i_bs; // MSB will always be 0 because this is subtraction
  // // assign o_fs[8] = 1'b0;
  // // comp = 6 * i_as < 11 * i_bs;
  
  // // // (7X-3Y) + 6Z
  // // full_adder_v fa_abc_0 (sum_ab[0], cu_i_m[0]    , 0           ,   o_fs[0], sum_abc_co_0);
  // // full_adder_v fa_abc_1 (sum_ab[1], cu_i_m[1]    , sum_abc_co_0,   o_fs[1], sum_abc_co_1);
  // // full_adder_v fa_abc_2 (sum_ab[2], cu_i_m[2]    , sum_abc_co_1,   o_fs[2], sum_abc_co_2);
  // // full_adder_v fa_abc_3 (sum_ab[3], cu_i_m[3]    , sum_abc_co_2,   o_fs[3], sum_abc_co_3);
  // // full_adder_v fa_abc_4 (sum_ab[4], cu_i_m[4]    , sum_abc_co_3,   o_fs[4], sum_abc_co_4);
  // // full_adder_v fa_abc_5 (sum_ab[5], cu_i_m[5]    , sum_abc_co_4,   o_fs[5], sum_abc_co_5);
  // // full_adder_v fa_abc_6 (sum_ab[6], cu_i_m[6]    , sum_abc_co_5,   o_fs[6], o_fs[7]     );

// endmodule 













