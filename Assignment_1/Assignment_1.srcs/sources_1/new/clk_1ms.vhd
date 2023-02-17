----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/11 02:53:32
-- Design Name: 
-- Module Name: clk_1ms - Behavioral
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

entity clk_1ms is
  port (
    clk_100 : in std_logic;                                     -- 100MHz clock
    clk_1ms : out std_logic
  ) ;
end clk_1ms;

architecture Behavioral of clk_1ms is
    signal counter : integer :=0;
begin
  process (clk_100) begin
    if (rising_edge(clk_100)) then
        counter <= counter + 1;
        if (counter>= 10000) then
            counter <= 0;
        end if ;
    end if;
  end process;
    -- Now for first half the counter clk_1ms will remain 0 and for the remaining it will be 1
    clk_1ms <= '0' when counter < 5000 else '1';
    
end Behavioral ;