-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMUL.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FMUL is
  port ( 
         i_rd : in  unsigned(7 downto 0);
         i_rr : in  unsigned(7 downto 0);
         o_r1 : out unsigned(7 downto 0);
         o_r0 : out unsigned(7 downto 0)
       );
end FMUL;

------------------------
-- Behavior Model
------------------------
architecture behavior of FMUL is
  signal r_i : unsigned (15 downto 0) := "ZZZZZZZZZZZZZZZZ";
  -- signal r_i : unsigned (15 downto 0) := i_rd * i_rr;


  begin
  
  r_i <=  i_rd * i_rr;
  
  -- o_fs <= resize((6 * i_as) - (11 * i_bs), 9);
  -- o_r1 <= "00100101";
  -- o_r0 <= "00100101";
  
  
  -- signal r_i : unsigned (15 downto 0) := resize(i_rd * i_rr, 16);

  o_r1 <= r_i(14 downto 7);
  o_r0 <= r_i(6 downto 0) & '0';

  end architecture behavior;
    
    









