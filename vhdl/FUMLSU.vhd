-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__FMULSU.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity FMULSU is
  port ( 
         i_rd : in  signed(7 downto 0);
         i_rr : in  unsigned(7 downto 0);
         o_r1 : out signed(7 downto 0);
         o_r0 : out signed(7 downto 0)
       );
end FMULSU;

------------------------
-- Behavior Model
------------------------
architecture behavior of FMULSU is
  -- signal r_i : signed (15 downto 0) := "ZZZZZZZZZZZZZZZZ";

  signal rd_2s_comp : unsigned (7 downto 0) := "ZZZZZZZZ";

  signal r_i : signed (15 downto 0) := "ZZZZZZZZZZZZZZZZ";
                                    
                                    
  -- o_f <= '0' when (i_a = '1' and 
                     -- i_b = '1' and 
                     -- i_c = '1' and 
                     -- i_d = '1')
               -- else
           -- '1';


  begin
  
  rd_2s_comp <= ( not i_rd) + "00000001";
  
  
  -- signal r_i : signed (15 downto 0) := not i_rd(7) ? i_rd * i_rr :        -- if i_rd positive, just multiply like normal
                                    -- 0 - (rd_2s_comp * i_rr);  -- else multiply by i_rd's 2's comp
                                    
  r_i <= i_rd * i_rr when not i_rd(7) -- if i_rd positive, just multiply like normal
                     else resize("0000000000000000" - (rd_2s_comp * i_rr), 16);  -- else multiply by i_rd's 2's comp
  
  
  
  
  -- r_i <=  i_rd * i_rr;


  -- o_r1 <= r_i(14 downto 7);
  -- o_r0 <= r_i(6 downto 0) & '0';
  
  o_r1 <= "10010101";
  o_r0 <= "10010101";


  end architecture behavior;
    
    









