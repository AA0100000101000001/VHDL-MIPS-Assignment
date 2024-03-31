LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity alu4_tb is
end alu4_tb;

architecture test of alu4_tb is
  
  component alu4 port (
    ALUin1: in std_logic_vector(3 downto 0);
    ALUin2: in std_logic_vector(3 downto 0);
    ALUctrl: in std_logic_vector( 3 downto 0);
    ALUout1: out std_logic_vector(3 downto 0);
    zero: out std_logic);
  end component;
  
  signal ALUin1_tb, ALUin2_tb, ALUout1_tb: std_logic_vector(3 downto 0);
  signal ALUctrl_tb: std_logic_vector(3 downto 0);
  signal zero_tb: std_logic;
  
begin
  U1: alu4 PORT MAP (
    ALUin1 => ALUin1_tb,
    ALUin2 => ALUin2_tb,
    ALUctrl => ALUctrl_tb,
    ALUout1 => ALUout1_tb,
    zero => zero_tb);
    
  process
 begin
   
   ALUin1_tb <= "0010";
   ALUin2_tb <= "0100";
   ALUctrl_tb <= "0010"; -- add
   wait for 300 ns;
   
   ALUin1_tb <= "0100";
   ALUin2_tb <= "1111";
   ALUctrl_tb <= "0000"; -- and
   wait for 300 ns;
   
   ALUin1_tb <= "0100";
   ALUin2_tb <= "1111";
   ALUctrl_tb <= "0001"; -- or
   wait for 300 ns;
   
   ALUin1_tb <= "0100";
   ALUin2_tb <= "0010";
   ALUctrl_tb <= "0110"; -- subtract
   wait for 300 ns;
   
   ALUin1_tb <= "0100";
   ALUin2_tb <= "0110";
   ALUctrl_tb <= "0110"; -- subtract
   wait for 300 ns;
   
   ALUctrl_tb <= "1110"; -- other
   wait for 300 ns;
   
   --runs for 1800 ns
    
 end process;
end test;
