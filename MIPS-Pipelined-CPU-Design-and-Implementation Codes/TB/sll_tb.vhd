LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sll_tb IS
END sll_tb;

ARCHITECTURE beh_sll_tb OF sll_tb IS

COMPONENT shift_left_2
PORT(sll_in : IN std_logic_vector (25 DOWNTO 0);
     sll_out : OUT std_logic_vector (27 DOWNTO 0));
END COMPONENT;

--Inputs
SIGNAL sll_in : std_logic_vector (25 DOWNTO 0);
 
--Outputs
SIGNAL sll_out : std_logic_vector (27 DOWNTO 0);

BEGIN

uut: shift_left_2 PORT MAP (
sll_in => sll_in,
sll_out => sll_out
);

stim_proc_shift_left_2: PROCESS
BEGIN

WAIT FOR 100 ns;
 
sll_in <= "11011001011000111011001000";
WAIT;
END PROCESS;
END;
 

