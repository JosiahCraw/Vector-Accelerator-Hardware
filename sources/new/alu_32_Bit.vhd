----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 08:48:15 PM
-- Design Name: 
-- Module Name: alu_32_Bit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_32_Bit is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0);
           instr : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end alu_32_Bit;

architecture Behavioral of alu_32_Bit is

signal output : std_logic_vector(31 downto 0);

begin

process (clk)
begin
    
    if rising_edge(clk) then
        case instr is
            when X"00" =>
                output <= a + b;
            when X"01" =>
                output <= a or b;
            when X"02" =>
                output <= a and b;
            when others =>
                output  <= X"00000000";
        end case;
    end if;
    
end process;

res <= output;

end Behavioral;
