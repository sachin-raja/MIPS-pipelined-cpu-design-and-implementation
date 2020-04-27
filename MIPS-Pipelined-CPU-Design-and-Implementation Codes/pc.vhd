LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY program_counter IS                 ---entity of program counter
   PORT (PC_in : IN std_logic_vector (31 DOWNTO 0); ---input and output ports declared 
	 PC_ctrl, rst_bar : IN std_logic;
	 PC_out: OUT std_logic_vector(31 DOWNTO 0));
END program_counter;

ARCHITECTURE beh_program_counter OF program_counter IS
BEGIN
   PROCESS(pc_ctrl, rst_bar)        -----start process 
    VARIABLE pc : std_logic_vector(31 DOWNTO 0) := "00000000000000000000000000000000";   --initialize PC
    VARIABLE pc_1 : std_logic_vector(31 DOWNTO 0) := "00000000000000000000000000000000";
    VARIABLE a : std_logic := '1';
    BEGIN
    IF (rst_bar = '0') THEN        --if restart bar 0 initialize PC
		pc := (OTHERS => '0'); 
    ELSIF (PC_ctrl = '1') THEN      ---if pc_ctrl 1 the new PC is updated with previous PC
		pc_1 := PC_in;
		a := '1'; 
    END IF;
    IF (a = '1') THEN
    pc := pc_1;
    a := '0';
    ELSE
    pc := pc + "00000000000000000000000000000000"; ----------update PC
    END IF;  
    PC_out <= pc;      --------move output of PC

   END PROCESS;

END beh_program_counter;