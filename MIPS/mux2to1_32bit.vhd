library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1_32bit is port (
  a1: in std_logic_vector(31 downto 0);
  a2: in std_logic_vector(31 downto 0);
  s : in std_logic;
  d: out std_logic_vector(31 downto 0)
  );
end mux2to1_32bit;

architecture dataflow of mux2to1_32bit is
begin
  d <= a1 when s = '1' else
       a2;
end dataflow;