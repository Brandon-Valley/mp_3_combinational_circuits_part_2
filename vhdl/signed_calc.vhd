-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc.do

library ieee;
use ieee.std_logic_1164.all;


entity signed_calc is
  port ( 
         i_a     : in  std_logic;
         i_b     : in  std_logic;
         i_carry : in  std_logic;
         o_s     : out  std_logic;
         o_carry : out std_logic
       );
end signed_calc;



------------------------
-- Equation Model
------------------------
architecture equation of signed_calc is
  begin
           
  o_s     <= i_a xor i_b xor i_carry;
  o_carry <= ((i_a xor i_b) and i_carry) or (i_a and i_b); 

  end architecture equation;





------------------------
-- Behavior Model
------------------------
architecture behavior of signed_calc is
  begin

  o_s     <= '0' when  ( (not i_a = '1')  and  (not i_b = '1')  and  (not i_carry = '1') )   else
             '1' when  ( (not i_a = '1')  and  (not i_b = '1')  and  (    i_carry = '1') )   else
             '1' when  ( (not i_a = '1')  and  (    i_b = '1')  and  (not i_carry = '1') )   else
             '0' when  ( (not i_a = '1')  and  (    i_b = '1')  and  (    i_carry = '1') )   else
             '1' when  ( (    i_a = '1')  and  (not i_b = '1')  and  (not i_carry = '1') )   else
             '0' when  ( (    i_a = '1')  and  (not i_b = '1')  and  (    i_carry = '1') )   else
             '0' when  ( (    i_a = '1')  and  (    i_b = '1')  and  (not i_carry = '1') )   else
             '1' when  ( (    i_a = '1')  and  (    i_b = '1')  and  (    i_carry = '1') )   else '0'; 
   
  o_carry <= '0' when not i_a = '1' and not i_b = '1'  and not i_carry = '1'  else
             '0' when not i_a = '1' and not i_b = '1'  and     i_carry = '1'  else
             '0' when not i_a = '1' and     i_b = '1'  and not i_carry = '1'  else
             '1' when not i_a = '1' and     i_b = '1'  and     i_carry = '1'  else
             '0' when     i_a = '1' and not i_b = '1'  and not i_carry = '1'  else
             '1' when     i_a = '1' and not i_b = '1'  and     i_carry = '1'  else
             '1' when     i_a = '1' and     i_b = '1'  and not i_carry = '1'  else
             '1' when     i_a = '1' and     i_b = '1'  and     i_carry = '1'  else '0';

  end architecture behavior;
    
    


----------------------------
-- Component Model
----------------------------
architecture cmpnt of signed_calc is

  component half_adder is
  port ( 
         i_a     : in  std_logic;
         i_b     : in  std_logic;
         o_s     : out std_logic;
         o_carry : out std_logic
       );
  end component half_adder;
  
    
 
  -- temp outs
  signal ha_1_co : std_logic;
  signal ha_1_s  : std_logic;
  signal ha_2_co : std_logic;
  
       
  begin
  
    ha0  : half_adder  port map (i_a   , i_b    , ha_1_s, ha_1_co);  
    ha1  : half_adder  port map (ha_1_s, i_carry, o_s, ha_2_co );  

    o_carry <= ha_1_co or ha_2_co;    

  end architecture cmpnt;
    
    






