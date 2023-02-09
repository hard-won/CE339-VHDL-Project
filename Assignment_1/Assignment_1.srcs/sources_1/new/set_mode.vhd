----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/09 17:39:36
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity set_mode is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC;
           btnU, btnD, btnC  : in  STD_LOGIC;
           hour_ones_int : out integer;  -- decimal count numbers
           hour_tens_int : out integer;
           min_ones_int : out integer;
           min_tens_int : out integer);
end set_mode;

architecture Behavioral of set_mode is
signal mode_stage  :std_logic :=  '0';  -- '1' means set, '0' means run

begin




end Behavioral;
