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


-- 
entity set_deal_carry is
Port ( 
      btnU : in STD_LOGIC;    --add 1
      btnD : in STD_LOGIC;    --minus 1 
--      clk : STD_LOGIC;
      min_ones_4bit : in STD_LOGIC_VECTOR (3 downto 0);
      min_tens_4bit : in STD_LOGIC_VECTOR (3 downto 0); 
      min_out : out STD_LOGIC_VECTOR (7 downto 0);  -- 8 bits to display dealed carry minute
      second_out_0 : out STD_LOGIC_VECTOR (7 downto 0) -- when set, second is all zero
);
end set_deal_carry;

architecture Behavioral of set_deal_carry is

      signal min_ones_carry_add :  STD_LOGIC_VECTOR (3 downto 0); -- dealed carry 4-bit BCD digit
      signal min_tens_carry_add :  STD_LOGIC_VECTOR (3 downto 0);

      signal min_ones_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);
      signal min_tens_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);
      
      signal chosen : STD_LOGIC_VECTOR (2 downto 0);  -- the stage of U, D, add or minus state
      signal min_origin : STD_LOGIC_VECTOR (7 downto 0);


begin

min_origin <= min_tens_4bit & min_ones_4bit; -- no change, initial is 00000000

process
begin

    second_out_0 <= (others => '0');
if btnU'event and btnU = '1' then --adding
--    if (CONV_INTEGER(min_ones_4bit & min_tens_4bit)) < 60 then
    if min_ones_4bit = "1001" then  -- ones is 9
        min_ones_carry_add <= "0000";
        --min_tens_carry <= min_tens_4bit;
        if min_tens_4bit = "0101" then  -- tens is 5,  now is 59
            min_tens_carry_add <= "0000";
        else 
            min_tens_carry_add <= min_tens_4bit + 1; -- no carry
        end if;        
    else 
        min_ones_carry_add <= min_ones_4bit + 1;
        min_tens_carry_add <= min_tens_4bit;
    end if;
end if;
if btnD'event and btnD = '1' then -- btnD pressed -- minus
    if min_ones_4bit = "0000" then  -- ones is 0
        min_ones_carry_minus <= "1001";
        --min_tens_carry <= min_tens_4bit;
        if min_tens_4bit = "0000" then  -- tens is 5,  now is 59
            min_tens_carry_minus <= "0101";
        else 
            min_tens_carry_minus <= min_tens_4bit - 1; -- no carry
        end if;        
    else 
        min_ones_carry_minus <= min_ones_4bit - 1;
        min_tens_carry_minus <= min_tens_4bit;
    end if;    
end if;
--end if;
end process;

chosen(0)<=btnU; --change output data control
chosen(1)<=btnD;

-- connect the situation and choose responding data to output
with chosen select
min_out<= min_tens_carry_add & min_ones_carry_add when "01",   --minute add 1
          min_tens_carry_minus & min_ones_carry_minus when "10",   --minute minus 1
          min_origin when others;  --no changing yet 000 or 011


end Behavioral;
