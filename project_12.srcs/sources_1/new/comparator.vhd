----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2017 10:33:14 AM
-- Design Name: 
-- Module Name: comparator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
port(
		branch: in std_logic_vector(1 downto 0);
		comp1, comp2: in std_logic_vector(31 downto 0);
		Gobranch: out std_logic
	);
end comparator;

architecture Behavioral of comparator is

begin
Gobranch <= '1' when (branch = "01" and comp1<comp2) else
					'1' when (branch = "10" and comp1=comp2) else
					'1' when (branch = "11" and comp1/=comp2) else
					'0';

end Behavioral;
