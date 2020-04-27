
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity AddPc is                                  --entity of addpc
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           c : out  STD_LOGIC_VECTOR (31 downto 0));
end AddPc;

architecture Behavioral of AddPc is
COMPONENT Full_adder_32bit IS
   Port ( X : in  STD_LOGIC_vector(31 downto 0);      --input X of 32-bit adder of type vector
           Y : in  STD_LOGIC_vector(31 downto 0);      --input Y of 32-bit adder of type vector
           Ci : in  STD_LOGIC;                          --carry in of 32-bit adder
           Sum : out  STD_LOGIC_vector(31 downto 0);    ---sum of 32-bit adder of type vector
           Co : out  STD_LOGIC);   
END COMPONENT;

SIGNAL cout, cin : std_logic;

begin
cin <= '0';                                     --carry-in is 0
u4_rca_add : Full_adder_32bit port map ( a, b, cin, c, cout); ----calling full adder component for addition

end Behavioral;

