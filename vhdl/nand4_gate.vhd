
library ieee;
use ieee.std_logic_1164.all;


entity nand4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
end nand4_gate;


----------------------------
-- Equation Model
----------------------------

architecture equation of nand4_gate is
  begin
    o_f <= not (i_a and i_b and i_c and i_d);
end architecture equation;



-- --------------------------------
-- -- Behavior Model
-- --------------------------------
-- architecture behavior of nand4_gate is
  -- begin
    -- o_f <= '0' when (i_a = '1' and 
                     -- i_b = '1' and 
                     -- i_c = '1' and 
                     -- i_d = '1')
               -- else
           -- '1';
-- end architecture behavior;



-- ----------------------------
-- -- Component Model - Primitive
-- ----------------------------
-- architecture cmpnt_prim of nand4_gate is
  -- component and2_gate is
    -- port ( i_a : in  std_logic;
           -- i_b : in  std_logic;
           -- o_f : out std_logic);
  -- end component and2_gate;
    
  -- component not1_gate is
    -- port ( i_a : in  std_logic;
           -- o_f : out std_logic);
  -- end component not1_gate;
    
  -- -- temp outs for and2_gates
  -- signal f_1_o : std_logic; 
  -- signal f_2_o : std_logic; 
  -- signal f_3_o : std_logic; 
    
  -- begin
    -- and2_gate_1 : and2_gate port map (i_a,   i_b,   f_1_o);
    -- and2_gate_2 : and2_gate port map (i_c,   i_d,   f_2_o);
    -- and2_gate_3 : and2_gate port map (f_1_o, f_2_o, f_3_o);
    -- not1_gate_1 : not1_gate port map (f_3_o, o_f);
-- end architecture cmpnt_prim;
    
    
-- --------------------------------
-- -- Component Model - 2 Input Self
-- --------------------------------
-- architecture cmpnt_self of nand4_gate is
  -- component nand2_gate is
    -- port ( i_a : in  std_logic;
           -- i_b : in  std_logic;
           -- o_f : out std_logic);
  -- end component nand2_gate;
    
  -- -- temp outs for and2_gates
  -- signal f_1_o : std_logic; 
  -- signal f_2_o : std_logic; 
  -- signal f_3_o : std_logic; 
  -- signal f_4_o : std_logic; 
    
  -- begin
    -- nand2_gate_1 : nand2_gate port map (i_a,   i_b,   f_1_o);
    -- nand2_gate_2 : nand2_gate port map (f_1_o, f_1_o, f_2_o); -- NOT
    -- nand2_gate_3 : nand2_gate port map (i_c,   i_d,   f_3_o);
    -- nand2_gate_4 : nand2_gate port map (f_3_o, f_3_o, f_4_o); -- NOT
    -- nand2_gate_5 : nand2_gate port map (f_2_o, f_4_o, o_f);
-- end architecture cmpnt_self;
    








