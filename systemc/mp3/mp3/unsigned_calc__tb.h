#ifndef unsigned_calc_TB_TEST
#define unsigned_calc_TB_TEST

#include <systemc.h> 

#include<vector>
#include<cmath>

#include "vector_print.h"
#include "system_c_utils.h"

#include "unsigned_calc.h"

using namespace std;



void unsigned_calc__tb()
{
                                        //===============================================================//
    int num_bits_needed_in_sim_vec = 3; // <----- SET THIS TO THE NUMBER OF INPUTS YOU NEED TO SIMULATE 
                                        //===============================================================//        

    //=============================//
    //  Define IO Ports
    //=============================//
    sc_signal <sc_uint<4>> i_au ;
    sc_signal <sc_uint<4>> i_bu ;
    sc_signal <sc_uint<4>> i_cu ;
    sc_signal <sc_int<9>> o_fu ;
    


    //=============================//
    //  Select Which Model to Test
    //=============================//
    unsigned_calc__cmpnt DUT("unsigned_calc.h");
    //unsigned_calc__behavior DUT("unsigned_calc.h");
    
    //unsigned_calc__cmpnt DUT("unsigned_calc.h");


    //=============================//
    //  Port Map
    //=============================//
    DUT.i_au(i_au);
    DUT.i_bu(i_bu);
    DUT.i_cu(i_cu);
    DUT.o_fu(o_fu);


    // trace file to look at sim output
    sc_trace_file* fp1;  //create VCD file: file pointer fp1
    fp1 = sc_create_vcd_trace_file("wave1");  // open(fp1), create wave1.vcd file


    //=============================//
    //  Add Signals to Trace File
    //=============================//
    sc_trace(fp1, i_au,  "i_au");
    sc_trace(fp1, i_bu,  "i_bu");
    sc_trace(fp1, i_cu,  "i_cu");
    sc_trace(fp1, o_fu,  "o_fu");


    //--------------//
    //  Simulation  //
    //--------------//
    print_sim_header("unsigned_calc");
    double num_combos_to_test = pow(num_bits_needed_in_sim_vec, 2) + 2; // run 2 extra so waveform always ends with all high, then all low

    //for (int i = 0; i < pow(3, 2) + 1; i++)
    //{
    //    vector<int> sv = int_to_binary_vec__with_rollover(i, num_bits_needed_in_sim_vec); // simulation vector
    //    cout << "In unsigned_calc__tb.h, Sim:  i:" << i << "    sv:" << sv << endl;

    //    //=============================//
    //    //  Set Inputs      
    //    //=============================//
    //    i_a  = sv[0];
    //    i_b  = sv[1];
    //    i_ci = sv[2];



    //    sc_start(10, SC_NS); // run sim for 10 ns
    ////}



    //i_au.write(15);
    //i_bu.write(15);
    //i_cu.write(15);
    //sc_start(10, SC_NS); // run sim for 10 ns

    //i_au.write(15);
    //i_bu.write(0);
    //i_cu.write(15);
    //sc_start(10, SC_NS); // run sim for 10 ns

    //i_au.write(0);
    //i_bu.write(0);
    //i_cu.write(0);
    //sc_start(10, SC_NS); // run sim for 10 ns

    //i_au.write(1);
    //i_bu.write(2);
    //i_cu.write(3);
    //sc_start(10, SC_NS); // run sim for 10 ns
    //



    //// last one does not show up in wave
    //i_au.write(0);
    //i_bu.write(0);
    //i_cu.write(0);
    //sc_start(10, SC_NS); // run sim for 10 ns    //}



    i_au.write(0);
    i_bu.write(0);
    i_cu.write(0);
    sc_start(10, SC_NS); // run sim for 10 ns

    i_au.write(15);
    i_bu.write(15);
    i_cu.write(15);
    sc_start(10, SC_NS); // run sim for 10 ns

    i_au.write(15);
    i_bu.write(0);
    i_cu.write(15);
    sc_start(10, SC_NS); // run sim for 10 ns

    i_au.write(1);
    i_bu.write(2);
    i_cu.write(3);
    sc_start(10, SC_NS); // run sim for 10 ns

    i_au.write(0);
    i_bu.write(15);
    i_cu.write(0);
    sc_start(10, SC_NS); // run sim for 10 ns
    



    // last one does not show up in wave
    i_au.write(0);
    i_bu.write(0);
    i_cu.write(0);
    sc_start(10, SC_NS); // run sim for 10 ns




    // last change that wont show on EDA plao_codeground
    sc_close_vcd_trace_file(fp1); // close(fp1)
}
#endif  