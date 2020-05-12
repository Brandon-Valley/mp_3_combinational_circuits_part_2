-- python C:\Users\Brandon\Documents\Personal_Projects\my_utils\modelsim_utils\auto_run.py -d run_cmd__signed_calc.do

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity signed_calc is
  port ( 
         i_as : in  signed(4 downto 0);
         i_bs : in  signed(4 downto 0);
         o_fs : out signed(8 downto 0)
       );
end signed_calc;

------------------------
-- Behavior Model
------------------------
architecture behavior of signed_calc is
  begin
  
  o_fs <= resize((6 * i_as) - (11 * i_bs), 9);

  end architecture behavior;
    
    
    
    
----------------------------
-- Component Model
----------------------------
architecture cmpnt of signed_calc is

  component full_adder is
  port ( 
         i_a     : in  std_logic;
         i_b     : in  std_logic;
         i_carry : in  std_logic;
         o_s     : out std_logic;
         o_carry : out std_logic
       );
  end component full_adder;
  
    
 
  -- temp outs
  -- signal ha_1_co : std_logic;
  -- signal ha_1_s  : std_logic;
  -- signal ha_2_co : std_logic;
  
  
    -- 6X = 2X + 4X
  signal as6         : signed (8 downto 0); 
  signal sum_6x_co_0 : std_logic;
  signal sum_6x_co_1 : std_logic;
  signal sum_6x_co_2 : std_logic;
  signal sum_6x_co_3 : std_logic;
  signal sum_6x_co_4 : std_logic;
  signal sum_6x_co_5 : std_logic;
  signal sum_6x_co_6 : std_logic;
  signal sum_6x_co_7 : std_logic;
  signal unused_0    : std_logic;
  
  
  
  
  
  
  
    -- 2Y + 8Y = 10Y 
  signal bs10         : signed (8 downto 0);    
  signal sum_10y_co_0 : std_logic;
  signal sum_10y_co_1 : std_logic;
  signal sum_10y_co_2 : std_logic;
  signal sum_10y_co_3 : std_logic;
  signal sum_10y_co_4 : std_logic;
  signal sum_10y_co_5 : std_logic;
  signal sum_10y_co_6 : std_logic;
  signal sum_10y_co_7 : std_logic;
  signal unused_1     : std_logic;
  
  -- Y + 10Y = 11Y
  signal bs11         : signed (8 downto 0);    
  signal sum_11y_co_0 : std_logic;
  signal sum_11y_co_1 : std_logic;
  signal sum_11y_co_2 : std_logic;
  signal sum_11y_co_3 : std_logic;
  signal sum_11y_co_4 : std_logic;
  signal sum_11y_co_5 : std_logic;
  signal sum_11y_co_6 : std_logic;
  signal sum_11y_co_7 : std_logic;
  signal unused_2     : std_logic;
  
  -- -11Y = 2's complement of 11Y
  signal bs_neg_11        : signed (8 downto 0); -- biggest = -45, but make 8 bit anyway
  signal sum_neg_11y_co_0 : std_logic;
  signal sum_neg_11y_co_1 : std_logic;
  signal sum_neg_11y_co_2 : std_logic;
  signal sum_neg_11y_co_3 : std_logic;
  signal sum_neg_11y_co_4 : std_logic;
  signal sum_neg_11y_co_5 : std_logic;
  signal sum_neg_11y_co_6 : std_logic;
  signal sum_neg_11y_co_7 : std_logic;
  signal unused_3         : std_logic;
  
  
  
  
  -- o_fs = 6X - llY
  signal sum_fs_co_0 : std_logic;
  signal sum_fs_co_1 : std_logic;
  signal sum_fs_co_2 : std_logic;
  signal sum_fs_co_3 : std_logic;
  signal sum_fs_co_4 : std_logic;
  signal sum_fs_co_5 : std_logic;
  signal sum_fs_co_6 : std_logic;
  signal sum_fs_co_7 : std_logic;
  signal unused_4    : std_logic;
  
  
  signal not_bs11_0 : std_logic := not bs11(0);
  signal not_bs11_1 : std_logic := not bs11(1);
  signal not_bs11_2 : std_logic := not bs11(2);
  signal not_bs11_3 : std_logic := not bs11(3);
  signal not_bs11_4 : std_logic := not bs11(4);
  signal not_bs11_5 : std_logic := not bs11(5);
  signal not_bs11_6 : std_logic := not bs11(6);
  signal not_bs11_7 : std_logic := not bs11(7);
  signal not_bs11_8 : std_logic := not bs11(8);
  
       
  begin
  
    -- ha0  : half_adder  port map (i_a   , i_b    , ha_1_s, ha_1_co);  
    -- ha1  : half_adder  port map (ha_1_s, i_carry, o_s, ha_2_co );  

    -- o_carry <= ha_1_co or ha_2_co;    
    
    

  --=====================================================================================================
  --  6X
  --VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

  

  -- 6X = 2X + 4X       2X     +  4X
  fa_6x_0 : full_adder port map ('0'      , '0'      , '0'        , as6(0), sum_6x_co_0);
  fa_6x_1 : full_adder port map (i_as(0)  , '0'      , sum_6x_co_0, as6(1), sum_6x_co_1);
  fa_6x_2 : full_adder port map (i_as(1)  , i_as(0)  , sum_6x_co_1, as6(2), sum_6x_co_2);
  fa_6x_3 : full_adder port map (i_as(2)  , i_as(1)  , sum_6x_co_2, as6(3), sum_6x_co_3);
  fa_6x_4 : full_adder port map (i_as(3)  , i_as(2)  , sum_6x_co_3, as6(4), sum_6x_co_4);
  fa_6x_5 : full_adder port map (i_as(4)  , i_as(3)  , sum_6x_co_4, as6(5), sum_6x_co_5);
  fa_6x_6 : full_adder port map (i_as(4)  , i_as(4)  , sum_6x_co_5, as6(6), sum_6x_co_6);
  fa_6x_7 : full_adder port map (i_as(4)  , i_as(4)  , sum_6x_co_6, as6(7), sum_6x_co_7);
  fa_6x_8 : full_adder port map (i_as(4)  , i_as(4)  , sum_6x_co_7, as6(8), unused_0   );


  --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  --  6X
  --=====================================================================================================
  
  
  
  
  --=====================================================================================================
  --  -11Y
  --VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

  
  
  -- 2Y + 8Y = 10Y             2Y        8Y
  fa_10y_0 : full_adder port map ('0'       , '0'    , '0'             , bs10(0)      , sum_10y_co_0 );
  fa_10y_1 : full_adder port map (i_bs(0)   , '0'    , sum_10y_co_0    , bs10(1)      , sum_10y_co_1 );
  fa_10y_2 : full_adder port map (i_bs(1)   , '0'    , sum_10y_co_1    , bs10(2)      , sum_10y_co_2 );
  fa_10y_3 : full_adder port map (i_bs(2)   , i_bs(0), sum_10y_co_2    , bs10(3)      , sum_10y_co_3 );
  fa_10y_4 : full_adder port map (i_bs(3)   , i_bs(1), sum_10y_co_3    , bs10(4)      , sum_10y_co_4 );
  fa_10y_5 : full_adder port map (i_bs(4)   , i_bs(2), sum_10y_co_4    , bs10(5)      , sum_10y_co_5 );
  fa_10y_6 : full_adder port map (i_bs(4)   , i_bs(3), sum_10y_co_5    , bs10(6)      , sum_10y_co_6 );
  fa_10y_7 : full_adder port map (i_bs(4)   , i_bs(4), sum_10y_co_6    , bs10(7)      , sum_10y_co_7 );
  fa_10y_8 : full_adder port map (i_bs(4)   , i_bs(4), sum_10y_co_7    , bs10(8)      , unused_1     );
                                                                                  
                                                                                  
  -- Y + 10Y = 11Y              Y         10Y                                     
  fa_11y_0 : full_adder port map (i_bs(0)   , bs10(0), '0'             , bs11(0)      , sum_11y_co_0 );
  fa_11y_1 : full_adder port map (i_bs(1)   , bs10(1), sum_11y_co_0    , bs11(1)      , sum_11y_co_1 );
  fa_11y_2 : full_adder port map (i_bs(2)   , bs10(2), sum_11y_co_1    , bs11(2)      , sum_11y_co_2 );
  fa_11y_3 : full_adder port map (i_bs(3)   , bs10(3), sum_11y_co_2    , bs11(3)      , sum_11y_co_3 );
  fa_11y_4 : full_adder port map (i_bs(4)   , bs10(4), sum_11y_co_3    , bs11(4)      , sum_11y_co_4 );
  fa_11y_5 : full_adder port map (i_bs(4)   , bs10(5), sum_11y_co_4    , bs11(5)      , sum_11y_co_5 );
  fa_11y_6 : full_adder port map (i_bs(4)   , bs10(6), sum_11y_co_5    , bs11(6)      , sum_11y_co_6 );
  fa_11y_7 : full_adder port map (i_bs(4)   , bs10(7), sum_11y_co_6    , bs11(7)      , sum_11y_co_7 );
  fa_11y_8 : full_adder port map (i_bs(4)   , bs10(8), sum_11y_co_7    , bs11(8)      , unused_2     );
  
  -- -11Y = 2's complement of 11Y
  not_bs11_0 <= not bs11(0);
  not_bs11_1 <= not bs11(1);
  not_bs11_2 <= not bs11(2);
  not_bs11_3 <= not bs11(3);
  not_bs11_4 <= not bs11(4);
  not_bs11_5 <= not bs11(5);
  not_bs11_6 <= not bs11(6);
  not_bs11_7 <= not bs11(7);
  not_bs11_8 <= not bs11(8);
  
  fa_neg_11y_0 : full_adder port map ( not_bs11_0, '1'  , '0'             , bs_neg_11(0) , sum_neg_11y_co_0);
  fa_neg_11y_1 : full_adder port map ( not_bs11_1, '0'  , sum_neg_11y_co_0, bs_neg_11(1) , sum_neg_11y_co_1);
  fa_neg_11y_2 : full_adder port map ( not_bs11_2, '0'  , sum_neg_11y_co_1, bs_neg_11(2) , sum_neg_11y_co_2);
  fa_neg_11y_3 : full_adder port map ( not_bs11_3, '0'  , sum_neg_11y_co_2, bs_neg_11(3) , sum_neg_11y_co_3);
  fa_neg_11y_4 : full_adder port map ( not_bs11_4, '0'  , sum_neg_11y_co_3, bs_neg_11(4) , sum_neg_11y_co_4);
  fa_neg_11y_5 : full_adder port map ( not_bs11_5, '0'  , sum_neg_11y_co_4, bs_neg_11(5) , sum_neg_11y_co_5);
  fa_neg_11y_6 : full_adder port map ( not_bs11_6, '0'  , sum_neg_11y_co_5, bs_neg_11(6) , sum_neg_11y_co_6);
  fa_neg_11y_7 : full_adder port map ( not_bs11_7, '0'  , sum_neg_11y_co_6, bs_neg_11(7) , sum_neg_11y_co_7);
  fa_neg_11y_8 : full_adder port map ( not_bs11_8, '0'  , sum_neg_11y_co_7, bs_neg_11(8) , unused_3        );

  --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  --  -11Y
  --=====================================================================================================





  
  --=====================================================================================================
  --  6X - 11Y
  --VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

  

  -- o_fs = 6X - llY      6X     +  -11Y
  fa_fs_0 : full_adder port map (as6(0), bs_neg_11(0), '0'        , o_fs(0), sum_fs_co_0);
  fa_fs_1 : full_adder port map (as6(1), bs_neg_11(1), sum_fs_co_0, o_fs(1), sum_fs_co_1);
  fa_fs_2 : full_adder port map (as6(2), bs_neg_11(2), sum_fs_co_1, o_fs(2), sum_fs_co_2);
  fa_fs_3 : full_adder port map (as6(3), bs_neg_11(3), sum_fs_co_2, o_fs(3), sum_fs_co_3);
  fa_fs_4 : full_adder port map (as6(4), bs_neg_11(4), sum_fs_co_3, o_fs(4), sum_fs_co_4);
  fa_fs_5 : full_adder port map (as6(5), bs_neg_11(5), sum_fs_co_4, o_fs(5), sum_fs_co_5);
  fa_fs_6 : full_adder port map (as6(6), bs_neg_11(6), sum_fs_co_5, o_fs(6), sum_fs_co_6);
  fa_fs_7 : full_adder port map (as6(7), bs_neg_11(7), sum_fs_co_6, o_fs(7), sum_fs_co_7);
  fa_fs_8 : full_adder port map (as6(8), bs_neg_11(8), sum_fs_co_7, o_fs(8), unused_4   );


  --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  --  o_fs = 6X - llY
  --=====================================================================================================
    
    
    

  end architecture cmpnt;
  
  



    
    






