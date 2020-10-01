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
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;

entity register_table is
    generic (
        STANDARD_REG_COUNT : integer := 16;
        VECTOR_REG_COUNT   : integer := 16;
        VECTOR_ADDR_LEN    : integer := 8;
        VECTOR_LENGTH      : integer := 32
    );
    Port ( 
        d    : in STD_LOGIC_VECTOR ((32*VECTOR_LENGTH)-1 downto 0);
        q    : out STD_LOGIC_VECTOR ((32*VECTOR_LENGTH)-1 downto 0);
        addr : in STD_LOGIC_VECTOR (VECTOR_ADDR_LEN-1 downto 0);
        wr   : in STD_LOGIC;
        clk  : in STD_LOGIC;
        rst  : in STD_LOGIC
    );
end register_table;

architecture Behavioral of register_table is

component reg_32_Bit is
    Port (  
        d   : in STD_LOGIC_VECTOR (31 downto 0);
        q   : out STD_LOGIC_VECTOR (31 downto 0);
        en  : in STD_LOGIC;
        wr  : in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC
    );
end component;

component vec_reg is
    generic (
        vec_length : integer := 32
    );
    Port (
        d   : in STD_LOGIC_VECTOR ((vec_length*32)-1 downto 0);
        q   : out STD_LOGIC_VECTOR ((vec_length*32)-1 downto 0);
        en  : in STD_LOGIC;
        wr  : in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC
    );
end component;

signal en : std_logic_vector(VECTOR_REG_COUNT+STANDARD_REG_COUNT-1 downto 0);
signal data_in  : std_logic_vector ((VECTOR_LENGTH*32)-1 downto 0);
signal data_out : std_logic_vector ((VECTOR_LENGTH*32)-1 downto 0);

begin
    process(addr, rst)
    variable addr_state : std_logic_vector(VECTOR_REG_COUNT+STANDARD_REG_COUNT-1 downto 0);
    begin
        addr_state := std_logic_vector(to_unsigned(0, addr_state'length));
        addr_state(to_integer(unsigned(addr))) := '1';
        
        if rst = '1' then
            addr_state := std_logic_vector(to_unsigned(0, addr_state'length));
        end if;
        en <= addr_state;
    end process;

    reg_gen_vec : for i in 0 to VECTOR_REG_COUNT-1 generate
        regx : vec_reg
        generic map(
            vec_length => VECTOR_LENGTH
        )
        port map(
            d => data_in,
            q => data_out,
            en => en(i),
            wr => wr,
            clk => clk,
            rst => rst
        );
    end generate reg_gen_vec ; -- alu_gen

    reg_gen_std : for i in VECTOR_REG_COUNT to VECTOR_REG_COUNT+STANDARD_REG_COUNT-1 generate
        regx : reg_32_Bit port map(
            d => data_in(31 downto 0),
            q => data_out(31 downto 0),
            en => en(i),
            wr => wr,
            clk => clk,
            rst => rst
        );
    end generate reg_gen_std ; -- alu_gen

    data_in <= d;
    q <= data_out;
    
end Behavioral;
