LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity mux_4to1 is port (
  a: in std_logic_vector(4 downto 1);
  s: in std_logic_vector(2 downto 1);
  d: out std_logic);
end mux_4to1;

architecture dataflow of mux_4to1 is
begin
  d <= a(1) when s = "00" else
       a(2) when s = "01" else
       a(3) when s = "10" else
       a(4) when s = "11";
end dataflow;
