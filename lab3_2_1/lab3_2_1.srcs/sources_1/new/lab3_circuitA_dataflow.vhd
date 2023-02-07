----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/07 02:25:34
-- Design Name: 
-- Module Name: lab3_circuitA_dataflow - Behavioral
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

entity lab3_circuitA_dataflow is
Port (
CA_in : in std_logic_vector (2 downto 0);
CA_out : out std_logic_vector (2 downto 0));

end lab3_circuitA_dataflow;

architecture Behavioral of lab3_circuitA_dataflow is

begin

process(CA_in) is
begin
case CA_in is
when "010" => CA_out <= "000";
when "011" => CA_out <= "001";
when "100" => CA_out <= "010";
when "101" => CA_out <= "011";
when "110" => CA_out <= "100";
when "111" => CA_out <= "101";
--when others => CA_out <= "1111111";
end case;
end process;

end Behavioral;
