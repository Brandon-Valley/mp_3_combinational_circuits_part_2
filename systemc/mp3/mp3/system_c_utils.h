#ifndef TB_UTILS_H
#define TB_UTILS_H

#include<vector>
#include<cmath>

#include "vector_print.h"

using namespace std;





// function to print number of 
// digits 
int findNumberOfDigits(long n, int base)
{
    // Calculating log using base 
    // changing property and then 
    // taking it floor and then  
    // adding 1. 
    int dig = (int)(floor(log(n) /
        log(base)) + 1);

    //// printing output 
    //cout << "The Number of digits of "
    //    << "Number " << n << " in base "
    //    << base << " is " << dig;
    return dig;
}


// Given an int, returns a vector of ints (1 or 0) of the given int in binary, with the given number of bits
// if you give an int of 1, the 1 will be in the 0th index of the returned vector
std::vector<int> int_to_binary_vec(int num_to_convert_to_binary, int num_bits_in_out_vec)
{
    std::vector<int> r;

    // make binary vec of minimum size backwards (LSB at .end() and MSB at .begin())
    while (num_to_convert_to_binary > 0)
    {
        //cout << " top of loop" << endl;
        if (num_to_convert_to_binary % 2 == 0)
            r.push_back(0);
        else
            r.push_back(1);
        num_to_convert_to_binary = num_to_convert_to_binary / 2;
    }

    while (int(r.size()) < num_bits_in_out_vec)
        r.push_back(0);

    return r;
}



vector<int> int_to_binary_vec__with_rollover(int num_to_convert_to_binary, int num_bits_in_out_vec)
{
    int num_digits_needed = findNumberOfDigits(num_to_convert_to_binary, 2); // base 2 for binary
    
    if (num_digits_needed > num_bits_in_out_vec)
    {
        int largest_num_that_can_be_represented_by__num_bits_in_out_vec = int(pow(2, num_bits_in_out_vec) - 1);
        num_to_convert_to_binary = num_to_convert_to_binary - largest_num_that_can_be_represented_by__num_bits_in_out_vec - 1;
    }

    return int_to_binary_vec(num_to_convert_to_binary, num_bits_in_out_vec);
}



void print_model_not_found_error(const string module_name, const string model)
{
    cout << endl << "  ERROR:  MODEL from _tb_master.h not recognized by " << module_name << ".h    MODEL:  " << model << endl;
    cout         << "          Possible reasons for this error:"                                                       << endl;
    cout         << "               1.)  You haven't added this model to " << module_name << ".h"                      << endl;
    cout         << "               2.)  You mislabeled this model in "    << module_name << ".h"                      << endl;
    cout         << "               3.)  You put in the wrong model for "  << module_name << " in _tb_master.h"        << endl << endl;
}



void print_sim_header(const string module_name)
{
    cout << "[ ==========================  Simulation Begin For " << module_name << "  ========================== ]" << endl;
    cout << "\n\n\n\n\n\n\n";
}


#endif



//#include <iostream>
//// uncomment to disable assert()
//// #define NDEBUG
//#include <cassert>
//
//// Use (void) to silent unused warnings.
//#define assertm(exp, msg) assert(((void)msg, exp))
//
//int main()
//{
//    assert(2+2==4);
//    std::cout << "Execution continues past the first assert\n";
//    assertm(2+2==5, "There are five lights");
//    std::cout << "Execution continues past the second assert\n";
//}