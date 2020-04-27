
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all; 

entity alu32_mips is                                  ----entity of alu-32 bit
	PORT(
    	   opcode : IN STD_LOGIC_VECTOR(31 DOWNTO 0);      --input and output ports
    	   npc: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        IMM : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        PIPELINE_FREEZE: IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
        O : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
        HI: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
        LO: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        EX_MEM_B:OUT std_logic_Vector(31 downto 0);
        BRANCH_CON: OUT STD_LOGIC;
        BRANCH_ADDR: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        IS_BRANCH: OUT STD_LOGIC;
	      EXM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end alu32_mips; 


architecture behaviour of alu32_mips is 
-- initialize result to 0 
SIGNAL result : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0'); 
SIGNAL hiRegister : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
SIGNAL loRegister : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
Signal i:integer:=0;


begin
	alu_work : process(opcode)
	VARIABLE result64 : STD_LOGIC_VECTOR(63 DOWNTO 0) := (OTHERS => '0') ;
	
    	begin
    	  
        -- ARITHMETIC FUNCTIONS --
        	--add--
      IF PIPELINE_FREEZE/='1' THEN
        	  if opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100000" then
            	O <= STD_LOGIC_VECTOR(signed(A) + signed(B)); 
            		EX_MEM_B<=B;
            --addi--
            elsif opcode(31 DOWNTO 26) = "001000" then 
              	EX_MEM_B<=B;
            	O <= STD_LOGIC_VECTOR(signed(A) + signed(IMM)); 
            	--load and stores
          	elsif opcode(31 downto 26)="101011" or opcode(31 downto 26)="100011" then
          	   EX_MEM_B<=B;
          	   O<=STD_LOGIC_VECTOR(signed(A) + signed(IMM));
            --sub--
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100010" then 
            		EX_MEM_B<=B;
            	O <= STD_LOGIC_VECTOR(signed(A) - signed(B)); 
            --mult-- 
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "011000" then 
		            	EX_MEM_B<=B;
		            result64 := STD_LOGIC_VECTOR(signed(A) * signed(B));
                hiRegister <= result64(63 DOWNTO 32); 
                loRegister <= result64(31 DOWNTO 0); 
                O <= result64(31 DOWNTO 0); 
            --div-- 
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "011010" then 
            	   	EX_MEM_B<=B;
            	   O <= STD_LOGIC_VECTOR(signed(A) / signed(B));
                hiRegister <= STD_LOGIC_VECTOR(signed(A) rem signed(B)); 
                loRegister <= STD_LOGIC_VECTOR(signed(A) / signed(B));
                
       --SET ON FUNCTIONS--
       		--slt--
       		elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "101010" then 
            	if signed(A) < signed (B) then
                	EX_MEM_B<=B;
                	O <= (31 DOWNTO 1 => '0', 0 => '1'); 
                else
                		EX_MEM_B<=B;
                	O <= (others =>'0'); 
                end if; 
            --slti--
            elsif opcode(31 DOWNTO 26) = "001010" then 
            	if signed(A) < signed (IMM) then
                	EX_MEM_B<=B;
                	O <= (31 DOWNTO 1 => '0', 0 => '1'); 
                else
                		EX_MEM_B<=B;
                	O <= (others =>'0'); 
                end if; 
           
            
        --BOOLEAN LOGIC FUNCTIONS-- 
        	--and--
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100100" then 
            		EX_MEM_B<=B;
            	O <= A and B; 
            --or-- 
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100101" then 
            		EX_MEM_B<=B;
            	O <= A or B; 
            --nor--
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100111" then 
            		EX_MEM_B<=B;
            	O <= A nor B; 
            --xor-- 
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "100110" then 
            		EX_MEM_B<=B;
            	O <= A xor B;
            --andi-- 
            elsif opcode(31 DOWNTO 26) = "001100" then 
            		EX_MEM_B<=B;
            	O <= A and IMM; 
            --ori-- 
            elsif opcode(31 DOWNTO 26) = "001101" then 
            		EX_MEM_B<=B;
            	O <= A or IMM; 
            --xori--
            elsif opcode(31 DOWNTO 26) = "001110" then 
            		EX_MEM_B<=B;
            	O <= A xor IMM; 
         
         
         --SHIFTING FUNCTIONS-- 
         	--sll--
         	elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "000000" then 
            		EX_MEM_B<=B;
            	O <= STD_LOGIC_VECTOR(signed(A) sll to_integer(signed(B))); 
            --srl--
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "000010" then 
            		EX_MEM_B<=B;
            	O <= STD_LOGIC_VECTOR(signed(A) srl to_integer(signed(B))); 
            --sra--
            elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 DOWNTO 0) = "000011" then 
            		EX_MEM_B<=B;
            	O <= shr(A,opcode( 10 DOWNTO 6)); 
         --MOVE INSTRUCTIONS--
         
         --mflo-- 
         elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 downto 0)="010010" then
         		EX_MEM_B<=B;
         	O <= LO; 
         --mfhi-- 
         elsif opcode(31 DOWNTO 26) = "000000" and opcode(5 downto 0)="010000" then 
         		EX_MEM_B<=B;
         	O <= HI;
	     --lui-- 
	     elsif opcode(31 DOWNTO 26) = "001111" then 
		    	EX_MEM_B<=B;
		    o <= STD_LOGIC_VECTOR(signed(IMM) sll 16);
         --incase of a branch just output 0--
            else 
           			EX_MEM_B<=B;
           		O <= (OTHERS => '0');
            end if; 

    END IF;
     	  HI <= hiRegister; 
  	     LO <= loRegister; 
  	     EXM <= opcode;
    end process alu_work; 
    
    branch_jump:process(opcode)
      variable x: std_logic_Vector(31 downto 0);
      begin
        
        --branch on equal
     IF PIPELINE_FREEZE/='1' THEN   
          if(opcode(31 downto 26)="000100") then
          IS_BRANCH<='1';
          if(A=B) then
            BRANCH_CON<='1';
             x:=to_stdlogicvector(to_bitvector(imm) sll 2);
            BRANCH_ADDR<=std_logic_vector(signed(NPC) + signed(x)+4);
          else
            BRANCH_CON<='0';
            BRANCH_ADDR<=NPC+4;
        end if;
        
        --branch not equal
        elsif (opcode(31 downto 26)="000101") then
           IS_BRANCH<='1';
          if(A/=B) then
            BRANCH_CON<='1';
            x:=to_stdlogicvector(to_bitvector(imm) sll 2);
            BRANCH_ADDR<=std_logic_vector(signed(NPC) + signed(x)+4);
          else
            BRANCH_CON<='0';
            BRANCH_ADDR<=NPC+4;
        end if;
        
        
        --jump register
        elsif(opcode(31 downto 26)="000000" and opcode(5 downto 0)="001000") then
             IS_BRANCH<='1';
            BRANCH_CON<='1';
            BRANCH_ADDR<=A;
        
        else
           BRANCH_CON<='0';
           IS_BRANCH<='0';
       end if;
    ELSE
      BRANCH_CON<='0';
      IS_BRANCH<='0';      
    END IF;       
    end process;
    

   
	
end behaviour; 



