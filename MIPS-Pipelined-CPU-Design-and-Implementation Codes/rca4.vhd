----------------------------------------------------------------------------------
-- Create Date:    22:55:39 10/20/2019 
-- Name:           Shilpa Benarji
-- Module Name:    Full_addr_4bit - Structural  
-- Description:    Structural modelling of 4-bit ripple carry adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_addr_4bit is                                 --begin of entity of 4-bit FA
    Port ( A : in  STD_LOGIC_vector(3 downto 0);         --input A of 4-bit FA of type vector
           B : in  STD_LOGIC_vector(3 downto 0);         --input B of 4-bit FA of type vector
           C : in  STD_LOGIC;                            --carry in of 4-bit FA
           S : out  STD_LOGIC_vector(3 downto 0);        --Sum of 4-bit FA of type vector
           Co : out  STD_LOGIC);                         --carry out of 4-bit FA 
end Full_addr_4bit;

architecture Structural of Full_addr_4bit is            --describes the functionality of 4-bit fa

signal temp1,temp2,temp3:std_logic;                    --signals declared to carry the carry-out from one adder to the next adder

component Full_addr_1bit is                            --adding component of 1-bit full adder to include its structure in 4-bit fa
Port ( a : in  STD_LOGIC;                              --inputs of 1-bit fa
           b : in  STD_LOGIC;                          --inputs of 1-bit fa
           Cin : in  STD_LOGIC;                        --carry in of 1-bit fa
           sum : out  STD_LOGIC;                       --sum of 1-bit fa
           Cout : out  STD_LOGIC);                     --carry-out of 1-bit fa
end component;                                         --end component of 1-bit fa

begin
--calling 1-bit FA 4 times to compute 4-bit FA
fa0:Full_addr_1bit port map (a=>A(0), b=>B(0), Cin=>C, sum=>S(0), Cout=>temp1);    --calling 1-bit FA and passing inputs from 4-bit FA
fa1:Full_addr_1bit port map (a=>A(1), b=>B(1), Cin=>temp1, sum=>S(1), Cout=>temp2);
fa2:Full_addr_1bit port map (a=>A(2), b=>B(2), Cin=>temp2, sum=>S(2), Cout=>temp3);
fa3:Full_addr_1bit port map (a=>A(3), b=>B(3), Cin=>temp3, sum=>S(3), Cout=>Co);
end Structural;                                                                    -- end of structure

