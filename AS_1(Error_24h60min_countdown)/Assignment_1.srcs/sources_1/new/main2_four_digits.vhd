----------------------------------------------------------------------------------
-- Company: University of Essex
-- Engineer: Luca Citi
-- 
-- Create Date:    09/01/2016
-- Design Name:    Assignment1
-- Module Name:    main2_four_digits - Behavioral 
-- Description:    main file for sub-design 2
--                 implementing a 4-digit 7-segment display
--                 decoder with manual time-multiplexing
-- Dependencies:   four_digits(one_digit)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main2_four_digits is
    Port (
        sw   : in  STD_LOGIC_VECTOR (15 downto 0);
        btnC : in  STD_LOGIC;
        seg  : out STD_LOGIC_VECTOR (6 downto 0);
        dp   : out STD_LOGIC;
        an   : out STD_LOGIC_VECTOR (3 downto 0));
end main2_four_digits;

architecture Behavioral of main2_four_digits is

begin
    -- instantiate one four_digits_unit decoder that will decode and
    -- and display one of the four digits
    four_digits_unit : entity work.four_digits(Behavioral)
        Port map (d3 => sw(15 downto 12), -- only for main_2, use sw to control
                  d2 => sw(11 downto 8),
                  d1 => sw(7 downto 4),
                  d0 => sw(3 downto 0),
                  ck => btnC, seg => seg, an => an);
end Behavioral;