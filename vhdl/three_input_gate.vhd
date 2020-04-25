-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate.do

library ieee;
use ieee.std_logic_1164.all;


entity three_input_gate is
  port ( i_code : in  std_logic_vector(7 downto 0);
         o_code : out std_logic_vector(2 downto 0));
end three_input_gate;



----------------------------
-- Component Model
----------------------------
architecture cmpnt of three_input_gate is

  component priority_enc_4_2 is
  port ( 
           i_code : in  std_logic_vector(3 downto 0);
           o_code : out std_logic_vector(1 downto 0);
           o_valid: out std_logic);
  end component priority_enc_4_2;

  component MUX_2_1 is
  port ( 
         i_code : in  std_logic_vector(1 downto 0);
         i_sel  : in  std_logic;
         o_f    : out std_logic);
  end component MUX_2_1;
    
  component priority_enc_2_1 is
  port ( 
         i_code : in  std_logic_vector(1 downto 0);
         o_f    : out std_logic);
  end component priority_enc_2_1;
    
    
 
  -- temp outs
  signal f0_code : std_logic_vector(1 downto 0); 
  signal f0_v    : std_logic; 
  signal f1_code : std_logic_vector(1 downto 0); 
  signal f1_v    : std_logic; 
  
  -- signal not_f0_v     : std_logic := '1';
  signal not_f0_v     : std_logic;
  signal MUX_0_i_code : std_logic_vector(1 downto 0);
  signal MUX_1_i_code : std_logic_vector(1 downto 0);
  signal pe21_i_code  : std_logic_vector(1 downto 0);
  
       
  begin
    MUX_0_i_code <= (f1_code(0), f0_code(0));
    MUX_1_i_code <= (f1_code(1), f0_code(1));
    not_f0_v     <= NOT f0_v;
    pe21_i_code  <= (f1_v, f0_v);
  
    priorityenc420 : priority_enc_4_2 port map (i_code(3 downto 0), f0_code, f0_v);
    priorityenc421 : priority_enc_4_2 port map (i_code(7 downto 4), f1_code, f1_v);
    

    MUX210 : MUX_2_1 port map (MUX_0_i_code, not_f0_v, o_code(0));
    MUX211 : MUX_2_1 port map (MUX_1_i_code, not_f0_v, o_code(1));

    priority_enc210 : priority_enc_2_1 port map (pe21_i_code, o_code(2));
    end architecture cmpnt;
    
    






