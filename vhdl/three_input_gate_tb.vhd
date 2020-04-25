-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity three_input_gate_tb is
end entity three_input_gate_tb;

architecture verify of three_input_gate_tb is
  
  signal a      : std_logic;                   
  signal b      : std_logic;                   
  signal c      : std_logic;                   
  signal i_code : std_logic_vector(1 downto 0);
  signal o_f    : std_logic;
  
  
  -- signal i_code : std_logic_vector(7 downto 0);
  -- signal o_code : std_logic_vector(2 downto 0);
  
  signal input : std_logic_vector (4 downto 0) := "00000"; -- <-- UPDATE !!!!!!!!!!!!!!!!!!!!!



--                                 UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--                                    |
--                                    |
begin--                               V
  duv: entity work.three_input_gate(cmpnt) 
  -- duv: entity work.three_input_gate(behavior)

    port map( 
              a      => a     ,
              b      => b     ,
              c      => c     ,
              i_code => i_code,
              o_f    => o_f   
            );

  --                                # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                                     |
  apply_test_cases : process is --       |
    procedure apply_test --              V
      ( input_test : in std_logic_vector(4 downto 0)) is
    begin 

      a         <= input(0);
      b         <= input(1);
      c         <= input(2);
      i_code(0) <= input(3);      
      i_code(1) <= input(4);           
      
      wait for 1 ms;
    end procedure apply_test;
    
    
    
  begin
  --      (2 ** (# bits in input)) + 2 -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                    |
  --                    |
  --                    V
    -- for i in 0 to (2 ** 5) + 2 loop
    for i in 0 to 34 loop
      apply_test(input);

      -- wait for 1 ms;

      input <= input + "00001"; -- <-- must have same # bits as input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
    end loop;

    
    wait;
end process apply_test_cases;

end architecture verify;

    
    
    
    