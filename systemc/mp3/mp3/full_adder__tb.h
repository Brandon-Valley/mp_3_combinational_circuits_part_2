#ifndef full_adder_TB_TEST
#define full_adder_TB_TEST

#include <systemc.h> 

#include<vector>
#include<cmath>

#include "vector_print.h"
#include "system_c_utils.h"

#include "full_adder.h"

using namespace std;



void full_adder__tb()
{
                                        //===============================================================//
    int num_bits_needed_in_sim_vec = 3; // <----- SET THIS TO THE NUMBER OF INPUTS YOU NEED TO SIMULATE 
                                        //===============================================================//        

    //=============================//
    //  Define IO Ports
    //=============================//
    sc_signal <bool> i_a ;
    sc_signal <bool> i_b ;
    sc_signal <bool> i_ci;
    sc_signal <bool> o_co;
    sc_signal <bool> o_s ;


    //=============================//
    //  Select Which Model to Test
    //=============================//
    full_adder__equation DUT("full_adder.h");
    //full_adder__behavior DUT("full_adder.h");


    //=============================//
    //  Port Map
    //=============================//
    DUT.i_a (i_a );
    DUT.i_b (i_b );
    DUT.i_ci(i_ci);
    DUT.o_co(o_co);
    DUT.o_s (o_s );


    // trace file to look at sim output
    sc_trace_file* fp1;  //create VCD file: file pointer fp1
    fp1 = sc_create_vcd_trace_file("wave1");  // open(fp1), create wave1.vcd file


    //=============================//
    //  Add Signals to Trace File
    //=============================//
    sc_trace(fp1, i_a ,  "i_a ");
    sc_trace(fp1, i_b ,  "i_b ");
    sc_trace(fp1, i_ci,  "i_ci");
    sc_trace(fp1, o_co,  "o_co");
    sc_trace(fp1, o_s ,  "o_s ");


    //--------------//
    //  Simulation  //
    //--------------//
    print_sim_header("full_adder");
    double num_combos_to_test = pow(num_bits_needed_in_sim_vec, 2) + 2; // run 2 extra so waveform always ends with all high, then all low

    for (int i = 0; i < pow(3, 2) + 1; i++)
    {
        vector<int> sv = int_to_binary_vec__with_rollover(i, num_bits_needed_in_sim_vec); // simulation vector
        cout << "In full_adder__tb.h, Sim:  i:" << i << "    sv:" << sv << endl;

        //=============================//
        //  Set Inputs      
        //=============================//
        i_a  = sv[0];
        i_b  = sv[1];
        i_ci = sv[2];



        sc_start(10, SC_NS); // run sim for 10 ns
    }

    // last change that wont show on EDA plao_codeground
    sc_close_vcd_trace_file(fp1); // close(fp1)
}
#endif  