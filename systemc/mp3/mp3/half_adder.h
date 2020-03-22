#ifndef half_adder_gate_H
#define half_adder_gate_H

#include "systemc.h"

using namespace std;


/////////////////////////////////////////////////
//  Equation Model
////////////////////////////////////////////////
SC_MODULE(half_adder) 
{
    //  Define IO Ports
    sc_in  <bool> i_a ;
    sc_in  <bool> i_b ;
    sc_out <bool> o_co;
    sc_out <bool> o_s ;


    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        o_s.write((i_a.read() ^ i_b.read()));
        o_co.write((i_a.read() & i_b.read()));
    }


    // Constructor
    SC_CTOR(half_adder__equation) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_a 
                  << i_b 
                  ;
    }
};


#endif