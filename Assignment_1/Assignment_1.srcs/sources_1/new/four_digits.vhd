----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/05 17:05:40
-- Design Name: 
-- Module Name: four_digits - Behavioral
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

entity four_digits is
--  Port ( );
port(
d3 : in STD_LOGIC_VECTOR (3 downto 0); -- data for screen 3
d2 : in STD_LOGIC_VECTOR (3 downto 0);
d1 : in STD_LOGIC_VECTOR (3 downto 0);
d0 : in STD_LOGIC_VECTOR (3 downto 0);
ck : in STD_LOGIC;
seg : out STD_LOGIC_VECTOR (6 downto 0); --7-segment display
an : out STD_LOGIC_VECTOR (3 downto 0);
dp : out std_logic); -- 1hz signal control
end four_digits;

architecture Behavioral of four_digits is

-- create a signal to store the current active digit
signal active_digit: INTEGER range 0 to 3;
signal digit : STD_LOGIC_VECTOR (3 downto 0);

begin
-- always process to determine the active digit
process(ck)
begin
if rising_edge(ck) then
-- increment active_digit on each rising edge
if active_digit = 3 then
active_digit <= 0;
else
active_digit <= active_digit + 1;
end if;
end if;
end process;
-- multiplex the digit inputs based on the active digit
with active_digit select
    digit <= d3 when 0,
           d2 when 1,
           d1 when 2,
           d0 when others;

-- use the active digit to control the digit select lines
an <= "0001" when active_digit = 0 else
      "0010" when active_digit = 1 else
      "0100" when active_digit = 2 else
      "1000" when active_digit = 3;

-- main work to convert 4-bit data to 7-segment
one_digit_unit : entity work.one_digit(Behavioral)
        Port map (digit => digit, seg => seg);
end Behavioral;
