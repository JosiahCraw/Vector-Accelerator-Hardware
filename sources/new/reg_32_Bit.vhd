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
    Port ( d   : in STD_LOGIC_VECTOR  (31 downto 0);
           q   : out STD_LOGIC_VECTOR (31 downto 0);
           en  : in STD_LOGIC;
           wr  : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end reg_32_Bit;

architecture Behavioral of reg_32_Bit is

begin
    process (clk, rst, en, q, d)
    variable data : std_logic_vector(31 downto 0) := X"00000000";
    begin
        if rst = '1' then
            data := X"00000000";
        end if;
        if en = '1' then
            if rising_edge(clk) and wr = '1' then
                data := d;
            end if;
            q <= data;
        else
            q <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
        end if;
    end process;

end Behavioral;
