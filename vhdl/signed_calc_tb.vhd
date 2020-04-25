-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;



entity signed_calc_tb is
end entity signed_calc_tb;

architecture verify of signed_calc_tb is
  
  signal i_as : signed(4 downto 0);  
  signal i_bs : signed(4 downto 0);  
  signal o_fs : signed(8 downto 0);

  
  signal input : std_logic_vector (2 downto 0) := "000"; -- <-- UPDATE !!!!!!!!!!!!!!!!!!!!!



--                                 UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--                                    |
--                                    |
begin--                               V
  duv: entity work.signed_calc(cmpnt) 
  -- duv: entity work.signed_calc(equation) 
  -- duv: entity work.signed_calc(behavior)

    -- UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    port map( 
              i_as => i_as,
              i_bs => i_bs,
              o_fs => o_fs
            );

  --                                # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                                     |
  apply_test_cases : process is --       |
    procedure apply_test --              V
      ( input_test : in std_logic_vector(2 downto 0)) is
    begin 

      i_as <= to_signed(-15, 5);
      i_bs <= to_signed(-15, 5);
      
      wait for 1 ms;

      i_as <= to_signed(-15, 5);
      i_bs <= to_signed(15, 5);
      
      wait for 1 ms;
      
      i_as <= to_signed(-15, 5);
      i_bs <= to_signed(0, 5);
      
      wait for 1 ms;      
      
      i_as <= to_signed(1, 5);
      i_bs <= to_signed(3, 5);
      
      wait for 1 ms;      
      
      i_as <= to_signed(15, 5);
      i_bs <= to_signed(-15, 5);
      
      wait for 1 ms;           
      
      -- i_as <= to_signed(-15);
      -- i_bs <= to_signed(-15);
      
      -- wait for 1 ms;
          

      -- i_as <= to_signed(-15);
      -- i_bs <= -15;
      
      -- wait for 1 ms;
      -- i_as <= -15;
      -- i_bs <= -15;
      
      -- wait for 1 ms;
      
      -- i_as <= -15;
      -- i_bs <= -15;
      
      -- wait for 1 ms;      
      
    end procedure apply_test;
    
    
    
  begin
              -- -- # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
                     -- -- |
                     -- -- |
                     -- -- V
    -- for i in 0 to (2 ** 3) + 2 loop
      -- apply_test(input);

      -- -- wait for 1 ms;

      -- input <= input + "001"; -- <-- must have same # bits as input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
    -- end loop;
    
    apply_test(input);


    wait;
end process apply_test_cases;

end architecture verify;

    
    
    
    