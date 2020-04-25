
library ieee;
use ieee.std_logic_1164.all;


entity not1_gate is
  port ( i_a : in  std_logic;
         o_f : out std_logic);
end not1_gate;

architecture equation of not1_gate is
  begin
    o_f <= not i_a;
end equation;




