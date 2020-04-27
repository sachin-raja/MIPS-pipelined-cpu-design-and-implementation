----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:35:56 11/23/2019 
-- Design Name: 
-- Module Name:    invGate - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
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

entity invGate is
    Port ( i1 : in  STD_LOGIC_vector(31 downto 0);
           i2 : out  STD_LOGIC_vector(31 downto 0));
end invGate;

architecture Behavioral of invGate is

begin
 i2 <= not i1;

end Behavioral;

