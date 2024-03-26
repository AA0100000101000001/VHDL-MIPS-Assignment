library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.all;

entity shift_left2_32bit is port (
  sin : in std_logic_vector(31 downto 0);
  sout: out std_logic_vector(31 downto 0));
end shift_left2_32bit;

architecture dataflow of shift_left2_32bit is
begin
  sout(31 downto 0) <= sin(29 downto 0) & "00";
end dataflow;
