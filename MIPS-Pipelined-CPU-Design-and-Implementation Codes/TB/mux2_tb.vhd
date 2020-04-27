--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:36:15 11/24/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/mux2_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2
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
 
ENTITY mux2_tb IS
END mux2_tb;
 
ARCHITECTURE behavior OF mux2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2
    PORT(
         i0 : IN  std_logic_vector(31 downto 0);
         i1 : IN  std_logic_vector(31 downto 0);
         i2 : IN  std_logic_vector(31 downto 0);
         i3 : IN  std_logic_vector(31 downto 0);
         s2 : IN  std_logic_vector(2 downto 0);
         y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic_vector(31 downto 0) := (others => '0');
   signal i1 : std_logic_vector(31 downto 0) := (others => '0');
   signal i2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i3 : std_logic_vector(31 downto 0) := (others => '0');
   signal s2 : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2 PORT MAP (
          i0 => i0,
          i1 => i1,
          i2 => i2,
          i3 => i3,
          s2 => s2,
          y => y
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		i0 <= "00000000000000000000000000000000";
		i1 <= "00000000000000000000000000000000";
		i2 <= "00000000000000000000000000000000";
		i3 <= "11111111111111111111111111111111";
		s2 <= "011";
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
