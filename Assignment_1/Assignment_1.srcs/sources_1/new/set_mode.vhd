----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/12 19:26:09
-- Design Name: 
-- Module Name: set_mode - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity set_mode is
    Port ( digits_in : in STD_LOGIC_VECTOR(15 downto 0); --input data
           btnU : in STD_LOGIC;      --central button
           clk_1ms : in STD_LOGIC;    --1ms signal
           btnD : in STD_LOGIC;      --down button (decrease the number)
           digits_out :  out STD_LOGIC_VECTOR(15 downto 0):= (others => '0'); --output data to be stored
           seg : out STD_LOGIC_VECTOR(6 downto 0);   --display number for 7 segment 
           an : out STD_LOGIC_VECTOR(3 downto 0));   --control which screen to display
end set_mode;

architecture Behavioral of set_mode is
signal min_out :STD_LOGIC_VECTOR(7 downto 0);
signal sec_out :STD_LOGIC_VECTOR(7 downto 0);

begin

set_mode_unit : entity work.set_deal_carry(Behavioral)
        Port map(
              btnU => btnU,
              btnD => btnD,       
--              clk => clk_1ms,
              min_ones_4bit => digits_in(3 downto 0),
              min_tens_4bit => digits_in(7 downto 4),
              min_out => min_out,
              second_out_0 => sec_out
        );

four_digits_unit : entity work.four_digits(Behavioral)
        Port map (d3 => min_out(7 downto 4),  -- min tens unit
                  d2 => min_out(3 downto 0),  --min ones unit
                  d1 => sec_out(7 downto 4),  -- sec tens unit
                  d0 => sec_out(3 downto 0),  -- sec ones unit
                  ck => clk_1ms, seg => seg, an => an);

digits_out(7 downto 0)<= sec_out;
digits_out(15 downto 8)<= min_out;

end Behavioral;
