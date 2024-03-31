LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.all;

entity ALU4 is port (
 ALUin1: in std_logic_vector(3 downto 0);
 ALUin2: in std_logic_vector(3 downto 0);
 ALUctrl: in std_logic_vector( 3 downto 0);
 ALUout1: out std_logic_vector(3 downto 0);
 zero: out std_logic);
end ALU4;

-- behavioral
--architecture behavioral of ALU32 is
--  signal result: std_logic_vector(3 downto 0);
--begin
--  
--  process(ALUctrl, ALUin1, ALUin2)
--  begin
--  case ALUctrl is
--    when "0000" =>
--      result <= ALUin1 and ALUin2;
--    when "0001" =>
--      result <= ALUin1 or ALUin2;
--    when "0010" =>
--      result <= ALUin1 + ALUin2;
--    when "0110" =>
--      result <= ALUin1 - ALUin2;
--    when others =>
--      result <= "0000";
--    end case;
--  end process;
--  zero <= '1' when result = "0000" else '0';
--  ALUout1 <= result;
--end behavioral;

-- dataflow
architecture dataflow of ALU4 is
  signal a1anda2, a1ora2, a1addsuba2, result: std_logic_vector(3 downto 0);
begin
  
  a1anda2 <= aluin1 and aluin2;
  a1ora2 <= aluin1 or aluin2;
  a1addsuba2 <= (aluin1 + aluin2) when aluctrl(2) = '0' else (aluin1 - aluin2);
  
  with aluctrl select result <=
    a1anda2 when "0000",
    a1ora2 when "0001",
    a1addsuba2 when "0010",
    a1addsuba2 when "0110",
    (others => '0') when others;
    
  aluout1 <= result;
  zero <= '1' when result = "0000" else '0';
  
end dataflow;