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
use IEEE.STD_MATH_REAL.ALL;

entity register_table is
    generic (
        STANDARD_REG_COUNT : integer := 16;
        VECTOR_REG_COUNT   : integer := 16;
        VECTOR_LENGTH      : integer := 32
    );
    Port ( 
        d    : in STD_LOGIC_VECTOR ((32*VECTOR_LENGTH)-1 downto 0);
        q    : out STD_LOGIC_VECTOR ((32*VECTOR_LENGTH)-1 downto 0);
        addr : in STD_LOGIC_VECTOR (integer(ceil(log2(real(VECTOR_LENGTH))))-1 downto 0);
        clk  : in STD_LOGIC;
        rst  : in STD_LOGIC
    );
end register_table;

architecture Behavioral of register_table is

component reg_32_Bit is
    Port (  
        d : in STD_LOGIC_VECTOR (31 downto 0);
        q : out STD_LOGIC_VECTOR (31 downto 0);
        en: in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC
    );
end component;

component vec_reg is
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
end component;

begin

    reg_gen_vec : for i in 0 to VECTOR_REG_COUNT-1 generate
        regx : vec_mem
        generic map(
            vec_length => VECTOR_LENGTH
        )
        port map(
            d => d,
            q => q,
            en =>  '1' when addr = to_unsigned(i, addr'length) else '0',
            clk => clk,
            rst => rst
        );
    end generate reg_gen_vec ; -- alu_gen

    reg_gen_std : for i in VECTOR_REG_COUNT to VECTOR_REG_COUNT+STANDARD_REG_COUNT-1 generate
        regx : reg_32_Bit port map(
            d => d(31 downto 0),
            q => q(31 downto 0),
            en =>  '1' when addr = to_unsigned(i, addr'length) else '0',
            clk => clk,
            rst => rst
        );
    end generate reg_gen_std ; -- alu_gen
    
    q <= data;

end Behavioral;
