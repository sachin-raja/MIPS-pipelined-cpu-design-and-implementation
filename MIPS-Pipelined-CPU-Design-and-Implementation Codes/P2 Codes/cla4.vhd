----------------------------------------------------------------------------------
-- Create Date:    13:00:36 10/22/2019 
-- Name:           Shilpa Benarji
-- Module Name:    CLA_FA_4bit - Behavioral  
-- Description: Behavioral modelling of 4-bit carry look ahead adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CLA_FA_4bit is                                 --entity of 4-bit CLA
    Port ( A : in  STD_LOGIC_vector(3 downto 0);       --input port A of type STD_LOGIC_vector 
           B : in  STD_LOGIC_vector(3 downto 0);       --input port B of type STD_LOGIC_vector 
           Cin : in  STD_LOGIC;                        --carry in of type STD_LOGIC 
           S : out  STD_LOGIC_vector(3 downto 0);      --sum of type STD_LOGIC_vector 
           Cout : out  STD_LOGIC);                     --carry out of type STD_LOGIC 
end CLA_FA_4bit;

architecture Behavioral of CLA_FA_4bit is              --describing functionality of 4-bit CLA
Signal P, G : STD_LOGIC_vector(3 Downto 0);            --declaring signals for propogate and generate signals type STD_LOGIC_vector
Signal C: STD_LOGIC_vector(2 Downto 0);                --declaring signal for carry out of type STD_LOGIC_vector
begin
 G <= A AND B ;                --formula to compute generate signal
 P <= A XOR B ;                --formula to compute propogate signal
 
---carry out signals computed in advance using propogate, generate and carry in signals 
 C(0) <= G(0) OR (P(0) AND Cin);      
 C(1) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
 C(2) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
 Cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) and P(2) AND P(1) AND P(0) AND Cin);

---computing sum using inputs and carryout from previous computation
 S(0) <= A(0) XOR B(0) XOR Cin ;
 S(1) <= A(1) XOR B(1) XOR C(0) ;
 S(2) <= A(2) XOR B(2) XOR C(1) ;
 S(3) <= A(3) XOR B(3) XOR C(2) ;
 
end Behavioral;            --end of behavioral

