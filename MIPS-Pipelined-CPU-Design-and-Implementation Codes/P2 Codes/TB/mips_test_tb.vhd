LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mips_test_tb IS
END mips_test_tb;
 
ARCHITECTURE behavior OF mips_test_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mips_test
    PORT(
         PC : IN  std_logic_vector(31 downto 0);
         op : OUT  std_logic_vector(5 downto 0);
         reg_s : OUT  std_logic_vector(4 downto 0);
         reg_t : OUT  std_logic_vector(4 downto 0);
         reg_d : OUT  std_logic_vector(4 downto 0);
         function_1 : OUT  std_logic_vector(5 downto 0);
         RegDst_1 : OUT  std_logic;
         jump_1 : OUT  std_logic;
         MemRead_1 : OUT  std_logic;
         MemToReg_1 : OUT  std_logic;
         ALUop_1 : OUT  std_logic_vector(1 downto 0);
         MemWrite_1 : OUT  std_logic;
         ALUSrc_1 : OUT  std_logic;
         RegWrite_1 : OUT  std_logic;
			--alu_control_sig : out  STD_LOGIC_VECTOR (3 downto 0);
			  imm_1 : out  STD_LOGIC_VECTOR (15 downto 0);
			  A : out  STD_LOGIC_VECTOR (31 downto 0);
			  B : out  STD_LOGIC_VECTOR (31 downto 0);
         alu_res : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal op : std_logic_vector(5 downto 0);
   signal reg_s : std_logic_vector(4 downto 0);
   signal reg_t : std_logic_vector(4 downto 0);
   signal reg_d : std_logic_vector(4 downto 0);
   signal function_1 : std_logic_vector(5 downto 0);
   signal RegDst_1 : std_logic;
   signal jump_1 : std_logic;
   signal MemRead_1 : std_logic;
   signal MemToReg_1 : std_logic;
   signal ALUop_1 : std_logic_vector(1 downto 0);
   signal MemWrite_1 : std_logic;
   signal ALUSrc_1 : std_logic;
   signal RegWrite_1 : std_logic;
	--signal       alu_control_sig : STD_LOGIC_VECTOR (3 downto 0);
   signal			  imm_1 : STD_LOGIC_VECTOR (15 downto 0);
	signal		  A : STD_LOGIC_VECTOR (31 downto 0);
	signal		  B : STD_LOGIC_VECTOR (31 downto 0);
   signal alu_res : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mips_test PORT MAP (
          PC => PC,
          op => op,
          reg_s => reg_s,
          reg_t => reg_t,
          reg_d => reg_d,
          function_1 => function_1,
          RegDst_1 => RegDst_1,
          jump_1 => jump_1,
          MemRead_1 => MemRead_1,
          MemToReg_1 => MemToReg_1,
          ALUop_1 => ALUop_1,
          MemWrite_1 => MemWrite_1,
          ALUSrc_1 => ALUSrc_1,
          RegWrite_1 => RegWrite_1,
			-- alu_control_sig => alu_control_sig,
			 A => A ,
			 B => B,
			 imm_1 => imm_1,
			 
          alu_res => alu_res
        );


   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		PC <= "00000000000000000000000000000000";
      wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
