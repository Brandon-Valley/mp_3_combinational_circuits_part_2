-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULS.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FMULS is
  port ( 
         i_rd : in  unsigned(7 downto 0);
         i_rr : in  unsigned(7 downto 0);
         o_r1 : out unsigned(7 downto 0);
         o_r0 : out unsigned(7 downto 0)
       );
end FMULS;

------------------------
-- Behavior Model
------------------------
architecture behavior of FMULS is
  signal r_i : unsigned (15 downto 0) := "ZZZZZZZZZZZZZZZZ";



  begin
  
  r_i <=  i_rd * i_rr;


  o_r1 <= r_i(14 downto 7);
  o_r0 <= r_i(6 downto 0) & '0';

  end architecture behavior;
    
    









