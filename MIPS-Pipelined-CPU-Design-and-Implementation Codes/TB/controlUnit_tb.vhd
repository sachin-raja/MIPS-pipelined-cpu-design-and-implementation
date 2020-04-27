
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY controlUnit_tb IS
END controlUnit_tb;
 
ARCHITECTURE behavior OF controlUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controlUnit
    PORT(
         opcode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         jump : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemToReg : OUT  std_logic;
         ALUop : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal jump : std_logic;
   signal MemRead : std_logic;
   signal MemToReg : std_logic;
   signal ALUop : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal RegWrite : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controlUnit PORT MAP (
          opcode => opcode,
          RegDst => RegDst,
          jump => jump,
          MemRead => MemRead,
          MemToReg => MemToReg,
          ALUop => ALUop,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          RegWrite => RegWrite
        );

   -- Clock process definitions
--
 

   -- Stimulus process
   stim_proc: process
   begin		

		opcode <= "001101"; ----------ori
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
