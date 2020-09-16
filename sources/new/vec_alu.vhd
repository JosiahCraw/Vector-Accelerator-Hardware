----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 08:48:15 PM
-- Design Name: 
-- Module Name: vec_alu - Behavioral
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

entity vec_alu is
    generic (
        vec_length : integer := 32
    );
    Port ( 
        a : in STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        b : in STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        res : out STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        instr : in STD_LOGIC_VECTOR (7 downto 0);
        clk : in STD_LOGIC
    );
end vec_alu;

architecture Behavioral of vec_alu is

component alu_32_Bit is
    Port ( 
        a : in STD_LOGIC_VECTOR (31 downto 0);
        b : in STD_LOGIC_VECTOR (31 downto 0);
        res : out STD_LOGIC_VECTOR (31 downto 0);
        instr : in STD_LOGIC_VECTOR (7 downto 0);
        clk : in STD_LOGIC
    );
end component;

begin

alu_gen : for i in 0 to vec_length-1 generate
    alux : alu_32_Bit port map(
        a => a((i*32)+31 downto i*32),
        b => b((i*32)+31 downto i*32),
        res => res((i*32)+31 downto i*32),
        instr => instr,
        clk => clk
    );
end generate alu_gen ; -- alu_gen
    
end Behavioral;
