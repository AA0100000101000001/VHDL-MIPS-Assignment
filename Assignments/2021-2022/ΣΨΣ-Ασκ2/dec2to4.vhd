LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity dec2to4 is
port (
  a: in std_logic_vector(2 downto 1);
  d: out std_logic_vector(4 downto 1));
end dec2to4;

architecture dataflow of dec2to4 is
begin
  d(1) <= a(1) and a(2);
  d(2) <= not a(1) and a(2);
  d(3) <= a(1) and not a(2);
  d(4) <= not a(1) and not a(2);
end dataflow;
