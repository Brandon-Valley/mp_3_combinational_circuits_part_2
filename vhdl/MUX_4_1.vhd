-- python C:\Users\BrANDon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__MUX_4_1_2_bit.do
library ieee;
use ieee.std_logic_1164.all;

entity MUX_4_1 is
  port ( 
        i_en       : in  std_logic;
        i_code     : in  std_logic_vector(3 downto 0);
        i_sel_code : in  std_logic_vector(1 downto 0);
        o_f        : out std_logic);
       
end MUX_4_1;



architecture equation of MUX_4_1 is
  begin
  
  o_f <= 'Z' when  i_en = '0' else
         '1' when  (i_sel_code = "00" and i_code(0) = '1') or 
                   (i_sel_code = "01" and i_code(1) = '1') or 
                   (i_sel_code = "10" and i_code(2) = '1') or 
                   (i_sel_code = "11" and i_code(3) = '1') else '0';
                   
  
    
    
end architecture equation;


    




