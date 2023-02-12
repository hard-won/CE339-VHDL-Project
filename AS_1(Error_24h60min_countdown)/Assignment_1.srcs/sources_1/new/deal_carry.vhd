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
      state : in STD_LOGIC;   --0-minute changing, 1-hour changing      
      
      hour_ones_4bit : in STD_LOGIC_VECTOR (3 downto 0);  -- such as 0010 means 2x hours xx minutes
      hour_tens_4bit : in STD_LOGIC_VECTOR (3 downto 0);
      min_ones_4bit : in STD_LOGIC_VECTOR (3 downto 0);
      min_tens_4bit : in STD_LOGIC_VECTOR (3 downto 0); 
      
      hour_out : out STD_LOGIC_VECTOR (7 downto 0);  --  out after add or minus, 0-3 is ones, 4-7 is tens
      min_out : out STD_LOGIC_VECTOR (7 downto 0)
);
end set_deal_carry;

architecture Behavioral of set_deal_carry is

      signal hour_ones_carry_add :  STD_LOGIC_VECTOR (3 downto 0);  -- dealed carry 4-bit BCD digit
      signal hour_tens_carry_add :  STD_LOGIC_VECTOR (3 downto 0);
      signal min_ones_carry_add :  STD_LOGIC_VECTOR (3 downto 0);
      signal min_tens_carry_add :  STD_LOGIC_VECTOR (3 downto 0);
      signal hour_ones_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);  -- dealed carry 4-bit BCD digit
      signal hour_tens_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);
      signal min_ones_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);
      signal min_tens_carry_minus :  STD_LOGIC_VECTOR (3 downto 0);
      
      signal chosen : STD_LOGIC_VECTOR (2 downto 0);  -- the stage of U, D, add or minus state
      signal min_origin : STD_LOGIC_VECTOR (7 downto 0);
      signal hour_origin : STD_LOGIC_VECTOR (7 downto 0);

begin

hour_origin <= hour_tens_4bit & hour_ones_4bit; -- no change, initial is 00000000
min_origin <= min_tens_4bit & min_ones_4bit;

process
begin
if state = '0' then  --minute changing
    wait until rising_edge(btnU); --adding
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
    wait until rising_edge(btnD); -- minus
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

else -- hour changing (state = 1)
wait until rising_edge(btnU);  --adding
    if hour_ones_4bit="0011" and hour_tens_4bit="0010" then  --total 23+1
    hour_ones_carry_add<="0000";
    hour_tens_carry_add<="0000";
    elsif hour_ones_4bit="1001" then    --digit unit 9+1
    hour_ones_carry_add<="0000";
    hour_tens_carry_add<=hour_tens_4bit + 1;
    else 
    hour_ones_carry_add<= hour_ones_4bit + 1;
    hour_tens_carry_add<=hour_tens_4bit; -- no carry
    end if;

wait until rising_edge(btnD);  --minus
    if hour_ones_4bit="0000" and hour_tens_4bit="0000" then  --total 00 - 1
    hour_ones_carry_minus<="0011";
    hour_tens_carry_minus<="0010";
    elsif hour_ones_4bit="0000" then    --digit unit 0 - 1
    hour_ones_carry_minus<="1001";
    hour_tens_carry_minus<=hour_tens_4bit - 1;
    else 
    hour_ones_carry_add<= hour_ones_4bit - 1;
    hour_tens_carry_add<=hour_tens_4bit; -- no carry
    end if;

end if;
end process;

chosen(0)<=btnU; --change output data control
chosen(1)<=btnD;
chosen(2)<=state;
chosen(0)<=btnU;
chosen(1)<=btnD;
chosen(2)<=state;

-- connect the situation and choose responding data to output
with chosen select
min_out<= min_tens_carry_add & min_ones_carry_add when "001",   --minute add 1
          min_tens_carry_minus & min_ones_carry_minus when "010",   --minute minus 1
          min_origin when others;  --no changing yet 000 or 011
with chosen select
hour_out<= hour_tens_carry_add & hour_ones_carry_add when "101", --hour add 1
           hour_tens_carry_minus & hour_ones_carry_minus when "110",  --hour minus 1
           hour_origin when others; --no changing yet  100 or 111


end Behavioral;
