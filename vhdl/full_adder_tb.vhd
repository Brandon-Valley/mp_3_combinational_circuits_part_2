-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__full_adder.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity full_adder_tb is
end entity full_adder_tb;

architecture verify of full_adder_tb is
  
  signal i_a     : std_logic;
  signal i_b     : std_logic;
  signal i_carry : std_logic;
  signal o_s     : std_logic;
  signal o_carry : std_logic;
  

  
  signal input : std_logic_vector (2 downto 0) := "000"; -- <-- UPDATE !!!!!!!!!!!!!!!!!!!!!



--                                 UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--                                    |
--                                    |
begin--                               V
  duv: entity work.full_adder(cmpnt) 
  -- duv: entity work.full_adder(equation) 
  -- duv: entity work.full_adder(behavior)

    -- UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    port map( 
              i_a     => i_a    ,
              i_b     => i_b    ,
              i_carry => i_carry,
              o_s     => o_s    ,
              o_carry => o_carry
            );

  --                                # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                                     |
  apply_test_cases : process is --       |
    procedure apply_test --              V
      ( input_test : in std_logic_vector(2 downto 0)) is
    begin 

      i_a     <= input(0);
      i_b     <= input(1);
      i_carry <= input(2);
          
      
      wait for 1 ms;
    end procedure apply_test;
    
    
    
  begin
  --             # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                    |
  --                    |
  --                    V
    for i in 0 to (2 ** 3) + 2 loop
      apply_test(input);

      -- wait for 1 ms;

      input <= input + "001"; -- <-- must have same # bits as input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
    end loop;

    
    wait;
end process apply_test_cases;

end architecture verify;

    
    
    
    