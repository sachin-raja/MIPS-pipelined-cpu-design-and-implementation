----------------------------------------------------------------------------------
-- Create Date:    13:24:16 10/22/2019 
-- Name:           Shilpa Benarji
-- Module Name:    CLA_FA_16bit - Structural  
-- Description: structural modelling of 16-bit carry look ahead adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA_FA_16bit is                                 --entity of 16-bit CLA
    Port ( a : in  STD_LOGIC_vector(15 downto 0);      --input port a of type STD_LOGIC_vector 
           b : in  STD_LOGIC_vector(15 downto 0);      --input port b of type STD_LOGIC_vector 
           cin : in  STD_LOGIC;                        --carry in of type STD_LOGIC
           s : out  STD_LOGIC_vector(15 downto 0);     --sum of type STD_LOGIC_vector 
           cout : out  STD_LOGIC);                      --carry out of type STD_LOGIC 
end CLA_FA_16bit;

architecture Structural of CLA_FA_16bit is           --describing functionality of 16-bit CLA
signal t1, t2, t3:std_logic;                         --declaring signals for transferring carry out from one adder to the next

component CLA_FA_4bit is                             --including structure of 4-bit CLA in 16-bit

 Port ( A : in  STD_LOGIC_vector(3 downto 0);         --input port A of type STD_LOGIC_vector          
           B : in  STD_LOGIC_vector(3 downto 0);      --input port B of type STD_LOGIC_vector 
           Cin : in  STD_LOGIC;                       --carry in of type STD_LOGIC
           S : out  STD_LOGIC_vector(3 downto 0);     --sum of type STD_LOGIC_vector
           Cout : out  STD_LOGIC);                    --carry out of type STD_LOGIC 
end component;                                        --end of component

begin
--calling 4-bit CLA 4 times to compute 16-bit CLA
cla0: CLA_FA_4bit port map (A(3 downto 0)=>a(3 downto 0), B(3 downto 0)=>b(3 downto 0), Cin=>cin, S(3 downto 0)=>s(3 downto 0), Cout=>t1);       --port mapping the inputs of 4-bit cla with 16-bit cla
cla1: CLA_FA_4bit port map (A(3 downto 0)=>a(7 downto 4), B(3 downto 0)=>b(7 downto 4), Cin=>t1, S(3 downto 0)=>s(7 downto 4), Cout=>t2);
cla2: CLA_FA_4bit port map (A(3 downto 0)=>a(11 downto 8), B(3 downto 0)=>b(11 downto 8), Cin=>t2, S(3 downto 0)=>s(11 downto 8), Cout=>t3);
cla3: CLA_FA_4bit port map (A(3 downto 0)=>a(15 downto 12), B(3 downto 0)=>b(15 downto 12), Cin=>t3, S(3 downto 0)=>s(15 downto 12), Cout=>cout);
end Structural;          --end of structure

