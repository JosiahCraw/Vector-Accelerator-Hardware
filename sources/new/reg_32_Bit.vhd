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
    process (clk, rst)
    begin
        if rst = '1' then
            data <= X"00000000";
        end if;
        if en = '1' then
            if rising_edge(clk) then
                data <= d;
            end if;
            
        end if;
    end process;
    
    q <= data;

end Behavioral;
