--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:12:35 11/23/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/mux1_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux1
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
 
ENTITY mux1_tb IS
END mux1_tb;
 
ARCHITECTURE behavior OF mux1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux1
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         Binv : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal Binv : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux1 PORT MAP (
          I0 => I0,
          I1 => I1,
          Binv => Binv,
          Y => Y
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
		Binv <= '0';
		I0 <= '1';
		I1 <= '0';
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
