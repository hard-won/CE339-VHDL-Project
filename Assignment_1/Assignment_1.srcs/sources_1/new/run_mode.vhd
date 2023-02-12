----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/12 19:26:09
-- Design Name: 
-- Module Name: set_mode - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity run_mode is
    Port ( digits_in : in STD_LOGIC_VECTOR(15 downto 0); --input data
           clk : in STD_LOGIC; -- 100MHz
           clk_1ms : in STD_LOGIC;    --1ms signal
           digits_out :  out STD_LOGIC_VECTOR(15 downto 0):= (others => '0'); --output data to be stored
           seg : out STD_LOGIC_VECTOR(6 downto 0);   --display number for 7 segment 
           an : out STD_LOGIC_VECTOR(3 downto 0));   --control which screen to display
end run_mode;

architecture Behavioral of run_mode is

signal min_out :STD_LOGIC_VECTOR(7 downto 0);
signal sec_out :STD_LOGIC_VECTOR(7 downto 0);
signal clk_1s :STD_LOGIC;

begin

clk_blink_unit : entity work.clk_1hz
port map(
           clk_in => clk,
           clk_out => clk_1s    -- dp control the blinking point
);

process
begin
wait until rising_edge(clk_1s);
        if digits_in(3 downto 0) = "0000" then    --unit digit 0 - 1
            sec_out(3 downto 0)<="1001";          -- 9
            if digits_in(7 downto 4)="0000" then  --digit 00 - 1
                sec_out(7 downto 4) <="0101";    -- 5
                if digits_in(11 downto 8) = "0000" then
                    min_out(7 downto 4) <= digits_in(15 downto 12) - 1;
                    min_out(3 downto 0) <= "1001";
                else 
                    min_out(7 downto 4) <= digits_in(15 downto 12);
                    min_out(3 downto 0) <= digits_in(11 downto 8) - 1;    
                end if;                
            else 
                sec_out(7 downto 4)<= digits_in(7 downto 4) - 1; -- no carry
                min_out <= digits_in(15 downto 8);  -- no changing minute
            end if;
        else 
            sec_out(3 downto 0)<= digits_in(3 downto 0) - 1; --no carry
            sec_out(7 downto 4)<= digits_in(7 downto 4);
            min_out<= digits_in(15 downto 8);           
        end if;

end process;


four_digits_unit : entity work.four_digits(Behavioral)
        Port map (d3 => min_out(7 downto 4),  -- hour tens unit
                  d2 => min_out(3 downto 0),  --hour digit unit
                  d1 => sec_out(7 downto 4),  -- minute tens unit
                  d0 => sec_out(3 downto 0),  -- minute digit unit
                  ck => clk_1ms, seg => seg, an => an);

digits_out(7 downto 0)<= sec_out;
digits_out(15 downto 8)<= min_out;

end Behavioral;
