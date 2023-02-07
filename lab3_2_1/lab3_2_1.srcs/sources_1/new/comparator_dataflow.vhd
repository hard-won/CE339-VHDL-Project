----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/06 23:27:59
-- Design Name: 
-- Module Name: comparator_dataflow - Behavioral
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

entity comparator_dataflow is
Port (
    v : in std_logic_vector (3 downto 0);
    z : out std_logic);
end comparator_dataflow;


architecture Behavioral of comparator_dataflow is

begin
process
begin
if v < "1001" then
    z <= '0';
else
    z <= '1';
end if;
end process;
end Behavioral;
