----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/11 05:30:30
-- Design Name: 
-- Module Name: deal_carry - Behavioral
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


-- 好像不用这个
entity deal_carry is
Port ( 

      hour_ones_4bit : in STD_LOGIC_VECTOR (3 downto 0);  -- such as 0010 means 2x hours xx minutes
      hour_tens_4bit : in STD_LOGIC_VECTOR (3 downto 0);
      min_ones_4bit : in STD_LOGIC_VECTOR (3 downto 0);
      min_tens_4bit : in STD_LOGIC_VECTOR (3 downto 0); 
      hour_ones_carry : out STD_LOGIC_VECTOR (3 downto 0);  -- dealed carry 4-bit BCD digit
      hour_tens_carry : out STD_LOGIC_VECTOR (3 downto 0);
      min_ones_carry : out STD_LOGIC_VECTOR (3 downto 0);
      min_tens_carry : out STD_LOGIC_VECTOR (3 downto 0) 
       );
end deal_carry;

architecture Behavioral of deal_carry is

begin

process
begin

    if min_ones_4bit = "1001" then  -- ones is 9
        min_ones_carry <= "0000";
        --min_tens_carry <= min_tens_4bit;
        if min_tens_4bit = "0101" then  -- tens is 5,  now is 59
            min_tens_carry <= "0000";
        else 
            min_tens_carry <= min_tens_4bit + 1; -- no carry
        end if;        
    else 
        
end if;
end process;


end Behavioral;
