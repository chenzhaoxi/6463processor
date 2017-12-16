----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:33 11/28/2017 
-- Design Name: 
-- Module Name:    IM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
   PORT
   (
   clk: in std_logic;
   ReadAddress: in STD_LOGIC_VECTOR (31 downto 0);
   instruction: out STD_LOGIC_VECTOR (31 downto 0);
   LastInsAddress: out STD_LOGIC_VECTOR (31 downto 0);
   changeInstruction: in std_logic_vector(31 downto 0);
   changeAddress: in std_logic_vector(31 downto 0);
   changecommit: in std_logic

--		PCounter	: IN		STD_LOGIC_VECTOR (31 downto 0);
--		IM_in		: IN		STD_LOGIC;
--		IsItype	: OUT		STD_LOGIC;
--		IsRtype	: OUT		STD_LOGIC;
--		IsJtype	: OUT		STD_LOGIC;
--		Opcode	: OUT		STD_LOGIC_VECTOR (5 downto 0);
--		Rs			: OUT		STD_LOGIC_VECTOR (4 downto 0);
--		Rt			: OUT		STD_LOGIC_VECTOR (4 downto 0);
--		Rd			: OUT		STD_LOGIC_VECTOR (4 downto 0);
--		Shamt		: OUT		STD_LOGIC_VECTOR (4 downto 0);
--		Funct		: OUT		STD_LOGIC_VECTOR (5 downto 0);
--		Imm		: OUT		STD_LOGIC_VECTOR (15 downto 0);
--		Address	: OUT		STD_LOGIC_VECTOR (25 downto 0);
--		IM_out	: OUT 	STD_LOGIC
   );
end IM;

architecture Behavioral of IM is
signal PCbar: std_logic_vector (31 downto 0) := x"00000000";
signal PC: std_logic_vector(31 downto 0);
signal PCplus: std_logic_vector (31 downto 0) := x"00000000";
type instruction_array is array(0 to 299) of std_logic_vector (31 downto 0);
signal data_mem: instruction_array := (
"00000000000000000000000000000000",
"00000100000010100000000000011010",
"00000100000010110000000000000100",
"00000100000011000000000001001110",
"00011100110000110000000000000000",
"11111100000000000000000000000000",
"00000000011000010100100000010000",
"00000001001000100100100000010000",
"00010101001010010000000000000011",
"00000000000010010000100000010000",
"00100000110000010000000000000000",
"11111100000000000000000000000000",
"00000000001000100100000000010000",
"00001101000010000000000000011111",
"00011100111001000000000000011010",
"11111100000000000000000000000000",
"00000000100000010100100000010000",
"00000001001000100100100000010000",
"00101000000010000000000000000011",
"00010101001010010000000000000001",
"00001001000010000000000000000001",
"00101100000010001111111111111101",
"00000000000010010001000000010000",
"00100000111000100000000000011010",
"11111100000000000000000000000000",
"00000100110001100000000000000001",
"00000100111001110000000000000001",
"00101100110010100000000000000001",
"00000000110001100011000000010001",
"00101100111010110000000000000001",
"00000000111001110011100000010001",
"00000100101001010000000000000001",
"00101100101011001111111111100011",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00011111111000110000000000000000",
"00000000001000110000100000010000",
"00011111111001000000000000000001",
"00000000010001000001000000010000",
"00000100000011000000000000001100",
"00000000001000100010000000010011",
"00000000001000100010100000010010",
"00000000100001010010000000010001",
"00001100010001010000000000011111",
"00000100110001100000000000000001",
"00101000000001010000000000000011",
"00010100100001000000000000000001",
"00001000101001010000000000000001",
"00101100000001011111111111111101",
"00010100110001110000000000000001",
"00011100111000110000000000000000",
"11111100000000000000000000000000",
"00000000100000110000100000010000",
"00000000001000100010000000010011",
"00000000001000100010100000010010",
"00000000100001010010000000010001",
"00001100001001010000000000011111",
"00101000000001010000000000000011",
"00010100100001000000000000000001",
"00001000101001010000000000000001",
"00101100000001011111111111111101",
"00000100111001110000000000000001",
"00011100111000110000000000000000",
"11111100000000000000000000000000",
"00000000100000110001000000010000",
"00101101100001101111111111100101",
"11111100000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000100000011000000000000001100",
"00010101100011010000000000000001",
"00000101101011100000000000000001",
"00011101110000110000000000000000",
"11111100000000000000000000000000",
"00000000010000110001000000010001",
"00001100001001000000000000011111",
"00101000000001000000000000000011",
"00011000010000100000000000000001",
"00001000100001000000000000000001",
"00101100000001001111111111111101",
"00000000001000100010100000010011",
"00000000001000100011000000010010",
"00000000101001100001000000010001",
"00000000011000110001100000010001",
"00011101101000110000000000000000",
"11111100000000000000000000000000",
"00000000001000110000100000010001",
"00001100010001000000000000011111",
"00101000000001000000000000000011",
"00011000001000010000000000000001",
"00001000100001000000000000000001",
"00101100000001001111111111111101",
"00000000001000100010100000010011",
"00000000001000100011000000010010",
"00000000101001100000100000010001",
"00001001100011000000000000000001",
"00101101100000001111111111100101",
"00000000011000110001100000010001",
"00011100000000110000000000000001",
"11111100000000000000000000000000",
"00000000010000110001000000010001",
"00000000011000110001100000010001",
"00011100000000110000000000000000",
"11111100000000000000000000000000",
"00000000001000110000100000010001",
"11111100000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000"  
);
---end at 137 last line
begin

--lastInsaddress <= "00000000000000000000000100101100";
--Instr <= data_mem(conv_integer(PC(31 downto 2)));

--PCPlus <= PC + 4;

lastInsaddress <= "00000000000000000000000100101100";
-- Since the registers are in multiples of 4 bytes, we can ignore the last two bits
instruction <= data_mem(conv_integer(ReadAddress(31 downto 2)));
 process(clk)
 begin
	if (clk'event and clk = '1' ) then
		if(changecommit = '1') then
			data_mem(conv_integer(changeaddress)) <= changeInstruction;
		end if;
	end if;
 end process;

--with PCSrc select
--    PCbar <= PCPlus when '0',
--        PCBranch when others;
--MUX: process(CLK)
--begin
--if (CLK'event and CLK = '1') then
--case PCSrc is
--when '0' => PCbar <= PCPlus;
--when others => PCbar <= PCBranch;
--end case;
--end if;
--end process;


-- The process for reading the instructions into memory
--process 
--    file file_pointer : text;end Behavioral;
--    variable line_content : string(1 to 32);
--    variable line_num : line;
--    variable i: integer := 0;
--    variable j : integer := 0;
--    variable char : character:='0'; 
--
--begin
---- Open instructions.txt and only read from it
--file_open(file_pointer, "instructions.txt", READ_MODE);
---- Read until the end of the file is reached  
--while not endfile(file_pointer) loop
--    readline(file_pointer,line_num); -- Read a line from the file
--    READ(line_num,line_content); -- Turn the string into a line (looks wierd right? Thanks Obama)
--    -- Convert each character in the string to a bit and save into memory
--    for j in 1 to 32 loop        
--        char := line_content(j);
--        if(char = '0') then
--            data_mem(i)(32-j) <= '0';
--        else
--            data_mem(i)(32-j) <= '1';
--        end if; 
--    end loop;
--    i := i + 1;
--end loop;
--if i > 0 then
--    LastInsAddress <= std_logic_vector(to_unsigned((i-1)*4, LastInsAddress'length));
--else
--    LastInsAddress <= "00000000000000000000000000000000";
--end if;
--
--file_close(file_pointer); -- Close the file 
--wait; 
--end process;


end Behavioral;