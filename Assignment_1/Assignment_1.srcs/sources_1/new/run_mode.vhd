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
    Port ( digits_in : in STD_LOGIC_VECTOR(15 downto 0);                      --input data
           clk : in STD_LOGIC;                                                -- 100MHz
           clk_1ms : in STD_LOGIC;                                            --1ms refresh signal
           digits_out :  out STD_LOGIC_VECTOR(15 downto 0):= (others => '0'); --output data to be stored
           seg : out STD_LOGIC_VECTOR(6 downto 0);                            --display number for 7 segment 
           an : out STD_LOGIC_VECTOR(3 downto 0));                            --control which screen to display
end run_mode;

architecture Behavioral of run_mode is
signal count : integer := 60;
signal output : STD_LOGIC_VECTOR(15 downto 0);
signal min_out :STD_LOGIC_VECTOR(7 downto 0);
signal sec_out :STD_LOGIC_VECTOR(7 downto 0);
signal clk_1s :STD_LOGIC;
signal count_1 : integer := 0;
signal clk_temp : STD_LOGIC;

begin
process(clk)                                                                    -- clk as input, countine process loop
begin
if rising_edge(clk) then                                                        -- trigger when rising edge
    count_1 <= count_1 + 1;
    -- '49999999' means count after 49999999, half of time in one 1Hz clock is over
    if (count_1 = 49999999) then
        clk_temp <= not clk_temp;
        count <= 0;
    end if;
end if;
clk_1s <= clk_temp;
end process;

process
begin
wait until rising_edge(clk_1s);
        if digits_in(3 downto 0) = "0000" then                                 -- digit 0 - 1
            sec_out(3 downto 0)<="1001";                                       -- 0 turn to 9
            if digits_in(7 downto 4)="0000" then                               -- digit 00 - 1
                sec_out(7 downto 4) <="0101";                                  --00 turn to 59
                if digits_in(11 downto 8) = "0000" then
                    min_out(7 downto 4) <= digits_in(15 downto 12) - 1;
                    min_out(3 downto 0) <= "1001";
                else 
                    min_out(7 downto 4) <= digits_in(15 downto 12);
                    min_out(3 downto 0) <= digits_in(11 downto 8) - 1;    
                end if;                
            else 
                sec_out(7 downto 4)<= digits_in(7 downto 4) - 1;               -- no carry
                min_out <= digits_in(15 downto 8);                             -- no changing minute
            end if;
        else 
            sec_out(3 downto 0)<= digits_in(3 downto 0) - 1;                   --no carry
            sec_out(7 downto 4)<= digits_in(7 downto 4);
            min_out<= digits_in(15 downto 8);           
        end if;
end process;

four_digits_unit : entity work.four_digits(Behavioral)
        Port map (d3 => min_out(7 downto 4),                                   -- min tens
                  d2 => min_out(3 downto 0),                                   -- min ones
                  d1 => sec_out(7 downto 4),                                   -- sec tens
                  d0 => sec_out(3 downto 0),                                   -- sec ones
                  ck => clk_1ms, seg => seg, an => an);
digits_out(7 downto 0)<= sec_out;
digits_out(15 downto 8)<= min_out;
end Behavioral;