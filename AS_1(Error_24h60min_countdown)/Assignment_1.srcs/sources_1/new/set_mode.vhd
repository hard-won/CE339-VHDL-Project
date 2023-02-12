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
    Port ( digit_in : in STD_LOGIC_VECTOR(15 downto 0);  -- input digit
           btnU, btnD, btnC, btnL, btnR   : in  STD_LOGIC;
           clk_dp : in STD_LOGIC;    --1khz signal refresh
           digits_out :  out STD_LOGIC_VECTOR(15 downto 0):= (others => '0'); --outpu data to be stored 
           seg : out STD_LOGIC_VECTOR(6 downto 0);   --display number for 7 segment 
           an : out STD_LOGIC_VECTOR(3 downto 0));   --control which screen to display
end set_mode;

architecture Behavioral of set_mode is
--signal mode_stage  :std_logic :=  '0';  -- '1' means set, '0' means run
signal LRstate : std_logic_vector;

begin
LR_Button_unit : entity work.LR_Button(Behavioral)
        Port map (btnL => btnL, btnR => btnR, state=> LRstate);


end Behavioral;
