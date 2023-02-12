----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/09 17:43:43
-- Design Name: 
-- Module Name: clock_digit - Behavioral
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

-- generate 4-bit BCD xxxx, output to BCD-7seg to display
entity clock_digit is
    Port ( clk_in : in STD_LOGIC; -- should be default 100MHz clock
           clk_out : out STD_LOGIC_VECTOR (3 downto 0);
           
           hour_ones_4bit : out STD_LOGIC_VECTOR (3 downto 0);  -- such as 0010 means 2x hours xx minutes
           hour_tens_4bit : out STD_LOGIC_VECTOR (3 downto 0);
           min_ones_4bit : out STD_LOGIC_VECTOR (3 downto 0);
           min_tens_4bit : out STD_LOGIC_VECTOR (3 downto 0)
    );
end clock_digit;

architecture Behavioral of clock_digit is
signal clk_1second : std_logic; -- 1hz clock
signal seconds : integer := 0;  -- count seconds in decimal

signal clk_1minute : std_logic; -- 1/60hz clock
signal minutes : integer := 0;  -- count seconds in decimal
signal min_ones_int : integer := minutes/10;
signal min_tens_int : integer := minutes mod 10;

signal clk_1hour : std_logic;
signal hours : integer := 0;
signal hour_ones_int : integer := hours/10;
signal hour_tens_int : integer := hours mod 10;

type int_tobin is array (0 to 9) of std_logic_vector   (3 downto 0);
constant int_bin : int_tobin := ("0000","0001","0010","0011","0100","0101","0110","0111","1000","1001");

begin
-- second : clk_1hz  input: default 100MHz  output: 1Hz
clk_1hz_unit : entity work.clk_1hz(Behavioral)
Port map(
    clk_in => clk_in,
    clk_out => clk_1second);

-- min : clk_1min  input: 1Hz clock  output: 1/60 Hz
clk_1min_unit : entity work.clk_1min(Behavioral)
Port map(
    clk_in => clk_1second,
    clk_out => clk_1minute);
    
-- hour : clk_1hour  input: 1/60 Hz  output: 1/3600 Hz
clk_1hour_unit : entity work.clk_1hour(Behavioral)
Port map(
    clk_in => clk_1minute,
    clk_out => clk_1hour);

-- here get binary number of hour_ones/tens and min_ones/tens by converting decimal count numbers
hour_ones_4bit <= int_bin(hour_ones_int);
hour_tens_4bit <= int_bin(hour_tens_int);
min_ones_4bit <= int_bin(min_ones_int);
min_tens_4bit <= int_bin(min_tens_int);

end Behavioral;
