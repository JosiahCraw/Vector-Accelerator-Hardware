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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_32_Bit is
    Port ( a : in STD_LOGIC_VECTOR (32 downto 0);
           b : in STD_LOGIC_VECTOR (32 downto 0);
           out : out STD_LOGIC_VECTOR (32 downto 0);
           instr : in STD_LOGIC_VECTOR (8 downto 0);
           clk : in STD_LOGIC);
end alu_32_Bit;

architecture Behavioral of alu_32_Bit is

begin


end Behavioral;
