 ----------------------------------------------------------------------------------
-- Create Date:    14:04:07 10/22/2019 
-- Name:           Shilpa Benarji
-- Module Name:    CLA_FA_32bit - Structural  
-- Description: structural modelling of 32-bit carry look ahead adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CLA_FA_32bit is                                        --entity of 16-bit CLA               
    Port ( X : in  STD_LOGIC_vector(31 downto 0);             --input port X of type STD_LOGIC_vector
           Y : in  STD_LOGIC_vector(31 downto 0);             --input port Y of type STD_LOGIC_vector
           C : in  STD_LOGIC;                                 --carry in of type STD_LOGIC
           Sum : out  STD_LOGIC_vector(31 downto 0);          --sum of type STD_LOGIC_vector 
           Co : out  STD_LOGIC);                              --carry out of type STD_LOGIC 
end CLA_FA_32bit;

architecture structural of CLA_FA_32bit is              --describing functionality of 32-bit CLA
signal t1:std_logic;                                    --declaring signals for transferring carry out from one adder to the next

component CLA_FA_16bit is                               --including structure of 16-bit CLA in 32-bit

 Port ( a : in  STD_LOGIC_vector(15 downto 0);          --input port a of type STD_LOGIC_vector
           b : in  STD_LOGIC_vector(15 downto 0);        --input port b of type STD_LOGIC_vector
           cin : in  STD_LOGIC;                         --carry in of type STD_LOGI
           s : out  STD_LOGIC_vector(15 downto 0);        --sum of type STD_LOGIC_vector 
           cout : out  STD_LOGIC);                       --carry out of type STD_LOGIC
end component;

begin
--calling 16-bit CLA 2 times to compute 32-bit CLA
cla0:CLA_FA_16bit port map (a(15 downto 0)=>X(15 downto 0), b(15 downto 0)=>Y(15 downto 0), cin=>C, s(15 downto 0)=>Sum(15 downto 0), Cout=>t1);
cla1:CLA_FA_16bit port map (a(15 downto 0)=>X(31 downto 16), b(15 downto 0)=>Y(31 downto 16), cin=>t1, s(15 downto 0)=>Sum(31 downto 16), Cout=>Co);
end structural;    --end of structure

