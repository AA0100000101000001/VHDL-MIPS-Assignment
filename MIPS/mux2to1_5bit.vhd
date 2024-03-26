library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1_5bit is port (
  a1: in std_logic_vector(4 downto 0);
  a2: in std_logic_vector(4 downto 0);
  s : in std_logic;
  d: out std_logic_vector(4 downto 0)
  );
end mux2to1_5bit;

architecture dataflow of mux2to1_5bit is
begin
  d <= a1 when s = '1' else
       a2;
end dataflow;

