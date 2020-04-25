
library ieee;
use ieee.std_logic_1164.all;


entity or4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
end or4_gate;

--------------------------------
-- Equation Model
--------------------------------

architecture equation of or4_gate is
  begin
    o_f <= (i_a or i_b or i_c or i_d);
end architecture equation;


-- --------------------------------
-- -- Behavior Model
-- --------------------------------
-- architecture behavior of or4_gate is
  -- begin

           
    -- o_f <= '1' when i_a = '1' else 
           -- '1' when i_b = '1' else 
           -- '1' when i_c = '1' else 
           -- '1' when i_d = '1' else 
           -- '0';
-- end architecture behavior;



-- --------------------------------
-- -- Component Model
-- --------------------------------
-- architecture cmpnt of or4_gate is
  -- component or2_gate is
    -- port ( i_a : in  std_logic;
           -- i_b : in  std_logic;
           -- o_f : out std_logic);
  -- end component or2_gate;
 
    
  -- -- temp outs for or2_gates
  -- signal f_1_o : std_logic; 
  -- signal f_2_o : std_logic; 
    
  -- begin
    -- or2_gate_1 : or2_gate port map (i_a,   i_b,   f_1_o);
    -- or2_gate_2 : or2_gate port map (i_c,   i_d,   f_2_o);
    -- or2_gate_3 : or2_gate port map (f_1_o, f_2_o, o_f);
-- end architecture cmpnt;
    
    








