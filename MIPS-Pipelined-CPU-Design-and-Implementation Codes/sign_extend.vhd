LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sign_extend IS                 ------entity of sign extension
PORT (sign_extend_in : IN std_logic_vector (15 DOWNTO 0); --input and output ports declared
      sign_extend_out : OUT std_logic_vector (31 DOWNTO 0));
END sign_extend;

ARCHITECTURE behaviour OF sign_extend IS
 BEGIN
   sign_extend_out (15 DOWNTO 0) <= sign_extend_in;            
   sign_extend_out (31 DOWNTO 16) <= "0000000000000000";       ------extend the 16-bit input to 32-bit
 END behaviour;