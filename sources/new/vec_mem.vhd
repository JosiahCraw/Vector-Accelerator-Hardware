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

entity vec_mem is
    generic (
        vec_length : integer := 32
    );
    Port (
        d : in STD_LOGIC_VECTOR ((vec_length*int_size)-1 downto 0);
        q : out STD_LOGIC_VECTOR ((vec_length*int_size)-1 downto 0);
        en: in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC
    );
end vec_mem;

architecture Behavioral of vec_mem is

signal data : std_logic_vector(31 downto 0);

component reg_32_Bit is
    Port ( d : in STD_LOGIC_VECTOR (31 downto 0);
           q : out STD_LOGIC_VECTOR (31 downto 0);
           en: in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component; 

begin
    unit_reg : for i in 0 to vec_length-1 generate
        regx reg_32_Bit port_map(
            d => d((i*32)+31 downto i*32),
            q => q((i*32)+31 downto i*32),
            en => en,
            clk => clk,
            rst => rst
        );
    end generate unit_reg;
end Behavioral;