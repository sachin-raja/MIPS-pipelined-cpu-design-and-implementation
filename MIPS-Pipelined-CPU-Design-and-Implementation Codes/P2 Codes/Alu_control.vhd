
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Alu_control is                       ------------entity of alu control
    Port ( ALUop : in  STD_LOGIC_VECTOR (1 downto 0);        ----declare input and output ports
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           Alu_ctr : out  STD_LOGIC_VECTOR (3 downto 0));
end Alu_control;

architecture Behavioral of Alu_control is

begin
process (ALUop)                 ----------start process for alu op
begin
case ALUop is
when "10" =>                          ----r-type instructions
  
   case funct is
      when "100000" =>          --add1(rca) instruction
	     Alu_ctr <= "0010";       --initialize alu control
		when "100001" =>           --add2(cla) instruction
		 Alu_ctr <= "0011";        --initialize alu control
		 
		 when "100010" =>           --sub instruction
		 Alu_ctr <= "0110";          --initialize alu control
		 
		 when "100100" =>           --and instruction
		 Alu_ctr <= "0000";        --initialize alu control
		 
		 when "100101" =>           --or instruction
		 Alu_ctr <= "0001";           --initialize alu control
		 
		  when "101010" =>           --slt instruction
		 Alu_ctr <= "0111";          --initialize alu control
		  
		when others =>              --nor instruction
		  Alu_ctr <= "1111";          --initialize alu control
		end case;

when others =>
   	Alu_ctr <= "0010";           ---sw/lw instruction
		
end case;
 end process;
end Behavioral;

