LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity flipflop is port ( 
  D : in std_logic;
  CLK : in std_logic; 
  Q : out std_logic);
end flipflop;

architecture behavioral of flipflop is
begin
  process (CLK)
  begin
      if (clk'event and clk = '1') then
        Q <= D;
      end if;
  end process;
end behavioral;
