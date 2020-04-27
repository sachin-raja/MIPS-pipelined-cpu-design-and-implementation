--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:47 12/05/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/Alu_control_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu_control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
--      ALUop <= "10";
--		funct <= "100000";
		
		ALUop <= "10";
		funct <= "100010";
--		
--		ALUop <= "10";
--		funct <= "100111";
--		
--		ALUop <= "00";
		
     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
