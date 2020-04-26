-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULS.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;



entity FMULS_tb is
end entity FMULS_tb;

architecture verify of FMULS_tb is
  
  signal i_rd : unsigned(7 downto 0);
  signal i_rr : unsigned(7 downto 0);
  signal o_r1 : unsigned(7 downto 0);
  signal o_r0 : unsigned(7 downto 0);
 

  
  signal input : std_logic_vector (2 downto 0) := "000"; -- <-- UPDATE !!!!!!!!!!!!!!!!!!!!!



--                       UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--                          |
--                          |
begin--                     V

  duv: entity work.FMULS(behavior)

    -- UPDATE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    port map( 
              i_rd => i_rd,
              i_rr => i_rr,
              o_r1 => o_r1,
              o_r0 => o_r0
            );

  --                                # bits in input -- UPDATE!!!!!!!!!!!!!!!!!!!!!!
  --                                     |
  apply_test_cases : process is --       |
    procedure apply_test --              V
      ( input_test : in std_logic_vector(2 downto 0)) is
    begin 


      i_rd  <= "01001100"; -- .6 
      i_rr  <= "01011001"; -- .7 
      -- 0.011010011011
      -- 0.412841796875
      wait for 1 ms;

      i_rd  <= "10000000";  
      i_rr  <= "10000000";  
      wait for 1 ms;
                       
      i_rd  <= "10000000" ; 
      i_rr  <= "00000000" ;
      wait for 1 ms;
                       
      i_rd  <= "01000000"; 
      i_rr  <= "01000000";
      wait for 1 ms;
                       
      i_rd  <= "00000001"; 
      i_rr  <= "00000001";        
      wait for 1 ms;
                       
      i_rd  <= "01000000";  
      i_rr  <= "11000000";
      wait for 1 ms;





      -- i_as <= to_signed(-15, 5);
      -- i_bs <= to_signed(-15, 5);
      
      -- wait for 1 ms;

      -- i_as <= to_signed(-15, 5);
      -- i_bs <= to_signed(15, 5);
      
      -- wait for 1 ms;
      
      -- i_as <= to_signed(-15, 5);
      -- i_bs <= to_signed(0, 5);
      
      -- wait for 1 ms;      
      
      -- i_as <= to_signed(1, 5);
      -- i_bs <= to_signed(3, 5);
      
      -- wait for 1 ms;      
      
      -- i_as <= to_signed(15, 5);
      -- i_bs <= to_signed(-15, 5);
      
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

    
    
    
    