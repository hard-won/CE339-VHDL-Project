----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/07 02:25:52
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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

entity mux_2to1 is
Port (
    v : in std_logic_vector (3 downto 0);
    z : inout std_logic;
    M_out : out std_logic);
end mux_2to1;

architecture Behavioral of mux_2to1 is

signal m : std_logic_vector(3 downto 0);

component lab3_circuitA_dataflow is
Port (
    CA : in std_logic_vector (2 downto 0);
    CA_o : out std_logic_vector (2 downto 0));
end component;

begin
u1 : lab3_circuitA_dataflow port map(CA => z, CA_o => M_out); 
process
begin
if z = '0' then
m(3) <= v(3);



end if;
end process;
end Behavioral;
