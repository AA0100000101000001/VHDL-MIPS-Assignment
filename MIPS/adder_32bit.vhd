library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.all;

entity adder_32bit is port (
  a, b : in std_logic_vector(31 downto 0);
  cout: out std_logic_vector(31 downto 0));
end adder_32bit;

architecture dataflow of adder_32bit is
begin
  cout(31 downto 0) <= a(31 downto 0) + b(31 downto 0);
end dataflow;
