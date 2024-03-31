LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity my_register is port ( 
  D : in std_logic_vector(3 downto 0);
  clk : in std_logic;
  clr : in std_logic;
  Q : out std_logic_vector(3 downto 0));
end my_register;

architecture behavioral of my_register is
begin
  process (CLK, clr)
  begin
    if (clk'event and clk = '1') then
      if clr = '0' then
        Q <= "0000";
      else
        Q <= D;
      end if;
    end if;
  end process;
end behavioral;

