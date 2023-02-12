----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/11 15:27:57
-- Design Name: 
-- Module Name: LR_Button - Behavioral
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- move the select digit
entity LR_Button is
    Port ( btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           state : out std_logic_vector); -- 00-minute_ones, 01-minute_tens, 10-hour_ones, 11-hour_tens
end LR_Button;

architecture Behavioral of LR_Button is

signal count : std_logic_vector := "00";

begin

process
begin
wait until rising_edge(btnL);
state <= count + 1;   
wait until rising_edge(btnR);
state <= count - 1;   
end process;

end Behavioral;
