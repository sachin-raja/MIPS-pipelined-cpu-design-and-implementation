--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:26:43 12/05/2019
-- Design Name:   
-- Module Name:   F:/M.S 1st semester/computer design/Project_2/mux_write_tb.vhd
-- Project Name:  Project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_write
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
 
ENTITY mux_write_tb IS
END mux_write_tb;
 
ARCHITECTURE behavior OF mux_write_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_write
    PORT(
         Reg_in_0 : IN  std_logic_vector(31 downto 0);
         MemToReg : IN  std_logic;
         Reg_in_1 : IN  std_logic_vector(31 downto 0);
         Reg_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reg_in_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal MemToReg : std_logic := '0';
   signal Reg_in_1 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Reg_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_write PORT MAP (
          Reg_in_0 => Reg_in_0,
          MemToReg => MemToReg,
          Reg_in_1 => Reg_in_1,
          Reg_out => Reg_out
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
		Reg_in_0 <= "00000000000000000000000000000000";		
      Reg_in_1 <= "11111111111111111111111111111111";
		 MemToReg <= '1';
      wait for 100 ns;	

   --   wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
