library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_control_tb is
end ALU_control_tb;

architecture test of ALU_control_tb is
  
  component ALU_control 
  port (
    ALUop : in std_logic_vector(1 downto 0);
    funct : in std_logic_vector(5 downto 0);
    operation : out std_logic_vector(3 downto 0)
  );
  end component;
  
  -- inputs
  signal ALUop_tb : std_logic_vector(1 downto 0);
  signal funct_tb : std_logic_vector(5 downto 0);
  
  -- output
  signal operation_tb : std_logic_vector(3 downto 0);

  
begin
  U1: ALU_control port map (
    ALUop => ALUop_tb,
    funct => funct_tb,
    operation => operation_tb);
    
  -- stimulus process
  process
    begin
      
      -- load word and store word
      ALUop_tb <= "00";
      funct_tb <= "000000";
      wait for 600 ns;

      -- branch not equal
      ALUop_tb <= "01";
      funct_tb <= "100000";
      wait for 600 ns;

      -- add
      ALUop_tb <= "10";
      funct_tb <= "100010";
      wait for 600 ns;

      -- subtract
      ALUop_tb <= "10";
      funct_tb <= "100100";
      wait for 600 ns;

      -- addi
      ALUop_tb <= "11";
      funct_tb <= "000000";
      wait for 600 ns;
      
      -- runs for 3000 ns
      
  end process;
end test;
