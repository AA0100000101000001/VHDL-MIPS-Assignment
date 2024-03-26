library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.all;

entity sign_extender is port (
  sin : in std_logic_vector(15 downto 0);
  sout: out std_logic_vector(31 downto 0));
end sign_extender;

architecture dataflow of sign_extender is
begin
  sout(31 downto 0) <= x"0000" & sin(15 downto 0) when sin(15) = '0' else
                       x"ffff" & sin(15 downto 0);
end dataflow;
