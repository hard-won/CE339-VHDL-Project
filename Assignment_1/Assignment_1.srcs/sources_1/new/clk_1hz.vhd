----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/09 05:46:05
-- Design Name: 
-- Module Name: clk_1hz - Behavioral
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

-- clk_1 output the 1Hz(1 second) clock signal while input clk_in should be Basy3 default 100MHz clock
entity clk_1hz is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);        -- 1Hz genarate from clk which is 100MHz
end clk_1hz;

architecture Behavioral of clk_1hz is
signal count : integer := 0;
signal clk_temp : STD_LOGIC;

begin
process(clk_in)                             -- clk as input, countine process loop
begin

-- trigger when rising edge
if rising_edge(clk_in) then 
count <= count+1;
-- '49999999' means count after 49999999, half of time in one 1Hz clock is over
if (count = 49999999) then
clk_temp <= not clk_temp;
count <= 0;
end if;
end if;
clk_out <= clk_temp;

end process;
end Behavioral;
