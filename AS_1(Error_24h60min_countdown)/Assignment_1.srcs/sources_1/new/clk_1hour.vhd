----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/09 17:48:18
-- Design Name: 
-- Module Name: clk_1hour - Behavioral
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

-- generate 1 hour by divide 1hz into 1/3600 hz
entity clk_1hour is
    Port ( clk_in : in STD_LOGIC; -- should be 1 min = 1/60 hz
           clk_out : out STD_LOGIC); -- 1 hour = 1/3600 hz
end clk_1hour;

architecture Behavioral of clk_1hour is

begin
clk_div60_unit : entity work.div_60(Behavioral)
port map(
clk_in => clk_in,
clk_out => clk_out
);

end Behavioral;
