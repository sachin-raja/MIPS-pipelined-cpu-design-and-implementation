
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux_reg is                                 ----------entity of mux
    Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (4 downto 0));
end mux_reg;

architecture Behavioral of mux_reg is

begin
process (RegDst)                         ---------start the process with ReGDst as parameter
begin
case RegDst is
when '0' =>                            ------if the signal is 0 register is selected
     Reg_out <= Reg_in_0;
	  
when others =>
    	Reg_out <= Reg_in_1;           ------------if the signal is 1 immediate value is selected
end case;		
end process;                   ----------end of process

end Behavioral;

