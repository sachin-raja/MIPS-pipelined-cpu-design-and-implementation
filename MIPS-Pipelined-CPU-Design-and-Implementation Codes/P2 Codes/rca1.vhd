----------------------------------------------------------------------------------
-- Create Date:    14:51:21 10/24/2019 
-- Name:           Shilpa Benarji
-- Module Name:    Full_addr_1bit - Behavioral 
-- Description:   Behavioural modelling of 1-bit Full adder

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_addr_1bit is                        --entity of 1bit full adder declared
    Port ( a : in  STD_LOGIC;                   -- input port of 1-bit FA
           b : in  STD_LOGIC;                   -- output port of 1-bit FA
           Cin : in  STD_LOGIC;                 --carry in of 1-bit FA
           sum : out  STD_LOGIC;                --sum of 1-bit FA
           Cout : out  STD_LOGIC);              --carry out of 1-bit FA
end Full_addr_1bit;                             -- end of entity

architecture Behavioral of Full_addr_1bit is            --describe the functionality of 1-bit FA

begin
process (a,b,Cin)                                       --process involving 3 inputs a, b, cin
begin
---defining the behaviour of 1-bit full adder using the lookup table
if (a = '0' and b = '0' and Cin = '0') then
  sum<='0';
  Cout<='0';
elsif (a = '0' and b = '0' and Cin = '1') then
  sum<='1';
  Cout<='0';
elsif (a = '0' and b = '1' and Cin = '0') then
  sum<='1';
  Cout<='0';
elsif (a = '0' and b = '1' and Cin = '1') then
  sum<='0';
  Cout<='1';  
elsif (a = '1' and b = '0' and Cin = '0') then
  sum<='1';
  Cout<='0';  
elsif (a = '1' and b = '0' and Cin = '1') then
  sum<='0';
  Cout<='1';
elsif (a = '1' and b = '1' and Cin = '0') then
  sum<='0';
  Cout<='1';  
else
   sum<='1';
  Cout<='1';
end if;
end process;                                  -- end process

end Behavioral;                               -- end functionality

