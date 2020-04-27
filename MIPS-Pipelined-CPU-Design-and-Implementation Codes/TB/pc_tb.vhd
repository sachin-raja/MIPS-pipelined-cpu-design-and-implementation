LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pc_tb IS
END pc_tb;

ARCHITECTURE beh_pc_tb OF pc_tb IS
COMPONENT program_counter IS
   PORT (PC_in : IN std_logic_vector (31 DOWNTO 0); 
	 PC_ctrl, rst_bar : IN std_logic;
	 PC_out: OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

SIGNAL PC_ctrl, rst_bar : std_logic;
SIGNAL PC_in, PC_out : std_logic_vector(31 downto 0);

BEGIN
uut: program_counter PORT MAP (PC_in, PC_ctrl, rst_bar, PC_out);
stim_proc_pc : PROCESS
BEGIN
WAIT FOR 100 ns;
rst_bar <= '1';
PC_ctrl <= '1';
PC_in <= "00000000000000000000000001100000";
wait;
END PROCESS;
END beh_pc_tb;
