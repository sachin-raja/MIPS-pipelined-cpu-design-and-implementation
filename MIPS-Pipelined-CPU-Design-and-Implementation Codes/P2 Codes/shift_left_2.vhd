LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY shift_left_2 IS         ------------entity of shift left 2 
PORT (sll_in : IN std_logic_vector (25 DOWNTO 0);        --------input and output ports declared
      sll_out : OUT std_logic_vector (27 DOWNTO 0));
END shift_left_2;

ARCHITECTURE behaviour OF shift_left_2 IS
 BEGIN
  sll_out (27 DOWNTO 2) <= sll_in (25 DOWNTO 0);         -----move upper 25-bits to output
  sll_out (1 DOWNTO 0) <= "00";                          ---append 00 at lower end
 END behaviour;