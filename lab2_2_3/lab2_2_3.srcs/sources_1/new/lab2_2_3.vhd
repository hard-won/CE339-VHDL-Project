----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/01/30 01:22:47
-- Design Name: 
-- Module Name: lab2_2_3 - Behavioral
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

entity lab2_2_3 is
--  Port ( );
    Port ( 		x : in STD_LOGIC_VECTOR(1 downto 0);
                y : in STD_LOGIC_VECTOR(1 downto 0);
                s : in STD_LOGIC; -- Switch
                m : out STD_LOGIC_VECTOR(1 downto 0)
           );
end lab2_2_3;

architecture Behavioral of lab2_2_3 is

begin
process(s,y)
begin

if (s = '0') then
    m <= "00" after 3 ns;
else
    m <= y after 3 ns;
end if;

end process;
end Behavioral;