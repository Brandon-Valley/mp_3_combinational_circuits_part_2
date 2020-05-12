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
 

    bool sum_2x_4x_co_0;
    bool sum_2x_4x_co_1;
    bool sum_2x_4x_co_2;
    bool sum_2x_4x_co_3;
    bool sum_2x_4x_co_4;
    bool sum_2x_4x_co_5;
    bool unused_2;
    bool test0;
    bool test1;
    //sc_signal <bool> test_bool_0.write(false);// = false;
    //sc_signal <bool> test_bool_0;
  
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

    bool      sum_x_6x_co_0;
    bool      sum_x_6x_co_1;
    bool      sum_x_6x_co_2;
    bool      sum_x_6x_co_3;
    bool      sum_x_6x_co_4;
    bool      sum_x_6x_co_5;
    bool      sum_x_6x_co_6;
    bool      unused_3;
  

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
                
    bool      sum_y_2y_co_0;
    bool      sum_y_2y_co_1;
    bool      sum_y_2y_co_2;
    bool      sum_y_2y_co_3;
    bool      sum_y_2y_co_4;
    bool      unused_0;
  
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




    bool      sum_neg_3y_co_0;
    bool      sum_neg_3y_co_1;
    bool      sum_neg_3y_co_2;
    bool      sum_neg_3y_co_3;
    bool      sum_neg_3y_co_4;
    bool      sum_neg_3y_co_5;
    bool      sum_neg_3y_co_6;
    bool      unused_1;

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



    bool      sum_2z_4z_co_0;
    bool      sum_2z_4z_co_1;
    bool      sum_2z_4z_co_2;
    bool      sum_2z_4z_co_3;
    bool      sum_2z_4z_co_4;
    bool      sum_2z_4z_co_5;
    bool      sum_2z_4z_co_6;
    bool      unused_4;
  


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



    bool      sum_7x_neg_3y_co_0;
    bool      sum_7x_neg_3y_co_1;
    bool      sum_7x_neg_3y_co_2;
    bool      sum_7x_neg_3y_co_3;
    bool      sum_7x_neg_3y_co_4;
    bool      sum_7x_neg_3y_co_5;
    bool      sum_7x_neg_3y_co_6;
    bool      unused_5;

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X - 3Y
    //=====================================================================================================
  
    //=====================================================================================================
    //  o_fu = 7X - 3Y + 6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // o_fu = 7X - 3Y + 6Z
    bool      sum_7x_neg_3y_6z_co_0;
    bool      sum_7x_neg_3y_6z_co_1;
    bool      sum_7x_neg_3y_6z_co_2;
    bool      sum_7x_neg_3y_6z_co_3;
    bool      sum_7x_neg_3y_6z_co_4;
    bool      sum_7x_neg_3y_6z_co_5;
    bool      sum_7x_neg_3y_6z_co_6;
    bool      sum_7x_neg_3y_6z_co_7;
    bool      unused_6;
  
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  o_fu = 7X - 3Y + 6Z
    //=====================================================================================================

    bool o_fu__0;
    bool o_fu__1;
    bool o_fu__2;
    bool o_fu__3;
    bool o_fu__4;
    bool o_fu__5;
    bool o_fu__6;
    bool o_fu__7;
    bool o_fu__8;

    sc_lv<9> fu_i;

    ////o_fu = ( 7 * i_au.read() ) - ( 3 * i_bu.read() ) + (6 * i_cu.read() );
    //sc_signal <sc_uint<8>>  bu_x_neg_3; // biggest = -45, but make 8 bit anyway
    //sc_signal <sc_uint<8>>  au_x_7; // biggest = -45, but make 8 bit anyway
    //sc_signal <sc_uint <8>> sum_7x_neg_3y_f; 
    //sc_signal <bool> sum_7x_neg_3y_f_0; 
    //bool sum_7x_neg_3y_co_0;
    //bool test_bool = false;
    //sc_uint<4> test_out;
    //bool co0;
    //bool sum0;



    //bool full_adder(bool a, bool b, bool cif, bool& cof)
    //{
    //    bool sumr;
    //    sumr = (a ^b) ^ cif;
    //    cof = (a&b) | ((a ^ b) & cif);
    //    return sumr, cof;
    //}

    void full_adder(bool a, bool b, bool cif, bool& cof, bool& sumr)
    {
        //bool sumr;
        sumr = (a ^b) ^ cif;
        cof = (a&b) | ((a ^ b) & cif);
        //return sumr, cof;
    }

   // Architecture Statement - Similar to Process Statement
    void p1()
    {
       //test_out[0] = full_adder(i_au.read()[0], i_bu.read()[0], test_bool      , co0);
        //full_adder(i_au.read()[0], i_bu.read()[0], test_bool      , co0, sum0);


       
    //=====================================================================================================
    //  7X
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

    full_adder(false                     , false                      , false          , au_x_6__0, sum_2x_4x_co_0);
    full_adder (i_au.read()[0].to_bool()  , false                     , sum_2x_4x_co_0, au_x_6__1, sum_2x_4x_co_1);
    full_adder (i_au.read()[1].to_bool()  , i_au.read()[0].to_bool()  , sum_2x_4x_co_1, au_x_6__2, sum_2x_4x_co_2);
    full_adder (i_au.read()[2].to_bool()  , i_au.read()[1].to_bool()  , sum_2x_4x_co_2, au_x_6__3, sum_2x_4x_co_3);
    full_adder (i_au.read()[3].to_bool()  , i_au.read()[2].to_bool()  , sum_2x_4x_co_3, au_x_6__4, sum_2x_4x_co_4);
    full_adder (false                     , i_au.read()[3].to_bool()  , sum_2x_4x_co_4, au_x_6__5, sum_2x_4x_co_5);
    full_adder (false                     , false                     , sum_2x_4x_co_5, au_x_6__6, unused_2      );
  
    // 7X = X + 6X          X     +   6X
    full_adder (i_au.read()[0].to_bool()  , au_x_6__0, false         , au_x_7__0, sum_x_6x_co_0 );
    full_adder (i_au.read()[1].to_bool()  , au_x_6__1, sum_x_6x_co_0 , au_x_7__1, sum_x_6x_co_1 );
    full_adder (i_au.read()[2].to_bool()  , au_x_6__2, sum_x_6x_co_1 , au_x_7__2, sum_x_6x_co_2 );
    full_adder (i_au.read()[3].to_bool()  , au_x_6__3, sum_x_6x_co_2 , au_x_7__3, sum_x_6x_co_3 );
    full_adder (false                     , au_x_6__4, sum_x_6x_co_3 , au_x_7__4, sum_x_6x_co_4 );
    full_adder (false                     , au_x_6__5, sum_x_6x_co_4 , au_x_7__5, sum_x_6x_co_5 );
    full_adder (false                     , au_x_6__6, sum_x_6x_co_5 , au_x_7__6, sum_x_6x_co_6 );
    full_adder (false                     , false    , sum_x_6x_co_6 , au_x_7__7, unused_3      );

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X
    //=====================================================================================================
  
  
  
  
    //=====================================================================================================
    //  -3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  
    // Y + 2Y = 3Y              Y              2Y
    full_adder (i_bu.read()[0].to_bool(),      false                   , false        ,   bu_x_3__0,     sum_y_2y_co_0 );
    full_adder (i_bu.read()[1].to_bool(),      i_bu.read()[0].to_bool(), sum_y_2y_co_0,   bu_x_3__1,     sum_y_2y_co_1 );
    full_adder (i_bu.read()[2].to_bool(),      i_bu.read()[1].to_bool(), sum_y_2y_co_1,   bu_x_3__2,     sum_y_2y_co_2 );
    full_adder (i_bu.read()[3].to_bool(),      i_bu.read()[2].to_bool(), sum_y_2y_co_2,   bu_x_3__3,     sum_y_2y_co_3 );
    full_adder (false                   ,      i_bu.read()[3].to_bool(), sum_y_2y_co_3,   bu_x_3__4,     sum_y_2y_co_4 );
    full_adder (false                   ,      false                   , sum_y_2y_co_4,   bu_x_3__5,     unused_0      );
  
    // -3Y = 2's complement of 3Y
    full_adder ( ! bu_x_3__0, true,    false          , bu_x_neg_3__0, sum_neg_3y_co_0);
    full_adder ( ! bu_x_3__1, true,    sum_neg_3y_co_0, bu_x_neg_3__1, sum_neg_3y_co_1);
    full_adder ( ! bu_x_3__2, true,    sum_neg_3y_co_1, bu_x_neg_3__2, sum_neg_3y_co_2);
    full_adder ( ! bu_x_3__3, true,    sum_neg_3y_co_2, bu_x_neg_3__3, sum_neg_3y_co_3);
    full_adder ( ! bu_x_3__4, true,    sum_neg_3y_co_3, bu_x_neg_3__4, sum_neg_3y_co_4);
    full_adder ( ! bu_x_3__5, true,    sum_neg_3y_co_4, bu_x_neg_3__5, sum_neg_3y_co_5);
    full_adder (   true     , true,    sum_neg_3y_co_5, bu_x_neg_3__6, sum_neg_3y_co_6);
    full_adder (   true     , true,    sum_neg_3y_co_6, bu_x_neg_3__7, unused_1       );

    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  -3Y
    //=====================================================================================================
  
    //=====================================================================================================
    //  6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    // 6Z = 2Z + 4Z              2Z     +  4Z
    full_adder (false                     , false                     , false         , cu_x_6__0, sum_2z_4z_co_0);
    full_adder (i_cu.read()[0].to_bool()  , false                     , sum_2z_4z_co_0, cu_x_6__1, sum_2z_4z_co_1);
    full_adder (i_cu.read()[1].to_bool()  , i_cu.read()[0].to_bool()  , sum_2z_4z_co_1, cu_x_6__2, sum_2z_4z_co_2);
    full_adder (i_cu.read()[2].to_bool()  , i_cu.read()[1].to_bool()  , sum_2z_4z_co_2, cu_x_6__3, sum_2z_4z_co_3);
    full_adder (i_cu.read()[3].to_bool()  , i_cu.read()[2].to_bool()  , sum_2z_4z_co_3, cu_x_6__4, sum_2z_4z_co_4);
    full_adder (false                     , i_cu.read()[3].to_bool()  , sum_2z_4z_co_4, cu_x_6__5, sum_2z_4z_co_5);
    full_adder (false                     , false                     , sum_2z_4z_co_5, cu_x_6__6, sum_2z_4z_co_6);
    full_adder (false                     , false                     , sum_2z_4z_co_6, cu_x_6__7, unused_4      );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  6Z
    //=====================================================================================================
  
    //=====================================================================================================
    //  7X - 3Y
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  

    // 7X - 3Y                        7X       +  -3Y
    full_adder (au_x_7__0, bu_x_neg_3__0, false             , sum_7x_neg_3y_f__0, sum_7x_neg_3y_co_0);
    full_adder (au_x_7__1, bu_x_neg_3__1, sum_7x_neg_3y_co_0, sum_7x_neg_3y_f__1, sum_7x_neg_3y_co_1);
    full_adder (au_x_7__2, bu_x_neg_3__2, sum_7x_neg_3y_co_1, sum_7x_neg_3y_f__2, sum_7x_neg_3y_co_2);
    full_adder (au_x_7__3, bu_x_neg_3__3, sum_7x_neg_3y_co_2, sum_7x_neg_3y_f__3, sum_7x_neg_3y_co_3);
    full_adder (au_x_7__4, bu_x_neg_3__4, sum_7x_neg_3y_co_3, sum_7x_neg_3y_f__4, sum_7x_neg_3y_co_4);
    full_adder (au_x_7__5, bu_x_neg_3__5, sum_7x_neg_3y_co_4, sum_7x_neg_3y_f__5, sum_7x_neg_3y_co_5);
    full_adder (au_x_7__6, bu_x_neg_3__6, sum_7x_neg_3y_co_5, sum_7x_neg_3y_f__6, sum_7x_neg_3y_co_6);
    full_adder (au_x_7__7, bu_x_neg_3__7, sum_7x_neg_3y_co_6, sum_7x_neg_3y_f__7, unused_5          );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  7X - 3Y
    //=====================================================================================================
  
    //=====================================================================================================
    //  o_fu = 7X - 3Y + 6Z
    //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  

    // o_fu = 7X - 3Y + 6Z               7X-3Y             +  6Z
    full_adder (sum_7x_neg_3y_f__0, cu_x_6__0, false                , o_fu__0, sum_7x_neg_3y_6z_co_0);
    full_adder (sum_7x_neg_3y_f__1, cu_x_6__1, sum_7x_neg_3y_6z_co_0, o_fu__1, sum_7x_neg_3y_6z_co_1);
    full_adder (sum_7x_neg_3y_f__2, cu_x_6__2, sum_7x_neg_3y_6z_co_1, o_fu__2, sum_7x_neg_3y_6z_co_2);
    full_adder (sum_7x_neg_3y_f__3, cu_x_6__3, sum_7x_neg_3y_6z_co_2, o_fu__3, sum_7x_neg_3y_6z_co_3);
    full_adder (sum_7x_neg_3y_f__4, cu_x_6__4, sum_7x_neg_3y_6z_co_3, o_fu__4, sum_7x_neg_3y_6z_co_4);
    full_adder (sum_7x_neg_3y_f__5, cu_x_6__5, sum_7x_neg_3y_6z_co_4, o_fu__5, sum_7x_neg_3y_6z_co_5);
    full_adder (sum_7x_neg_3y_f__6, cu_x_6__6, sum_7x_neg_3y_6z_co_5, o_fu__6, sum_7x_neg_3y_6z_co_6);
    full_adder (sum_7x_neg_3y_f__7, cu_x_6__7, sum_7x_neg_3y_6z_co_6, o_fu__7, sum_7x_neg_3y_6z_co_7);
    full_adder (sum_7x_neg_3y_f__7, false    , sum_7x_neg_3y_6z_co_7, o_fu__8, unused_6             );


    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //  o_fu = 7X - 3Y + 6Z
    //=====================================================================================================
    

    //o_fu <= {
    //            o_fu__0,
    //            o_fu__1,
    //            o_fu__2,
    //            o_fu__3,
    //            o_fu__4,
    //            o_fu__5,
    //            o_fu__6,
    //            o_fu__7,
    //            o_fu__8

    //}

    //o_fu[0] = o_fu__0;

    fu_i[0] = o_fu__0;
    fu_i[1] = o_fu__1;
    fu_i[2] = o_fu__2;
    fu_i[3] = o_fu__3;
    fu_i[4] = o_fu__4;
    fu_i[5] = o_fu__5;
    fu_i[6] = o_fu__6;
    fu_i[7] = o_fu__7;
    fu_i[8] = o_fu__8;

    o_fu = fu_i;


    }


    // Constructor
    SC_CTOR(unsigned_calc__cmpnt) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_au
                  << i_bu
                  << i_cu
                  ;
    }

};






#endif