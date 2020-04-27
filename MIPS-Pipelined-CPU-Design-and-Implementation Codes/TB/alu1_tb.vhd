--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:59:12 11/24/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/alu1_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu1
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
 
ENTITY alu1_tb IS
END alu1_tb;
 
ARCHITECTURE behavior OF alu1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         alu_ctr : IN  std_logic_vector(5 downto 0);
         Co : OUT  std_logic;
         alu_res : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';
   signal alu_ctr : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Co : std_logic;
   signal alu_res : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu1 PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          alu_ctr => alu_ctr,
          Co => Co,
          alu_res => alu_res
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
		A <= '1';
		B <= '1';
		Cin <= '1';
		alu_ctr <= "100010";
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
