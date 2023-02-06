library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcdto7segment_dataflow is
  Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
         an : out  STD_LOGIC_VECTOR (3 downto 0);
         seg : out  STD_LOGIC_VECTOR (6 downto 0));
end bcdto7segment_dataflow;

architecture dataflow of bcdto7segment_dataflow is
begin

  an <= "1000"; -- Display only on the rightmost digit
  seg <= "0000001" when x = "0000" else
         "1001111" when x = "0001" else
         "0010010" when x = "0010" else
         "0000110" when x = "0011" else
         "1001100" when x = "0100" else
         "0100100" when x = "0101" else
         "0100000" when x = "0110" else
         "0001111" when x = "0111" else
         "0000000" when x = "1000" else
         "0000100" when x = "1001" else
         "1111111" ;

end dataflow;