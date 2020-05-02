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

    //o_fu = ( 7 * i_au.read() ) - ( 3 * i_bu.read() ) + (6 * i_cu.read() );
    sc_signal <sc_uint<8>>  bu_x_neg_3; // biggest = -45, but make 8 bit anyway
    sc_signal <sc_uint<8>>  au_x_7; // biggest = -45, but make 8 bit anyway
    sc_signal <sc_uint <8>> sum_7x_neg_3y_f; 
    sc_signal <bool> sum_7x_neg_3y_f_0; 
    bool sum_7x_neg_3y_co_0;
    bool test_bool = false;
    sc_uint<4> test_out;
    bool co0;

    //au_x_7 = "111111111";
    //bu_x_neg_3 = "111111111";

    //////  Component Instances
    //half_adder ha_1;
    //fn ha_2;


   // internal 
   //sc_signal <sc_uint<4>> seven = 7;

   //<sc_uint<7>> au_i_m = i_au + i_au + i_au + i_au + i_au + i_au + i_au;
   //sc_signal <sc_uint<7>> au_i_m = ("000", i_au);// 
   
   //sc_uint<7> bu_i_m = 3 * i_bu.read();
   //sc_signal  <sc_uint<7>> cu_i_m = 6 * i_cu;


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


       //sc_signal <bool> sumr = fulladder(au_x_7.read()[0].to_bool(), bu_x_neg_3.read()[0].to_bool(), false      , &sum_7x_neg_3y_f_0);
       //sc_signal <bool> sumr = fulladder(au_x_7.read()[0], bu_x_neg_3.read()[0], false      , sum_7x_neg_3y_f_0);
       //sc_signal <bool> sumr = fulladder(i_au.read()[0], i_bu.read()[0], test_bool      , sum_7x_neg_3y_f_0);
       //test_out[0] = fulladder(i_au.read()[0], i_bu.read()[0], test_bool      , sum_7x_neg_3y_f_0);
       test_out[0] = fulladder(i_au.read()[0], i_bu.read()[0], test_bool      , co0);
       //o_fu[0] = fulladder(i_au.read()[0], i_bu.read()[0], test_bool      , sum_7x_neg_3y_f_0);


    }


};






#endif