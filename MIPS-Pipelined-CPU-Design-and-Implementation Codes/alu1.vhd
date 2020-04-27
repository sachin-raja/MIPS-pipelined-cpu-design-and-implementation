----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:43 11/23/2019 
-- Design Name: 
-- Module Name:    alu1 - Behavioral 
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

entity alu1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  Cin : in  STD_LOGIC;
          alu_ctr : in  STD_LOGIC_VECTOR (5 downto 0);
           Co : out  STD_LOGIC;
           alu_res : out   STD_LOGIC);
end alu1;

architecture Behavioral of alu1 is
COMPONENT andGate IS
  Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
END COMPONENT;

COMPONENT orGate IS
   Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : out  STD_LOGIC);
END COMPONENT;

COMPONENT invGate IS
     Port ( i1 : in  STD_LOGIC;
           i2 : out  STD_LOGIC);
END COMPONENT;

COMPONENT mux1 IS
  Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           Binv : in  STD_LOGIC;
           Y : out  STD_LOGIC);
END COMPONENT;

COMPONENT mux2 IS
   Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
			  i3 : in  STD_LOGIC;
           s2 : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC);
END COMPONENT;

COMPONENT rcaAdder1 IS
      Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
			  sum: out  STD_LOGIC);
END COMPONENT;

SIGNAL t1, t2, t3, t4, t5, t6, t7 : std_logic;
SIGNAL t0:  STD_LOGIC_VECTOR (2 downto 0);
--SIGNAL t0: out std_logic;
--SIGNAL c : std_logic;


begin
x : invGate port map (B , t6);
u0 : andGate port map ( A, B, t1);
u1 : orGate port map ( A, B, t2);
u3_add : rcaAdder1 port map ( A, B, Cin, t4, t3);
u3_sub : rcaAdder1 port map ( A, t6, Cin, t7, t5);
process (alu_ctr, t0)
begin
if (alu_ctr = "100100") then
  t0 <= "000";
--  Cin <= '0';
  Co <= '0';
elsif (alu_ctr = "100101") then 
  t0 <= "001";
--  Cin <= '0';
  Co <= '0';
elsif (alu_ctr = "100000") then  
  t0 <= "010";
  Co <= t4;
elsif (alu_ctr = "100010") then  
  t0 <= "011";
  Co <= t7;  
end if;
end process;  


u4 : mux2 port map (t1, t2, t3, t5, t0, alu_res);



end Behavioral;

