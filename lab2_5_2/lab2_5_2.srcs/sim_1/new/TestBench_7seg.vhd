library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;

entity bcdto7segment_dataflow is
  Port ( x : in  STD_LOGIC;
         an : out  STD_LOGIC_VECTOR (3 downto 0);
         seg : out  STD_LOGIC_VECTOR (6 downto 0));
end bcdto7segment_dataflow;


architecture dataflow of bcdto7segment_dataflow is
  signal count : std_logic_vector (3 downto 0) := "0000";

begin
  process(x)
  begin
    if rising_edge(x) then
      count <= count + 1 after 20 ns;  -- increment count on each rising edge of the clock
    end if;
  end process;

  an <= "1000"; -- Display only on the rightmost digit
  seg <= "0000001" when count = "0000" else
         "1001111" when count = "0001" else
         "0010010" when count = "0010" else
         "0000110" when count = "0011" else
         "1001100" when count = "0100" else
         "0100100" when count = "0101" else
         "0100000" when count = "0110" else
         "0001111" when count = "0111" else
         "0000000" when count = "1000" else
         "0000100" when count = "1001" else
         "1111111" ;

end dataflow;