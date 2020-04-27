
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux1 is                        -------entity of mux
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           Binv : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end mux1;

architecture Behavioral of mux1 is

begin
with binv select
Y <= I0 when '0',                ---select I0 if binv is 0
     I1 when others;              --select inverted value of B 

end Behavioral;

