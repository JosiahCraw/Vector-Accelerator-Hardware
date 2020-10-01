----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 08:48:15 PM
-- Design Name: 
-- Module Name: reg_8_Bit - Behavioral
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

entity reg_8_Bit is
    Port ( d : in STD_LOGIC_VECTOR (7 downto 0);
           q : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end reg_8_Bit;

architecture Behavioral of reg_8_Bit is

signal data : std_logic_vector(7 downto 0);

begin

    process (clk)
    begin
        if rising_edge(clk) then
            data <= d;
        end if;
        
        if (rst = '1') then
            data <= "00000000";
        end if;
    end process;
    
    q <= data;

end Behavioral;
