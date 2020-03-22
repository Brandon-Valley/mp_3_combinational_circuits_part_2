#ifndef full_adder_gate_H
#define full_adder_gate_H

#include "systemc.h"

using namespace std;


////////////////////////////////////////////////
//  Equation Model
////////////////////////////////////////////////
SC_MODULE(full_adder__equation) 
{
    //  Define IO Ports
    sc_in  <bool> i_a ;
    sc_in  <bool> i_b ;
    sc_in  <bool> i_ci;
    sc_out <bool> o_co;
    sc_out <bool> o_s ;


    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        o_s.write((i_a.read() ^ i_b.read()) ^ i_ci.read());
        o_co.write((i_a.read() & i_b.read()) | ((i_a.read() ^ i_b.read()) & i_ci.read()));
    }


    // Constructor
    SC_CTOR(full_adder__equation) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_a 
                  << i_b 
                  << i_ci
                  ;
    }
};



////////////////////////////////////////////////
//  Behavior Model
////////////////////////////////////////////////
SC_MODULE(full_adder__behavior) 
{
    //  Define IO Ports
    sc_in  <bool> i_a ;
    sc_in  <bool> i_b ;
    sc_in  <bool> i_ci;
    sc_out <bool> o_co;
    sc_out <bool> o_s ;


    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        if ( ! i_a && ! i_b && ! i_ci )  {  o_s = 0;  o_co = 0;  }
        if ( ! i_a && ! i_b &&   i_ci )  {  o_s = 1;  o_co = 0;  }
        if ( ! i_a &&   i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        if ( ! i_a &&   i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a && ! i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        if (   i_a && ! i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a &&   i_b && ! i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a &&   i_b &&   i_ci )  {  o_s = 1;  o_co = 1;  }
    }


    // Constructor
    SC_CTOR(full_adder__behavior) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_a 
                  << i_b 
                  << i_ci
                  ;
    }
};


////////////////////////////////////////////////
//  Component Model - With Half Adders
////////////////////////////////////////////////
SC_MODULE(full_adder__cmpnt) 
{
    //  Define IO Ports
    sc_in  <bool> i_a ;
    sc_in  <bool> i_b ;
    sc_in  <bool> i_ci;
    sc_out <bool> o_co;
    sc_out <bool> o_s ;


    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        if ( ! i_a && ! i_b && ! i_ci )  {  o_s = 0;  o_co = 0;  }
        if ( ! i_a && ! i_b &&   i_ci )  {  o_s = 1;  o_co = 0;  }
        if ( ! i_a &&   i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        if ( ! i_a &&   i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a && ! i_b && ! i_ci )  {  o_s = 1;  o_co = 0;  }
        if (   i_a && ! i_b &&   i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a &&   i_b && ! i_ci )  {  o_s = 0;  o_co = 1;  }
        if (   i_a &&   i_b &&   i_ci )  {  o_s = 1;  o_co = 1;  }
    }


    // Constructor
    SC_CTOR(full_adder__cmpnt) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_a 
                  << i_b 
                  << i_ci
                  ;
    }
};
#endif