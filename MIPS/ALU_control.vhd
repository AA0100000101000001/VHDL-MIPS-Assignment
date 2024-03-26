library ieee;
use ieee.std_logic_1164.all;

entity ALU_control is port (
	-- operation and function for ALU
	ALUop : in std_logic_vector(1 downto 0);
	funct : in std_logic_vector(5 downto 0);
	-- ALU operation
	operation : out std_logic_vector(3 downto 0)
	);
end ALU_control;

architecture behavioral of ALU_control is
begin
  process(ALUop, funct)
  begin
	 if ALUop = "01" then             -- branch not equal
		 operation <= "0110";
	 elsif ALUop = "10" then
	   if funct = "100000" then       -- add
		  operation <= "0011";
		 elsif funct = "100010" then    -- subtract
		   operation <= "0110";
		  end if;
	 elsif ALUop = "11" then          -- add immediate
	   operation <= "0011";
	 else -- ALUop = "00"
	   operation <= "0011";           -- load word and store word
	 end if;
	end process;
end behavioral;
