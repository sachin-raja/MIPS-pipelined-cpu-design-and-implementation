
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_alu is                  ------------entity of mux alu
  Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0); ------input and output ports declared
           ALUSrc : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_alu;

architecture Behavioral of mux_alu is

begin
process (ALUSrc)              ---start process with alu source signal as parameter
begin
case ALUSrc is
when '0' =>
     Reg_out <= Reg_in_0;         ---if alu source low select reg 0
	  
when others =>
    	Reg_out <= Reg_in_1;         ----if alu source high select reg1
end case;		
end process;


end Behavioral;

