----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/06 23:01:26
-- Design Name: 
-- Module Name: lab3_1_1 - Behavioral
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

entity lab3_1_1 is
    port (
        number : in std_logic_vector (3 downto 0); -- 4-bit input number
        seg    : out std_logic_vector (6 downto 0)  -- 7-segment display
    );
end lab3_1_1;

architecture Behavioral of lab3_1_1 is
begin
    process (number)
    begin
        case number is
            when "0000" => seg <= "0000001"; -- Display 0
            when "0001" => seg <= "1001111"; -- Display 1
            when "0010" => seg <= "0010010"; -- Display 2
            when "0011" => seg <= "0000110"; -- Display 3
            when "0100" => seg <= "1001100"; -- Display 4
            when "0101" => seg <= "0100100"; -- Display 5
            when "0110" => seg <= "0100000"; -- Display 6
            when "0111" => seg <= "0001111"; -- Display 7
            when "1000" => seg <= "0000000"; -- Display 8
            when "1001" => seg <= "0000100"; -- Display 9
            when others => seg <= "1111111"; -- Display nothing
        end case;
    end process;
end Behavioral;