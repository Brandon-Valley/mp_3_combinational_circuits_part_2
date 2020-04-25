-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__full_adder.do

library ieee;
use ieee.std_logic_1164.all;


entity full_adder is
  port ( 
         a      : in  std_logic;
         b      : in  std_logic;
         c      : in  std_logic;
         i_code : in  std_logic_vector(1 downto 0);
         o_f    : out std_logic
       );
end full_adder;



------------------------
-- Behavior Model
------------------------
architecture behavior of full_adder is
  begin
  o_f <=      a xor b xor c  when i_code = "00" else
         not (a and b and c) when i_code = "01" else
         not (a or  b or  c) when i_code = "10" else
         ( not a  and   not b  and   not c)  or  ( not a  and  b  and  c)  or  (a  and   not b  and  c)  or  (a  and  b  and   not c);
         -- '1';
           
  -- o_f <= a;

  end architecture behavior;
    
    


----------------------------
-- Component Model
----------------------------
architecture cmpnt of full_adder is

  component nand4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
  end component nand4_gate;
  
  component or4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
  end component or4_gate;
  
  component xor4_gate is
  port ( i_a : in  std_logic;
         i_b : in  std_logic;
         i_c : in  std_logic;
         i_d : in  std_logic;
         o_f : out std_logic);
  end component xor4_gate;
  
  component not1_gate is
  port ( i_a : in  std_logic;
         o_f : out std_logic);
  end component not1_gate;
  
  component MUX_4_1 is
  port ( 
        i_en       : in  std_logic;
        i_code     : in  std_logic_vector(3 downto 0);
        i_sel_code : in  std_logic_vector(1 downto 0);
        o_f        : out std_logic);
         
  end component MUX_4_1;
    
    
 
  -- temp outs
  signal xor_f  : std_logic;
  signal nand_f : std_logic;
  signal nor_f  : std_logic;
  signal xnor_f : std_logic;
  
  signal nor_or_f   : std_logic; -- OR4 output befor NOT output for NOR
  signal xnor_xor_f : std_logic; -- XOR outup befor NOT output for XNOR
  
  -- signal mux_i_code : std_logic_vector(3 downto 0) := xor_f & nand_f & nor_or_f & xnor_xor_f;
  signal mux_i_code : std_logic_vector(3 downto 0) := xnor_f & nor_f & nand_f & xor_f;

  
       
  begin
    -- MUX_0_i_code <= (f1_code(0), f0_code(0));
    -- MUX_1_i_code <= (f1_code(1), f0_code(1));
    -- not_f0_v     <= NOT f0_v;
    -- pe21_i_code  <= (f1_v, f0_v);
  
    -- XOR3
    XOR4_0  : xor4_gate  port map ('0', a, b, c, xor_f);  
    
    -- NAND3
    NAND4_0 : nand4_gate port map ('1', a, b, c, nand_f);       
    
    -- NOR3
    OR4_1  : or4_gate  port map ('0', a, b, c, nor_or_f);    
    NOT1_1  : not1_gate  port map (nor_or_f, nor_f);    

    -- XNOR3            
    XOR4_2  : xor4_gate  port map ('0', a, b, c, xnor_xor_f);
    NOT1_2  : not1_gate  port map (xnor_xor_f, xnor_f);  
    
    -- full_adder
    mux_i_code <= xnor_f & nor_f & nand_f & xor_f;
    MUX_4_1_0 : MUX_4_1  port map ('1', mux_i_code, i_code, o_f);    

  end architecture cmpnt;
    
    






