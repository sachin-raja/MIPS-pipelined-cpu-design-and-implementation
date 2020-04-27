LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mips_test is                                       --entity of MIPS
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);         ---input and output ports
	        op : out  STD_LOGIC_VECTOR (5 downto 0);
			  reg_s: out  STD_LOGIC_VECTOR (4 downto 0);
			  reg_t: out  STD_LOGIC_VECTOR (4 downto 0);
			  reg_d: out  STD_LOGIC_VECTOR (4 downto 0);
			  function_1: out  STD_LOGIC_VECTOR (5 downto 0);
			  RegDst_1 : out  STD_LOGIC;
           jump_1 : out  STD_LOGIC;
           MemRead_1 : out  STD_LOGIC;
           MemToReg_1 : out  STD_LOGIC;
           ALUop_1 : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite_1 : out  STD_LOGIC;
           ALUSrc_1 : out  STD_LOGIC;
           RegWrite_1 : out  STD_LOGIC;
			  imm_1 : out  STD_LOGIC_VECTOR (15 downto 0);
			  A : out  STD_LOGIC_VECTOR (31 downto 0);
			  B : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_res : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end mips_test;

architecture Behavioral of mips_test is

COMPONENT program_counter IS                             --adding program counter
  PORT (PC_in : IN std_logic_vector (31 DOWNTO 0); 
	 PC_ctrl, rst_bar : IN std_logic;
	 PC_out: OUT std_logic_vector(31 DOWNTO 0));  
END COMPONENT;

COMPONENT inst_reg IS                                     --adding componenet instruction register
Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
   
END COMPONENT;

COMPONENT AddPc  IS                                      --adding components for adding PC
  Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           c : out  STD_LOGIC_VECTOR (31 downto 0)); 
END COMPONENT;

COMPONENT shift_left_2 IS                               --adding component shift left 2 register
PORT (sll_in : IN std_logic_vector (25 DOWNTO 0);
      sll_out : OUT std_logic_vector (27 DOWNTO 0));
END COMPONENT;
   
COMPONENT Alu_control IS                                 --adding component alu control
Port ( ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           Alu_ctr : out  STD_LOGIC_VECTOR (3 downto 0));
   
END COMPONENT;

COMPONENT Registers IS                                  --adding component register
   Port ( read_reg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_reg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_reg : in  STD_LOGIC_VECTOR (4 downto 0);
           Regwrite : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           read_data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data2 : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT mux_reg IS                                        --ading mux
Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (4 downto 0));
   
END COMPONENT;

COMPONENT sign_extend IS                                        --adding sign extension
   PORT (sign_extend_in : IN std_logic_vector (15 DOWNTO 0);
      sign_extend_out : OUT std_logic_vector (31 DOWNTO 0));
END COMPONENT;

COMPONENT mux_alu IS                                           --adding alu
   Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUSrc : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT controlUnit IS                                    ---adding control units
   Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
END COMPONENT;

COMPONENT alu32 IS                                       ----adding alu 32
   Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cin : in  STD_LOGIC;
			 -- alu_cla : in  STD_LOGIC;
           alu_res : out  STD_LOGIC_VECTOR (31 downto 0);
           Co : out  STD_LOGIC;
           alu_ctr : in  STD_LOGIC_VECTOR (3 downto 0));   ---alu_ctr 
END COMPONENT;

COMPONENT mux_jump IS                                   -------adding mux
  Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           jump : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
   
END COMPONENT;

COMPONENT mux_write IS                               
  Port ( Reg_in_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           MemToReg : in  STD_LOGIC;
           Reg_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Reg_out : out  STD_LOGIC_VECTOR (31 downto 0));
   
END COMPONENT;
-------------------declaring signals----------------------------
signal pc_in1, pc_in2, instr, add_out ,data1, data2, regout, imm_out, a1, a2 : STD_LOGIC_vector(31 downto 0);
signal opcode, funct : STD_LOGIC_vector(5 downto 0);
signal rs, rt, rd, reg_out: STD_LOGIC_vector(4 downto 0);
signal imm : STD_LOGIC_vector(15 downto 0);
signal imm_jump : STD_LOGIC_vector(25 downto 0);
signal imm_jump_out : STD_LOGIC_vector(27 downto 0);
signal Alu_ctr : STD_LOGIC_vector(3 downto 0);
---------------outputs from control----------------
signal RegDst, jump, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, cin, co :   STD_LOGIC;           
signal ALUop :   STD_LOGIC_VECTOR (1 downto 0);
---------------outputs from control----------------

begin
pc_in1 <= PC;                                       ---moving PC to pc_in1
pc_in2 <= "00000000000000000000000000000100";        --declaring constant for incrementing PC
cin <= '0';


-----------------------Instruction fetch---------------------------
u0 : inst_reg port map ( pc_in1, instr);             --- fetching intruction from instruction register
u1 : AddPc port map (pc_in1, pc_in2, add_out );      --incrementing PC with PC+4
---------------------Instruction fetch----------------------------

-------------------Instruction decode--------------------------------
opcode <= instr (31 downto 26);                  --------obtaining opcode from instruction
rs <= instr (25 downto 21);                      --------obtaining source register address from instruction
rt <= instr (20 downto 16);                     --------obtaining source reg 2 from instruction
rd <= instr (15 downto 11);                       --------obtaining destination register from instruction
funct <= instr (5 downto 0);                    --------obtaining function from instruction
imm <= instr (15 downto 0);                      --------obtaining immidiate value from instruction
imm_jump <= instr (25 downto 0);              --------obtaining immidiate value for jump from instruction


op <= opcode;                             --display opcode
reg_s <= rs;                             --display source register
reg_t <= rt;                             ---display source reg 2
reg_d <= rd;                             ---display destination register
function_1 <= funct;                     ---display function



u2 : controlUnit port map (opcode, RegDst, jump, MemRead, MemToReg, ALUop, MemWrite, ALUSrc, RegWrite); --call control unit

--------display following signals--------------
RegDst_1 <= RegDst;
jump_1 <= jump;
MemRead_1 <= MemRead;
MemToReg_1 <= MemToReg;
ALUop_1 <= ALUop;
MemWrite_1 <= MemWrite;
ALUSrc_1 <= ALUSrc;
RegWrite_1 <= RegWrite;

u4: mux_reg port map (rt, RegDst, rd, reg_out);   ---call mux
u3: Registers port map (rs, rt, data1, data2);     ---call registers for register values
u5: sign_extend port map (imm, imm_out);             ---convert 16 bit immediate value to 32-bit
u6: shift_left_2 port map (imm_jump, imm_jump_out);  ---shift left immediate value by 2
u7: Alu_control port map ( ALUop, funct, alu_ctr);     --call alu control 

--alu_control_sig <= alu_ctr;
imm_1 <= imm;                                        --display immediate value
a1 <= data1 (31 downto 0);                          --display data in source register 1
A <= a1;                                            
B <= data2;                                          --display data in source register 2
--------------------Instruction decode-----------------------------

-------------------execution stage----------------------------
u8: mux_alu port map (data2, ALUSrc, imm_out, regout);        ---call mux
u9: alu32 port map ( data1, regout, cin, alu_res, co, alu_ctr);  ---call alu32
-------------------execution stage--------------------------------
-------------------memory stage---------------------------
U3: mem PORT MAP (MemRead, MemWrite, mux1, b, memdata);   --calling memory
------------------memory stage---------------------------

-------------write back stage--------------------------
U4: inst_reg PORT MAP (memdata, MemRead, i1, i2, i3, i4); ---calling intrsuction reg
--------------write back stage----------------------
end Behavioral;

