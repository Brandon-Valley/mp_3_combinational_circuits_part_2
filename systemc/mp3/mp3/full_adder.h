#ifndef full_adder_gate_H
#define full_adder_gate_H

#include "systemc.h"

using namespace std;



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
        //if      (i_code.read() == "00") o_code = "1110";
        //else if (i_code.read() == "01") o_code = "1101";
        //else if (i_code.read() == "10") o_code = "1011";
        //else                            o_code = "0111";
        
        //o_co = 1;
        //o_s  = 0;

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

#endif