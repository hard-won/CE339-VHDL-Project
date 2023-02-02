----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/01/30 00:44:18
-- Design Name: 
-- Module Name: lab2_2_2 - Behavioral
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

entity lab2_2_2 is
    Port ( x : in STD_LOGIC (1 downto 0);
           y : in STD_LOGIC (1 downto 0);
           s : in STD_LOGIC (0 downto 0);
           m : out STD_LOGIC (1 downto 0)
           );
end lab2_2_2;

architecture Behavioral of lab2_2_2 is

begin

m <= (s and y) or (x and not s);

end Behavioral;
