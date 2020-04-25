
library ieee;
use ieee.std_logic_1164.all;


entity xor4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
end xor4_gate;


--------------------------------
-- Equation Model
--------------------------------

architecture equation of xor4_gate is
  begin
    o_f <= (i_a xor i_b) xor ( i_c xor i_d);
end architecture equation;


-- ----------------------------
-- -- Behavior Model
-- ----------------------------
-- architecture behavior of xor4_gate is
  -- begin
    -- o_f <= '1' when (i_a = '0' and i_b = '0' and i_c = '0' and i_d = '1') else
           -- '1' when (i_a = '0' and i_b = '0' and i_c = '1' and i_d = '0') else
           -- '1' when (i_a = '0' and i_b = '1' and i_c = '0' and i_d = '0') else
           -- '1' when (i_a = '1' and i_b = '0' and i_c = '0' and i_d = '0') else
           -- '1' when (i_a = '0' and i_b = '1' and i_c = '1' and i_d = '1') else
           -- '1' when (i_a = '1' and i_b = '0' and i_c = '1' and i_d = '1') else
           -- '1' when (i_a = '1' and i_b = '1' and i_c = '0' and i_d = '1') else
           -- '1' when (i_a = '1' and i_b = '1' and i_c = '1' and i_d = '0') else
           -- '0';
-- end architecture behavior;


-- --------------------------------
-- -- Component Model - made of primative gates
-- --------------------------------
-- architecture cmpnt of xor4_gate is
  -- component xor2_gate is
    -- port ( i_a : in  std_logic;
           -- i_b : in  std_logic;
           -- o_f : out std_logic);
  -- end component xor2_gate;
    
  -- signal f_1_o : std_logic; 
  -- signal f_2_o : std_logic; 
    
  -- begin
    -- xor2_gate_1 : xor2_gate port map (i_a,   i_b,   f_1_o);
    -- xor2_gate_2 : xor2_gate port map (i_c,   i_d,   f_2_o);
    -- xor2_gate_3 : xor2_gate port map (f_1_o, f_2_o, o_f);
-- end architecture cmpnt;
    
    








