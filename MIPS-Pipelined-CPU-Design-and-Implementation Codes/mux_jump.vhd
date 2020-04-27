
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_jump is             --------entity for mux_jump
 Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0);    --input output ports declared
           jump : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_jump;

architecture Behavioral of mux_jump is

begin
process (jump)
begin
case jump is
when '0' =>
     Reg_out <= Reg_in_0;         ---select register value if jump signal low
	  
when others =>
    	Reg_out <= Reg_in_1;         ---select immediate value if jump signal high
end case;		
end process;

end Behavioral;

