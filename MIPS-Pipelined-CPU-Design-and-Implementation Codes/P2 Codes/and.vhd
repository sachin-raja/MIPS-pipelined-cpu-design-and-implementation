
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity andGate is
    Port ( a : in  STD_LOGIC_vector(31 downto 0);
           b : in  STD_LOGIC_vector(31 downto 0);
           c : out STD_LOGIC_vector(31 downto 0));
end andGate;

architecture Behavioral of andGate is

begin
c <= a and b;

end Behavioral;

