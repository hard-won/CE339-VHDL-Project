----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/01/30 01:22:47
-- Design Name: 
-- Module Name: lab2_2_3 - Behavioral
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

entity lab2_2_3 is
--  Port ( );
    Port ( 		x : in STD_LOGIC_VECTOR(1 downto 0);
                y : in STD_LOGIC_VECTOR(1 downto 0);
                s : in STD_LOGIC; -- Switch
                m : out STD_LOGIC_VECTOR(1 downto 0)
           );
end lab2_2_3;

architecture struct of lab2_2_3 is


component or_gate port(
    i0 : in std_logic;
    i1 : in std_logic;
    o : out std_logic_vector);
end component;

component and_gate port(
    i0 : in std_logic;
    i1 : in std_logic;
    o : out std_logic_vector);
end component;

signal e1 : std_logic;
signal e1 : std_logic;
begin


and_comp : and_gate port map(
    i0 => x,
    i1 => s,
    o => e1
);

and_comp : and_gate port map(
    i0 => y,
    i1 => s,
    o => e2
);

or_comp : or_gate port map(
    i0 => e1,
    i1 => e2,
    o => m
);

end struct;