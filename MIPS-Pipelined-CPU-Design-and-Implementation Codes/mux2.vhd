----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:05 11/23/2019 
-- Design Name: 
-- Module Name:    mux2 - Behavioral 
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

entity mux2 is
    Port ( i0 : in  STD_LOGIC_vector(31 downto 0);
           i1 : in  STD_LOGIC_vector(31 downto 0);
           i2 : in  STD_LOGIC_vector(31 downto 0);
			  i3 : in  STD_LOGIC_vector(31 downto 0);
			  i4 : in  STD_LOGIC_vector(31 downto 0);
			  i5 : in  STD_LOGIC_vector(31 downto 0); --------slt
           s2 : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_vector(31 downto 0));
end mux2;

architecture Behavioral of mux2 is

begin
with s2 select
 y <= i0 when "000",    --and
      i1 when "001",    --or
		i2 when "010",    --cla
		i3 when "011",     --sub
		i5 when "111",     --slt
		i4 when others; --rca

end Behavioral;

