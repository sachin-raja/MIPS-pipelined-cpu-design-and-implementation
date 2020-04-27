
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Alu_control_tb IS
END Alu_control_tb;
 
ARCHITECTURE behavior OF Alu_control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu_control
    PORT(
         ALUop : IN  std_logic_vector(1 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         Alu_ctr : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUop : std_logic_vector(1 downto 0) := (others => '0');
   signal funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Alu_ctr : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu_control PORT MAP (
          ALUop => ALUop,
          funct => funct,
          Alu_ctr => Alu_ctr
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		ALUop <= "10";
		funct <= "100010";

      wait;
   end process;

END;
