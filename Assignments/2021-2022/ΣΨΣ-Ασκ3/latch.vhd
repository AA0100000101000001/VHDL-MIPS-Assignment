LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity latch is port ( 
  D : in std_logic;
  EN : in std_logic; 
  Q : out std_logic);
end latch;

architecture behavioral of latch is
begin
  process (EN, D)
  begin
    if EN = '1' then
      Q <= D;
    end if;
  end process;
end behavioral;
