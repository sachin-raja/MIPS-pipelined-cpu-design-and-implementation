--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:41:14 12/05/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/sign_extend_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sign_extend
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sign_extend_tb IS
END sign_extend_tb;
 
ARCHITECTURE behavior OF sign_extend_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_extend
    PORT(
         sign_extend_in : IN  std_logic_vector(15 downto 0);
         sign_extend_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sign_extend_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal sign_extend_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extend PORT MAP (
          sign_extend_in => sign_extend_in,
          sign_extend_out => sign_extend_out
        );

--   -- Clock process definitions
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
   sign_extend_in <= "0000100001111101";
  --    wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
