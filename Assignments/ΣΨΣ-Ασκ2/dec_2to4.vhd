LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity dec_2to4 is
port (
  a: in std_logic_vector(2 downto 1);
  en: in std_logic;
  d: out std_logic_vector(4 downto 1) );
end dec_2to4;

architecture dataflow of dec_2to4 is
signal ena: std_logic_vector(3 downto 1);
begin
  ena <= en & a;
  
  with ena select
  d <= "1000" when "100",
       "0100" when "101",
       "0010" when "110",
       "0001" when "111",
       "0000" when others;
end dataflow;