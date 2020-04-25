-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__half_adder.do

library ieee;
use ieee.std_logic_1164.all;


entity half_adder is
  port ( 
         i_a     : in  std_logic;
         i_b     : in  std_logic;
         o_s     : out std_logic;
         o_carry : out std_logic
       );
end half_adder;



architecture behavior of half_adder is
  begin
  
  o_s     <= i_a xor i_b; 
  o_carry <= i_a and i_b; 
  
  end architecture behavior;
    
    
