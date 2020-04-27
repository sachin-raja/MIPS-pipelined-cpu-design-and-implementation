
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu32 is                                        --------entity of alu 
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
           alu_res : out  STD_LOGIC_VECTOR (31 downto 0);
           Co : out  STD_LOGIC;
           alu_ctr : in  STD_LOGIC_VECTOR (3 downto 0));   ---alu_ctr 
end alu32;

architecture Behavioral of alu32 is

COMPONENT CLA_FA_32bit IS
   Port ( X : in  STD_LOGIC_vector(31 downto 0);             --input port X of type STD_LOGIC_vector
           Y : in  STD_LOGIC_vector(31 downto 0);             --input port Y of type STD_LOGIC_vector
           C : in  STD_LOGIC;                                 --carry in of type STD_LOGIC
           Sum : out  STD_LOGIC_vector(31 downto 0);          --sum of type STD_LOGIC_vector 
           Co : out  STD_LOGIC);  
END COMPONENT;

COMPONENT Full_adder_32bit IS
   Port ( X : in  STD_LOGIC_vector(31 downto 0);      --input X of 32-bit adder of type vector
           Y : in  STD_LOGIC_vector(31 downto 0);      --input Y of 32-bit adder of type vector
           Ci : in  STD_LOGIC;                          --carry in of 32-bit adder
           Sum : out  STD_LOGIC_vector(31 downto 0);    ---sum of 32-bit adder of type vector
           Co : out  STD_LOGIC);   
END COMPONENT;

COMPONENT andGate IS                                    ----calling and gate as component
  Port ( a : in  STD_LOGIC_vector(31 downto 0);
           b : in  STD_LOGIC_vector(31 downto 0);
           c : out STD_LOGIC_vector(31 downto 0));
END COMPONENT;

COMPONENT orGate IS                                       ----calling or gate as component
   Port ( x : in  STD_LOGIC_vector(31 downto 0);
           y : in  STD_LOGIC_vector(31 downto 0);
           z : out STD_LOGIC_vector(31 downto 0));
END COMPONENT;

COMPONENT invGate IS                                       ----calling invert gate as component
      Port ( i1 : in  STD_LOGIC_vector(31 downto 0);
           i2 : out  STD_LOGIC_vector(31 downto 0));
END COMPONENT;

COMPONENT mux2 IS                                            ----calling mux  as component
     Port ( i0 : in  STD_LOGIC_vector(31 downto 0);
           i1 : in  STD_LOGIC_vector(31 downto 0);
           i2 : in  STD_LOGIC_vector(31 downto 0);
			  i3 : in  STD_LOGIC_vector(31 downto 0);
			  i4 : in  STD_LOGIC_vector(31 downto 0);
			  i5 : in  STD_LOGIC_vector(31 downto 0);
           s2 : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_vector(31 downto 0));
END COMPONENT;

SIGNAL t0:  STD_LOGIC_VECTOR (2 downto 0);     ---selection of mux2
SIGNAL t1, t2, t3, t5, t6, t8, s1 : STD_LOGIC_vector(31 downto 0); ----declaring signals to pass values
SIGNAL t4, t7, t9 : std_logic;
begin

x : invGate port map (B , t6);         --- invert operation
u0 : andGate port map ( A, B, t1);     --- and operation
u1 : orGate port map ( A, B, t2);      --- invert operation
u3_cla_add : CLA_FA_32bit port map ( A, B, Cin, t3, t4);      --cla adder
u3_rca_sub : Full_adder_32bit port map ( A, t6, Cin, t5, t7); ----------rca adder for substraction
u4_rca_add : Full_adder_32bit port map ( A, B, Cin, t8, t9);    -------rca adder for addition
s1 <= A NOR B;                           ---nor operation

process (alu_ctr, t0)
begin
if (alu_ctr = "0000") then                 ----and
  t0 <= "000";                            ---t0 selection of mux
  Co <= '0';
elsif (alu_ctr = "0001") then              --or
  t0 <= "001";
  Co <= '0';
elsif (alu_ctr = "0010") then              --add (rca)
  t0 <= "100";
  Co <= t9;	
elsif (alu_ctr = "0011") then              --select (cla)
  t0 <= "010";
  Co <= t4;
elsif (alu_ctr = "0110") then               --sub 
  t0 <= "011";
  Co <= '0';   
elsif (alu_ctr = "0111") then               --slt 
 t0 <= "111"; 
 Co <= '0';   
end if;
end process;  


u4 : mux2 port map (t1, t2, t3, t5, t8, s1, t0, alu_res);    -----call mux for selection of alu result
end Behavioral;

