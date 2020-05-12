#ifndef unsigned_calc_gate_H
#define unsigned_calc_gate_H

#include "systemc.h"

using namespace std;

// 7X-3Y+6Z
////////////////////////////////////////////////
//  Behavior Model
////////////////////////////////////////////////
SC_MODULE(unsigned_calc__behavior) 
{
    //  Define IO Ports
    sc_in  <sc_uint<4>> i_au ;
    sc_in  <sc_uint<4>> i_bu ;
    sc_in  <sc_uint<4>> i_cu ;
    sc_out <sc_int<9>> o_fu ; // largest possible is 195: takes 8 bits



    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        o_fu = ( 7 * i_au.read() ) - ( 3 * i_bu.read() ) + (6 * i_cu.read() );
    }


    // Constructor
    SC_CTOR(unsigned_calc__behavior) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_au
                  << i_bu
                  << i_cu
                  ;
    }
};



// 7X-3Y+6Z
////////////////////////////////////////////////
//  Component Model - With Full Adders
////////////////////////////////////////////////
#include "full_adder.h"
#include "half_adder.h"
SC_MODULE(unsigned_calc__cmpnt) 
{
    //  Define IO Ports
    sc_in  <sc_uint<4>> i_au ;
    sc_in  <sc_uint<4>> i_bu ;
    sc_in  <sc_uint<4>> i_cu ;
    sc_out <sc_int<9>>  o_fu ; 







       
    //sc_signal <sc_lv<8>>  sum_ab;
    bool sum_ab__0;
    bool sum_ab__1;
    bool sum_ab__2;
    bool sum_ab__3;
    bool sum_ab__4;
    bool sum_ab__5;
    bool sum_ab__6;
    bool sum_ab__7;
  
    sc_signal <bool>      sum_ab_co_0  ;
    sc_signal <bool>      sum_ab_co_1  ;
    sc_signal <bool>      sum_ab_co_2  ;
    sc_signal <bool>      sum_ab_co_3  ;
    sc_signal <bool>      sum_ab_co_4  ;
    sc_signal <bool>      sum_ab_co_5  ;
    sc_signal <bool>      sum_ab_co_6  ;

    sc_signal <bool>      sum_abc_co_0  ;
    sc_signal <bool>      sum_abc_co_1  ;
    sc_signal <bool>      sum_abc_co_2  ;
    sc_signal <bool>      sum_abc_co_3  ;
    sc_signal <bool>      sum_abc_co_4  ;
    sc_signal <bool>      sum_abc_co_5  ;
  

    //=====================================================================================================
    //  7X
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // 6X = 2X + 4X
    //sc_signal <sc_lv<7>>  au_x_6; // biggest = 15 * 6 = 90 = 101 1010
    bool au_x_6__0;
    bool au_x_6__1;
    bool au_x_6__2;
    bool au_x_6__3;
    bool au_x_6__4;
    bool au_x_6__5;
    bool au_x_6__6;
 

    sc_signal <bool>      sum_2x_4x_co_0;
    sc_signal <bool>      sum_2x_4x_co_1;
    sc_signal <bool>      sum_2x_4x_co_2;
    sc_signal <bool>      sum_2x_4x_co_3;
    sc_signal <bool>      sum_2x_4x_co_4;
    sc_signal <bool>      sum_2x_4x_co_5;
    sc_signal <bool>      unused_2;
    sc_signal <bool>      test0;
    sc_signal <bool>      test1;
    //sc_signal <bool> test_bool_0.write(false);// = false;
    sc_signal <bool> test_bool_0;
  
    // 7X = X + 6X
    //sc_signal <sc_lv<8>>  au_x_7;
    bool au_x_7__0;
    bool au_x_7__1;
    bool au_x_7__2;
    bool au_x_7__3;
    bool au_x_7__4;
    bool au_x_7__5;
    bool au_x_7__6;
    bool au_x_7__7;

    sc_signal <bool>      sum_x_6x_co_0;
    sc_signal <bool>      sum_x_6x_co_1;
    sc_signal <bool>      sum_x_6x_co_2;
    sc_signal <bool>      sum_x_6x_co_3;
    sc_signal <bool>      sum_x_6x_co_4;
    sc_signal <bool>      sum_x_6x_co_5;
    sc_signal <bool>      sum_x_6x_co_6;
    sc_signal <bool>      unused_3;
  

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X
    //=====================================================================================================
  
  
  
  
    //=====================================================================================================
    //  -3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // Y + 2Y = 3Y 
    //sc_signal <sc_lv<6>>  bu_x_3;     // biggest = 45 = 10 1101
    bool bu_x_3__0;
    bool bu_x_3__1;
    bool bu_x_3__2;
    bool bu_x_3__3;
    bool bu_x_3__4;
    bool bu_x_3__5;
                
    sc_signal <bool>      sum_y_2y_co_0;
    sc_signal <bool>      sum_y_2y_co_1;
    sc_signal <bool>      sum_y_2y_co_2;
    sc_signal <bool>      sum_y_2y_co_3;
    sc_signal <bool>      sum_y_2y_co_4;
    sc_signal <bool>      unused_0;
  
    // -3Y = 2's complement of 3Y
    //sc_signal <sc_lv<8>>  bu_x_neg_3; // biggest = -45, but make 8 bit anyway
    bool bu_x_neg_3__0;
    bool bu_x_neg_3__1;
    bool bu_x_neg_3__2;
    bool bu_x_neg_3__3;
    bool bu_x_neg_3__4;
    bool bu_x_neg_3__5;
    bool bu_x_neg_3__6;
    bool bu_x_neg_3__7;




    sc_signal <bool>      sum_neg_3y_co_0;
    sc_signal <bool>      sum_neg_3y_co_1;
    sc_signal <bool>      sum_neg_3y_co_2;
    sc_signal <bool>      sum_neg_3y_co_3;
    sc_signal <bool>      sum_neg_3y_co_4;
    sc_signal <bool>      sum_neg_3y_co_5;
    sc_signal <bool>      sum_neg_3y_co_6;
    sc_signal <bool>      unused_1;

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  -3Y
    //=====================================================================================================
  
  
    //=====================================================================================================
    //  6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // 6X = 2X + 4X
    //sc_signal <sc_lv<8>>  cu_x_6 ; 

    bool cu_x_6__0;
    bool cu_x_6__1;
    bool cu_x_6__2;
    bool cu_x_6__3;
    bool cu_x_6__4;
    bool cu_x_6__5;
    bool cu_x_6__6;
    bool cu_x_6__7;



    sc_signal <bool>      sum_2z_4z_co_0;
    sc_signal <bool>      sum_2z_4z_co_1;
    sc_signal <bool>      sum_2z_4z_co_2;
    sc_signal <bool>      sum_2z_4z_co_3;
    sc_signal <bool>      sum_2z_4z_co_4;
    sc_signal <bool>      sum_2z_4z_co_5;
    sc_signal <bool>      sum_2z_4z_co_6;
    sc_signal <bool>      unused_4;
  


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  6Z
    //=====================================================================================================
  
  
    //=====================================================================================================
    //  7X - 3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // 7X - 3Y
    //sc_signal <sc_lv <8>> sum_7x_neg_3y_f; 
    bool sum_7x_neg_3y_f__0;
    bool sum_7x_neg_3y_f__1;
    bool sum_7x_neg_3y_f__2;
    bool sum_7x_neg_3y_f__3;
    bool sum_7x_neg_3y_f__4;
    bool sum_7x_neg_3y_f__5;
    bool sum_7x_neg_3y_f__6;
    bool sum_7x_neg_3y_f__7;



    sc_signal <bool>      sum_7x_neg_3y_co_0;
    sc_signal <bool>      sum_7x_neg_3y_co_1;
    sc_signal <bool>      sum_7x_neg_3y_co_2;
    sc_signal <bool>      sum_7x_neg_3y_co_3;
    sc_signal <bool>      sum_7x_neg_3y_co_4;
    sc_signal <bool>      sum_7x_neg_3y_co_5;
    sc_signal <bool>      sum_7x_neg_3y_co_6;
    sc_signal <bool>      unused_5;

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X - 3Y
    //=====================================================================================================
  
    //=====================================================================================================
    //  o_fu = 7X - 3Y + 6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // o_fu = 7X - 3Y + 6Z
    sc_signal <bool>      sum_7x_neg_3y_6z_co_0;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_1;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_2;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_3;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_4;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_5;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_6;
    sc_signal <bool>      sum_7x_neg_3y_6z_co_7;
    sc_signal <bool>      unused_6;
  
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  o_fu = 7X - 3Y + 6Z
    //=====================================================================================================








    //o_fu = ( 7 * i_au.read() ) - ( 3 * i_bu.read() ) + (6 * i_cu.read() );
    sc_signal <sc_uint<8>>  bu_x_neg_3; // biggest = -45, but make 8 bit anyway
    sc_signal <sc_uint<8>>  au_x_7; // biggest = -45, but make 8 bit anyway
    sc_signal <sc_uint <8>> sum_7x_neg_3y_f; 
    sc_signal <bool> sum_7x_neg_3y_f_0; 
    bool sum_7x_neg_3y_co_0;
    bool test_bool = false;
    sc_uint<4> test_out;
    bool co0;



    bool fulladder(bool a, bool b, bool cif, bool& cof)
    {
        bool sumr;
        sumr = (a ^b) ^ cif;
        cof = (a&b) | ((a ^ b) & cif);
        return sumr, cof;
    }

   // Architecture Statement - Similar to Process Statement
    void p1()
    {
       test_out[0] = fulladder(i_au.read()[0], i_bu.read()[0], test_bool      , co0);



       
    //=====================================================================================================
    //  7X
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV


    

    // 6X = 2X + 4X              2X     +  4X
    //full_adder fa_6x_0      (false                     , false                     , false         ,  static_cast<sc_logic>(au_x_6[0]), sum_2x_4x_co_0);
    //full_adder fa_6x_0      (false                     , false                     , false         , au_x_6[0].write(), sum_2x_4x_co_0);
    //full_adder fa_6x_0      (false                     , false                     , false         , test1, test0);
    //full_adder fa_6x_0      (test_bool_0                     , test_bool_0                     , test_bool_0         , test1, test0);
    full_adder fa_6x_0      (test_bool_0                     , test_bool_0                     , test_bool_0         , test_bool_0, test_bool_0);


    full_adder fa_6x_0      (false                     , false                     , false         , au_x_6__0, sum_2x_4x_co_0);
    full_adder fa_6x_1      (i_au.read()[0].to_bool()  , false                     , sum_2x_4x_co_0, au_x_6__1, sum_2x_4x_co_1);
    full_adder fa_6x_2      (i_au.read()[1].to_bool()  , i_au.read()[0].to_bool()  , sum_2x_4x_co_1, au_x_6__2, sum_2x_4x_co_2);
    full_adder fa_6x_3      (i_au.read()[2].to_bool()  , i_au.read()[1].to_bool()  , sum_2x_4x_co_2, au_x_6__3, sum_2x_4x_co_3);
    full_adder fa_6x_4      (i_au.read()[3].to_bool()  , i_au.read()[2].to_bool()  , sum_2x_4x_co_3, au_x_6__4, sum_2x_4x_co_4);
    full_adder fa_6x_5      (false                     , i_au.read()[3].to_bool()  , sum_2x_4x_co_4, au_x_6__5, sum_2x_4x_co_5);
    full_adder fa_6x_6      (false                     , false                     , sum_2x_4x_co_5, au_x_6__6, unused_2      );
  
    // 7X = X + 6X          X     +   6X
    full_adder fa_7x_0      (i_au.read()[0].to_bool()  , au_x_6.read()[0].to_bool(), false         , au_x_7[0], sum_x_6x_co_0 );
    full_adder fa_7x_1      (i_au.read()[1].to_bool()  , au_x_6.read()[1].to_bool(), sum_x_6x_co_0 , au_x_7[1], sum_x_6x_co_1 );
    full_adder fa_7x_2      (i_au.read()[2].to_bool()  , au_x_6.read()[2].to_bool(), sum_x_6x_co_1 , au_x_7[2], sum_x_6x_co_2 );
    full_adder fa_7x_3      (i_au.read()[3].to_bool()  , au_x_6.read()[3].to_bool(), sum_x_6x_co_2 , au_x_7[3], sum_x_6x_co_3 );
    full_adder fa_7x_4      (false                     , au_x_6.read()[4].to_bool(), sum_x_6x_co_3 , au_x_7[4], sum_x_6x_co_4 );
    full_adder fa_7x_5      (false                     , au_x_6.read()[5].to_bool(), sum_x_6x_co_4 , au_x_7[5], sum_x_6x_co_5 );
    full_adder fa_7x_6      (false                     , au_x_6.read()[6].to_bool(), sum_x_6x_co_5 , au_x_7[6], sum_x_6x_co_6 );
    full_adder fa_7x_7      (false                     , false                     , sum_x_6x_co_6 , au_x_7[7], unused_3      );

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X
    //=====================================================================================================
  
  
  
  
    //=====================================================================================================
    //  -3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  
    // Y + 2Y = 3Y              Y              2Y
    full_adder fa_3y_0      (i_bu.read()[0].to_bool(),      false                   , false        ,   bu_x_3[0],     sum_y_2y_co_0 );
    full_adder fa_3y_1      (i_bu.read()[1].to_bool(),      i_bu.read()[0].to_bool(), sum_y_2y_co_0,   bu_x_3[1],     sum_y_2y_co_1 );
    full_adder fa_3y_2      (i_bu.read()[2].to_bool(),      i_bu.read()[1].to_bool(), sum_y_2y_co_1,   bu_x_3[2],     sum_y_2y_co_2 );
    full_adder fa_3y_3      (i_bu.read()[3].to_bool(),      i_bu.read()[2].to_bool(), sum_y_2y_co_2,   bu_x_3[3],     sum_y_2y_co_3 );
    full_adder fa_3y_4      (false                   ,      i_bu.read()[3].to_bool(), sum_y_2y_co_3,   bu_x_3[4],     sum_y_2y_co_4 );
    full_adder fa_3y_5      (false                   ,      false                   , sum_y_2y_co_4,   bu_x_3[5],     unused_0      );
    //full_adder fa_3y_5      (false     ,      false     , true,   true,     false     );
  
    // -3Y = 2's complement of 3Y
    full_adder fa_neg_3y_0 ( ! bu_x_3.read()[0], true,    false          , bu_x_neg_3[0], sum_neg_3y_co_0);
    full_adder fa_neg_3y_1 ( ! bu_x_3.read()[1], true,    sum_neg_3y_co_0, bu_x_neg_3[1], sum_neg_3y_co_1);
    full_adder fa_neg_3y_2 ( ! bu_x_3.read()[2], true,    sum_neg_3y_co_1, bu_x_neg_3[2], sum_neg_3y_co_2);
    full_adder fa_neg_3y_3 ( ! bu_x_3.read()[3], true,    sum_neg_3y_co_2, bu_x_neg_3[3], sum_neg_3y_co_3);
    full_adder fa_neg_3y_4 ( ! bu_x_3.read()[4], true,    sum_neg_3y_co_3, bu_x_neg_3[4], sum_neg_3y_co_4);
    full_adder fa_neg_3y_5 ( ! bu_x_3.read()[5], true,    sum_neg_3y_co_4, bu_x_neg_3[5], sum_neg_3y_co_5);
    full_adder fa_neg_3y_6 (   true            , true,    sum_neg_3y_co_5, bu_x_neg_3[6], sum_neg_3y_co_6);
    full_adder fa_neg_3y_7 (   true            , true,    sum_neg_3y_co_6, bu_x_neg_3[7], unused_1       );

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  -3Y
    //=====================================================================================================
  
  
  
  
  
    //=====================================================================================================
    //  6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV


    // 6Z = 2Z + 4Z              2Z     +  4Z
    full_adder fa_6z_0    (false                     , false                     , false         , cu_x_6[0], sum_2z_4z_co_0);
    full_adder fa_6z_1    (i_cu.read()[0].to_bool()  , false                     , sum_2z_4z_co_0, cu_x_6[1], sum_2z_4z_co_1);
    full_adder fa_6z_2    (i_cu.read()[1].to_bool()  , i_cu.read()[0].to_bool()  , sum_2z_4z_co_1, cu_x_6[2], sum_2z_4z_co_2);
    full_adder fa_6z_3    (i_cu.read()[2].to_bool()  , i_cu.read()[1].to_bool()  , sum_2z_4z_co_2, cu_x_6[3], sum_2z_4z_co_3);
    full_adder fa_6z_4    (i_cu.read()[3].to_bool()  , i_cu.read()[2].to_bool()  , sum_2z_4z_co_3, cu_x_6[4], sum_2z_4z_co_4);
    full_adder fa_6z_5    (false                     , i_cu.read()[3].to_bool()  , sum_2z_4z_co_4, cu_x_6[5], sum_2z_4z_co_5);
    full_adder fa_6z_6    (false                     , false                     , sum_2z_4z_co_5, cu_x_6[6], sum_2z_4z_co_6);
    full_adder fa_6z_7    (false                     , false                     , sum_2z_4z_co_6, cu_x_6[7], unused_4      );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  6Z
    //=====================================================================================================
  

  
  
  
  
    //=====================================================================================================
    //  7X - 3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  

    // 7X - 3Y                        7X       +  -3Y
    full_adder fa_7x_neg_3y_0   (au_x_7.read()[0].to_bool(), bu_x_neg_3.read()[0].to_bool(), false             , sum_7x_neg_3y_f[0], sum_7x_neg_3y_co_0);
    full_adder fa_7x_neg_3y_1   (au_x_7.read()[1].to_bool(), bu_x_neg_3.read()[1].to_bool(), sum_7x_neg_3y_co_0, sum_7x_neg_3y_f[1], sum_7x_neg_3y_co_1);
    full_adder fa_7x_neg_3y_2   (au_x_7.read()[2].to_bool(), bu_x_neg_3.read()[2].to_bool(), sum_7x_neg_3y_co_1, sum_7x_neg_3y_f[2], sum_7x_neg_3y_co_2);
    full_adder fa_7x_neg_3y_3   (au_x_7.read()[3].to_bool(), bu_x_neg_3.read()[3].to_bool(), sum_7x_neg_3y_co_2, sum_7x_neg_3y_f[3], sum_7x_neg_3y_co_3);
    full_adder fa_7x_neg_3y_4   (au_x_7.read()[4].to_bool(), bu_x_neg_3.read()[4].to_bool(), sum_7x_neg_3y_co_3, sum_7x_neg_3y_f[4], sum_7x_neg_3y_co_4);
    full_adder fa_7x_neg_3y_5   (au_x_7.read()[5].to_bool(), bu_x_neg_3.read()[5].to_bool(), sum_7x_neg_3y_co_4, sum_7x_neg_3y_f[5], sum_7x_neg_3y_co_5);
    full_adder fa_7x_neg_3y_6   (au_x_7.read()[6].to_bool(), bu_x_neg_3.read()[6].to_bool(), sum_7x_neg_3y_co_5, sum_7x_neg_3y_f[6], sum_7x_neg_3y_co_6);
    full_adder fa_7x_neg_3y_7   (au_x_7.read()[7].to_bool(), bu_x_neg_3.read()[7].to_bool(), sum_7x_neg_3y_co_6, sum_7x_neg_3y_f[7], unused_5          );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X - 3Y
    //=====================================================================================================
  
  
  
  
    //=====================================================================================================
    //  o_fu = 7X - 3Y + 6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  

    // o_fu = 7X - 3Y + 6Z               7X-3Y             +  6Z
    full_adder fa_7x_neg_3y_6z_0    (sum_7x_neg_3y_f.read()[0].to_bool(), cu_x_6.read()[0].to_bool(), false                , o_fu[0], sum_7x_neg_3y_6z_co_0);
    full_adder fa_7x_neg_3y_6z_1    (sum_7x_neg_3y_f.read()[1].to_bool(), cu_x_6.read()[1].to_bool(), sum_7x_neg_3y_6z_co_0, o_fu[1], sum_7x_neg_3y_6z_co_1);
    full_adder fa_7x_neg_3y_6z_2    (sum_7x_neg_3y_f.read()[2].to_bool(), cu_x_6.read()[2].to_bool(), sum_7x_neg_3y_6z_co_1, o_fu[2], sum_7x_neg_3y_6z_co_2);
    full_adder fa_7x_neg_3y_6z_3    (sum_7x_neg_3y_f.read()[3].to_bool(), cu_x_6.read()[3].to_bool(), sum_7x_neg_3y_6z_co_2, o_fu[3], sum_7x_neg_3y_6z_co_3);
    full_adder fa_7x_neg_3y_6z_4    (sum_7x_neg_3y_f.read()[4].to_bool(), cu_x_6.read()[4].to_bool(), sum_7x_neg_3y_6z_co_3, o_fu[4], sum_7x_neg_3y_6z_co_4);
    full_adder fa_7x_neg_3y_6z_5    (sum_7x_neg_3y_f.read()[5].to_bool(), cu_x_6.read()[5].to_bool(), sum_7x_neg_3y_6z_co_4, o_fu[5], sum_7x_neg_3y_6z_co_5);
    full_adder fa_7x_neg_3y_6z_6    (sum_7x_neg_3y_f.read()[6].to_bool(), cu_x_6.read()[6].to_bool(), sum_7x_neg_3y_6z_co_5, o_fu[6], sum_7x_neg_3y_6z_co_6);
    full_adder fa_7x_neg_3y_6z_7    (sum_7x_neg_3y_f.read()[7].to_bool(), cu_x_6.read()[7].to_bool(), sum_7x_neg_3y_6z_co_6, o_fu[7], sum_7x_neg_3y_6z_co_7);
    full_adder fa_7x_neg_3y_6z_8    (sum_7x_neg_3y_f.read()[7].to_bool(), false              , sum_7x_neg_3y_6z_co_7, o_fu[8], unused_6             );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  o_fu = 7X - 3Y + 6Z
    //=====================================================================================================
    





    }


};






#endif