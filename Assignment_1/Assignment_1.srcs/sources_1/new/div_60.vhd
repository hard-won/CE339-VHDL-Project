----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/09 06:25:06
-- Design Name: 
-- Module Name: div_60 - Behavioral
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

-- genarate minute or hour by using 60 seconds or 60 minutes (which depends on clk_in)
entity div_60 is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end div_60;

architecture Behavioral of div_60 is
signal count: integer := 0;
signal clk_temp : STD_LOGIC;

begin
process(clk_in)
begin

if rising_edge(clk_in) then
count <= count + 1;
if count = 29 then  -- half of 60
clk_temp <= not clk_temp;
count <= 0;
end if;
end if;
clk_out <= clk_temp;
end process;

end Behavioral;
