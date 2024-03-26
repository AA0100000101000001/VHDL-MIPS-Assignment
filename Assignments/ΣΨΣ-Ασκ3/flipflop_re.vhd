LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity flipflop_re is port ( 
  D : in std_logic;
  CLK : in std_logic; 
  Rstn: in std_logic; 
  Q : out std_logic);
end flipflop_re;

architecture behavioral of flipflop_re is
begin
  process (CLK, rstn)
  begin
    if rstn = '0' then
        Q <= '0';
    else if (clk'event and clk = '1') then
        Q <= D;
      end if;
    end if;
  end process;
end behavioral;

