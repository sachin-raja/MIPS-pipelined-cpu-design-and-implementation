
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity controlUnit is                                                ----entity of control unit
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);              ---inputs and output ports declared
           RegDst : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end controlUnit;

architecture Behavioral of controlUnit is

begin
control_procesure : process (opcode)               --start process with control as parameter
--wait for 1 ns;
begin
case opcode is
when "000000" =>                         ----r-type instructions           
 RegDst <= '1';                         ---initialize the signals based on opcode
 ALUop <= "10";
 RegWrite <= '1';
 jump <= '0';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '0';
 ALUSrc <= '0';

when "100011" =>                 ---load word instruction

 RegDst <= '1';                     ---initialize the signals based on opcode
 ALUop <= "00";
 RegWrite <= '1';
 jump <= '0';
 MemRead <= '1';
 MemToReg <= '1';
 MemWrite <= '0';
 ALUSrc <= '1';

when "001000" =>                  ----addi instruction
           
 RegDst <= '1';                                ---initialize the signals based on opcode
 ALUop <= "10";
 RegWrite <= '1';
 jump <= '0';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '0';
 ALUSrc <= '1';
 
when "000010" =>                 ------------jump instruction

 RegDst <= '0';                            ---initialize the signals based on opcode
 ALUop <= "01";
 RegWrite <= '0';
 jump <= '1';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '0';
 ALUSrc <= '0';
 
when "101011" =>                -------------store word instruction
 RegDst <= '0';                          ---initialize the signals based on opcode
 ALUop <= "00";
 RegWrite <= '0';
 jump <= '0';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '1';
 ALUSrc <= '1';

when "001100" =>                ---------andi instruction
 RegDst <= '1';                   ---initialize the signals based on opcode
 ALUop <= "10";
 RegWrite <= '1';
 jump <= '0';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '0';
 ALUSrc <= '1';
 
when others =>          ---------ori instruction

 RegDst <= '1';                ---initialize the signals based on opcode
 ALUop <= "10";
 RegWrite <= '1';
 jump <= '0';
 MemRead <= '0';
 MemToReg <= '0';
 MemWrite <= '0';
 ALUSrc <= '1';
end case;

end process;
end Behavioral;

