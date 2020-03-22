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
        //o_s.write((i_a.read() ^ i_b.read()) ^ i_ci.read());
        //o_co.write((i_a.read() & i_b.read()) | ((i_a.read() ^ i_b.read()) & i_ci.read()));

        o_fu = 6;
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




//////////////////////////////////////////////////
////  Component Model - With Half Adders
//////////////////////////////////////////////////
//#include "half_adder.h"
//SC_MODULE(unsigned_calc__cmpnt) 
//{
//    //  Define IO Ports
//    sc_in  <bool> i_a ;
//    sc_in  <bool> i_b ;
//    sc_in  <bool> i_ci;
//    sc_out <bool> o_co;
//    sc_out <bool> o_s ;
//
//
//    //  Component Instances
//    half_adder ha_1;
//    half_adder ha_2;
//
//    //  Internal Signals
//    sc_signal <bool> ha_1_s;
//    sc_signal <bool> ha_1_co;
//    sc_signal <bool> ha_2_co;
//
//    // Constructor
//    SC_CTOR(unsigned_calc__cmpnt) : 
//                                ha_1("G1"),
//                                ha_2("G2")
//    {
//        ha_1(i_a     , i_b    , ha_1_co, ha_1_s);
//        ha_2(ha_1_s  , i_ci   , ha_2_co, o_s );
//        o_co = ha_2_co || ha_1_co;
//    }
//};
#endif