----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 08:48:15 PM
-- Design Name: 
-- Module Name: reg_32_Bit - Behavioral
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

entity reg_32_Bit is
    Port ( d : in STD_LOGIC_VECTOR (31 downto 0);
           q : out STD_LOGIC_VECTOR (31 downto 0);
           en: in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end reg_32_Bit;

architecture Behavioral of reg_32_Bit is

signal data : std_logic_vector(31 downto 0);

begin

    process (clk)
    begin
        if en = '1' then
            if rising_edge(clk) then
                data <= d;
            end if;
            
            if (rst = '1') then
                data <= X"00000000";
            end if;
        end if;
    end process;
    
    q <= data;

end Behavioral;
