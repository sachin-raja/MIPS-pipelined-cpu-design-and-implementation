----------------------------------------------------------------------------------
-- Create Date:    21:58:02 10/21/2019 
-- Name:           Shilpa Benarji
-- Module Name:    Full_adder_32bit - Structural 
-- Description:    Structural modelling of 32-bit ripple carry adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_adder_32bit is                             --begin of entity of 32-bit adder
    Port ( X : in  STD_LOGIC_vector(31 downto 0);      --input X of 32-bit adder of type vector
           Y : in  STD_LOGIC_vector(31 downto 0);      --input Y of 32-bit adder of type vector
           Ci : in  STD_LOGIC;                          --carry in of 32-bit adder
           Sum : out  STD_LOGIC_vector(31 downto 0);    ---sum of 32-bit adder of type vector
           Co : out  STD_LOGIC);                        ---carry out of 32-bit adder
end Full_adder_32bit;                                   --end of entity 

architecture Structural of Full_adder_32bit is             --describes the functionality of 32-bit adder

signal t1,t2,t3,t4,t5,t6,t7:std_logic;                     --signals declared to carry the carry-out from one adder to the next adder

component full_addr_4bit is                              --adding component of 4-bit full adder to include its structure in 32-bit fa
Port ( A : in  STD_LOGIC_vector(3 downto 0);             --inputs of 4-bit fa
           B : in  STD_LOGIC_vector(3 downto 0);         --inputs of 4-bit fa
           C : in  STD_LOGIC;                             --carry in of 4-bit fa
           S : out  STD_LOGIC_vector(3 downto 0);          --sum of 4-bit fa
           Co : out  STD_LOGIC);                            --carry out of 4-bit fa
end component;                                             --ending component

begin
--calling 4-bit FA 8 times to compute 32-bit FA
fa0:full_addr_4bit port map (A(3 downto 0)=>X(3 downto 0), B(3 downto 0)=>Y(3 downto 0), C=>Ci, S(3 downto 0)=>Sum(3 downto 0), Co=>t1);    --portmapping the inputs and outputs of 4-bit FA to 32-bit FA
fa1:full_addr_4bit port map (A(3 downto 0)=>X(7 downto 4), B(3 downto 0)=>Y(7 downto 4), C=>t1, S(3 downto 0)=>Sum(7 downto 4), Co=>t2);
fa2:full_addr_4bit port map (A(3 downto 0)=>X(11 downto 8), B(3 downto 0)=>Y(11 downto 8), C=>t2, S(3 downto 0)=>Sum(11 downto 8), Co=>t3);
fa3:full_addr_4bit port map (A(3 downto 0)=>X(15 downto 12), B(3 downto 0)=>Y(15 downto 12), C=>t3, S(3 downto 0)=>Sum(15 downto 12), Co=>t4);
fa4:full_addr_4bit port map (A(3 downto 0)=>X(19 downto 16), B(3 downto 0)=>Y(19 downto 16), C=>t4, S(3 downto 0)=>Sum(19 downto 16), Co=>t5);
fa5:full_addr_4bit port map (A(3 downto 0)=>X(23 downto 20), B(3 downto 0)=>Y(23 downto 20), C=>t5, S(3 downto 0)=>Sum(23 downto 20), Co=>t6);
fa6:full_addr_4bit port map (A(3 downto 0)=>X(27 downto 24), B(3 downto 0)=>Y(27 downto 24), C=>t6, S(3 downto 0)=>Sum(27 downto 24), Co=>t7);
fa7:full_addr_4bit port map (A(3 downto 0)=>X(31 downto 28), B(3 downto 0)=>Y(31 downto 28), C=>t7, S(3 downto 0)=>Sum(31 downto 28), Co=>Co);

end Structural;                   --end of structure

