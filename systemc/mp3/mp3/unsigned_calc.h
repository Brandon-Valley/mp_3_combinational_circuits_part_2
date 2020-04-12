#ifndef unsigned_calc_gate_H
#define unsigned_calc_gate_H

#include "systemc.h"

using namespace std;


////////////////////////////////////////////////
//  Behavior Model
////////////////////////////////////////////////
SC_MODULE(unsigned_calc__behavior) 
{
    //  Define IO Ports
    sc_in  <sc_uint<4>> i_au ;
    sc_in  <sc_uint<4>> i_bu ;
    sc_in  <sc_uint<4>> i_cu ;
    sc_out <sc_uint<8>> o_fu ; // largest possible is 195: takes 8 bits



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




////////////////////////////////////////////////
//  Component Model - With Full Adders
////////////////////////////////////////////////
#include "full_adder.h"
SC_MODULE(unsigned_calc__cmpnt) 
{
    //  Define IO Ports
    sc_in  <sc_uint<4>> i_au ;
    sc_in  <sc_uint<4>> i_bu ;
    sc_in  <sc_uint<4>> i_cu ;
    sc_out <sc_uint<8>> o_fu ; // largest possible is 195: takes 8 bits


    ////  Component Instances
    //half_adder ha_1;
    //half_adder ha_2;


   // internal 
   //sc_signal <sc_uint<4>> seven = 7;

   //<sc_uint<7>> au_i_m = i_au + i_au + i_au + i_au + i_au + i_au + i_au;
   //sc_signal <sc_uint<7>> au_i_m = ("000", i_au);// 
   
   sc_uint<7> bu_i_m = 3 * i_bu.read();
   //sc_signal  <sc_uint<7>> cu_i_m = 6 * i_cu;

       // Architecture Statement - Similar to Process Statement
    void p1()
    {
        //o_fu = ( 7 * i_au.read() ) - ( 3 * i_bu.read() ) + (6 * i_cu.read() );
        au_i_m = 7 * i_au.read();
    }


   //sc_signal 
   //sc_signal  unsigned [7:0] sum_ab;
   //sc_signal 
   //sc_signal <bool> sum_ab_co_0  ;
   //sc_signal <bool> sum_ab_co_1  ;
   //sc_signal <bool> sum_ab_co_2  ;
   //sc_signal <bool> sum_ab_co_3  ;
   //sc_signal <bool> sum_ab_co_4  ;
   //sc_signal <bool> sum_ab_co_5  ;
   //sc_signal <bool> sum_ab_co_6  ;
   //sc_signal <bool>
   //sc_signal <bool> sum_abc_co_0  ;
   //sc_signal <bool> sum_abc_co_1  ;
   //sc_signal <bool> sum_abc_co_2  ;
   //sc_signal <bool> sum_abc_co_3  ;
   //sc_signal <bool> sum_abc_co_4  ;
   //sc_signal <bool> sum_abc_co_5  ;





    //  Internal Signals
    sc_signal <bool> ha_1_s;
    sc_signal <bool> ha_1_co;
    sc_signal <bool> ha_2_co;

    // Constructor
    SC_CTOR(unsigned_calc__cmpnt) : 
                                ha_1("G1"),
                                ha_2("G2")
    {
        ha_1(i_a     , i_b    , ha_1_co, ha_1_s);
        ha_2(ha_1_s  , i_ci   , ha_2_co, o_s );
        o_co = ha_2_co || ha_1_co;
    }
};











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






#endif