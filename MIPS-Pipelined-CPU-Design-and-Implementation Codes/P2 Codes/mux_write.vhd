
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_write is                      ----------entity for mux_write
Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0);      --input output ports declared
           MemToReg : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_write;

architecture Behavioral of mux_write is

begin
process (MemToReg)
begin
case MemToReg is
when '0' =>
     Reg_out <= Reg_in_0;        ---select register value if MemTorReg signal low
	  
when others =>
    	Reg_out <= Reg_in_1;          ---select immediate value if MemTorReg signal low
end case;		
end process;

end Behavioral;

