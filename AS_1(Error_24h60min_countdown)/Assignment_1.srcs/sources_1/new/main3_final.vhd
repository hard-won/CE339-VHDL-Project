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
   sw : in UNSIGNED (15 downto 0);
   clk  : in  STD_LOGIC; -- basy3 has 100MHz clock
   btnU, btnD,  btnC  : in  STD_LOGIC;--btnL, btnR,
   seg  : out STD_LOGIC_VECTOR (6 downto 0);
   dp  : out STD_LOGIC;
   an   : out STD_LOGIC_VECTOR (3 downto 0));
end main3_final;

architecture Behavioral of main3_final is
signal 

begin

process
begin
wait until rising_edge(btnU); 
    if mode_stage = '0' then  -- chage stage (only 2 stages)
    mode_stage <= '1';  -- first press to enter 1 - set mode
    elsif mode_stage = '1' then
    mode_stage <= '0';  -- second flip to 0 - run mode
    end if;  
end process;

with mode_stage select 
-- xxx when '1';
   
end Behavioral;
