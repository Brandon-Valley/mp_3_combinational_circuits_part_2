-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__three_input_gate.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity three_input_gate_tb is
end entity three_input_gate_tb;

architecture verify of three_input_gate_tb is
  
  signal i_code : std_logic_vector(7 downto 0);
  signal o_code : std_logic_vector(2 downto 0);
  
  signal input : std_logic_vector (7 downto 0) := "00000000";


begin
  duv: entity work.three_input_gate(cmpnt)

    port map( 
              i_code => i_code,
              o_code => o_code);

  apply_test_cases : process is
    procedure apply_test
      ( input_test : in std_logic_vector(7 downto 0)) is
    begin 

      i_code(0) <= input(0);
      i_code(1) <= input(1);
      i_code(2) <= input(2);
      i_code(3) <= input(3);      
      i_code(4) <= input(4);      
      i_code(5) <= input(5);      
      i_code(6) <= input(6);      
      i_code(7) <= input(7);      
      
      wait for 1 ms;
    end procedure apply_test;
    
    
    
  begin
    for i in 0 to 18 loop
      apply_test(input);

      -- wait for 1 ms;

      input <= input + "00000001";
    end loop;

    
    wait;
end process apply_test_cases;

end architecture verify;

    
    
    
    