----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/02/06 23:06:47
-- Design Name: 
-- Module Name: lab3_2_1 - Behavioral
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

entity lab3_2_1_partA is
--  Port ( );
port(
    v : in std_logic_vector (3 downto 0);
    m : in std_logic_vector (3 downto 0);
    t : out std_logic_vector (2 downto 0);
    z : inout std_logic;
    e : out std_logic);
end lab3_2_1_partA;


architecture Behavioral of lab3_2_1_partA is

signal compara_out : std_logic;

component comparator_dataflow
Port (
    V_in : in std_logic_vector (3 downto 0);
    Z_out : out std_logic);
end component;

component lab3_circuitA_dataflow is
Port (
    CA : in std_logic_vector (2 downto 0);
    CA_o : out std_logic_vector (2 downto 0));
end component;

component mux_2to1
Port (
    M_in : in std_logic;
    M_out : out std_logic);
end component;

begin

u1: comparator_dataflow port map(V_in => v, Z_out => z); 
u2: lab3_circuitA_dataflow port map(CA => v (2 downto 0), CA_o => t); 
u3: mux_2to1 port map(M_in => z, M_out => e); 

end Behavioral;

