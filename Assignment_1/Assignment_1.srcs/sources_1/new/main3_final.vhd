----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: 
-- 
-- Create Date:    03/02/2021
-- Design Name:    Assignment1
-- Module Name:    main3_four_digits - Behavioral 
-- Description:    main file for final design
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main3_final is port (
--   sw : in UNSIGNED (15 downto 0);
   clk  : in  STD_LOGIC; -- basy3 has 100MHz clock
   btnU, btnD,  btnC  : in  STD_LOGIC;--btnL, btnR,
   seg  : out STD_LOGIC_VECTOR (6 downto 0);
   dp  : out STD_LOGIC;
   an   : out STD_LOGIC_VECTOR (3 downto 0));
end main3_final;

architecture Behavioral of main3_final is
signal mode_stage : std_logic;
signal digit_feedback_1 : STD_LOGIC_VECTOR (15 downto 0); -- set mode feedback
signal digit_feedback_2 : STD_LOGIC_VECTOR (15 downto 0);
signal digit_feedback : STD_LOGIC_VECTOR (15 downto 0);
signal seg_1 : STD_LOGIC_VECTOR (6 downto 0);
signal seg_2 : STD_LOGIC_VECTOR (6 downto 0);
signal an_1 :  STD_LOGIC_VECTOR (3 downto 0);
signal an_2 :  STD_LOGIC_VECTOR (3 downto 0);

--signal digit_feedback : STD_LOGIC_VECTOR (7 downto 0);

signal digit_store : STD_LOGIC_VECTOR (15 downto 0);
signal clk_1ms : STD_LOGIC;
signal after_first : STD_LOGIC := '0';

begin

process
begin
wait until rising_edge(btnC); 
    if mode_stage = '0' then  -- chage stage (only 2 stages)
    mode_stage <= '1';  -- first press to enter 1 - set mode
    elsif mode_stage = '1' then
    mode_stage <= '0';  -- second flip to 0 - run mode
    end if;  
    after_first <= '1';
end process;


with after_first select 
digit_store<= digit_feedback when '1', 
              (others => '0') when others;

with mode_stage select 
    seg <= seg_1 when '1',
           seg_2 when others;
with mode_stage select 
    an <= an_1 when '1',
         an_2 when others;
with mode_stage select 
    digit_feedback <= digit_feedback_1 when '1',
                      digit_feedback_2 when others;

clk_refresh_unit : entity work.clk_1ms
port map(
            clk_100 => clk, -- 100MHz clock
            clk_1ms => clk_1ms
);

clk_blink_unit : entity work.clk_1hz
port map(
           clk_in => clk,
           clk_out => dp    -- dp control the blinking point
);

run_mode_unit : entity work.run_mode
port map(
           digits_in => digit_store, --input data
           clk => clk,
           clk_1ms => clk_1ms,    --1khz signal
           digits_out => digit_feedback_2, --output data to be stored
           seg => seg_2,  --display number for 7 segment 
           an => an_2   --control which screen to display
);

set_mode_unit : entity work.set_mode
port map(
           digits_in => digit_store, --input data
           btnU => btnU,      -- up button
           btnD => btnD,     --down button (decrease the number)
           clk_1ms => clk_1ms,    --1khz signal
           digits_out => digit_feedback_1, --output data to be stored
           seg => seg_1,  --display number for 7 segment 
           an => an_1   --control which screen to display
);


end Behavioral;
