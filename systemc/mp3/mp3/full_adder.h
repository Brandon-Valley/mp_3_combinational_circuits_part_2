#ifndef full_adder_gate_H
#define full_adder_gate_H

#include "systemc.h"

using namespace std;



SC_MODULE(full_adder__behavior) 
{
    //  Define IO Ports
    sc_in  <sc_lv<2>> i_code;
    sc_out <sc_lv<4>> o_code;


    // Architecture Statement - Similar to Process Statement
    void p1()
    {
        if      (i_code.read() == "00") o_code = "1110";
        else if (i_code.read() == "01") o_code = "1101";
        else if (i_code.read() == "10") o_code = "1011";
        else                            o_code = "0111";
    }


    // Constructor
    SC_CTOR(full_adder__behavior) 
    {
        SC_METHOD(p1);

        //  Input Sensitivity List
        sensitive << i_code
                  << o_code
                  ;
    }
};

#endif