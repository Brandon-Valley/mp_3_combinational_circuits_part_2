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
  begin
  
  -- o_fs <= resize((6 * i_as) - (11 * i_bs), 9);
  o_r1 <= "00100101";
  o_r0 <= "00100101";

  end architecture behavior;
    
    









