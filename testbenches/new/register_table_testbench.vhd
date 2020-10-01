----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 09:42:25 PM
-- Design Name: 
-- Module Name: ram_testbench - Behavioral
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
-- TODO:
--      Add more tests
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use std.env.finish;

entity register_table_testbench is
--  Port ( );
end register_table_testbench;

architecture Behavioral of register_table_testbench is

    function slv_to_string ( a: std_logic_vector) return string is
        variable b : string (a'length-1 downto 1) := (others => NUL);
    begin
            for i in a'length-1 downto 1 loop
            b(i) := std_logic'image(a((i-1)))(2);
            end loop;
        return b;
    end function;

constant CLK_period : time := 500 ns;
constant vec_len    : integer := 4;

component register_table is
    generic (
        STANDARD_REG_COUNT : integer := 16;
        VECTOR_REG_COUNT   : integer := 16;
        VECTOR_ADDR_LEN    : integer := 5;
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
end component;

signal clock    : std_logic := '0';
signal rst      : std_logic := '0';
signal wr       : std_logic := '0';

signal address  : std_logic_vector(4 downto 0);
signal data_out : std_logic_vector((vec_len*32)-1 downto 0);
signal data_in  : std_logic_vector((vec_len*32)-1 downto 0);

signal looping  : boolean := true;

begin

    UUT: register_table
        generic map(
            VECTOR_LENGTH => vec_len
        )
        port map(d => data_in, 
                 q => data_out,
                 addr => address,
                 wr => wr,
                 clk => clock,
                 rst => rst);
        
    clock_process : process
    begin
        while looping = true loop
            clock <= '0';
            wait for CLK_period / 2;
            clock <= '1';
            wait for CLK_period / 2;
        end loop;
        wait;
    end process;
    
    process is
    begin
        looping <= true;
        
        wr <= '1';
        address <= "00000";
        wait for CLK_period;
        data_in <= X"00000001000000010000000100000001";
        wait for CLK_period;
        
        address <= "00001";
        wait for CLK_period;
        data_in <= X"000F00000000F00000000F00000000F0";
        wait for CLK_period;

        address <= "00010";
        wait for CLK_period;
        data_in <= X"F0000000F000000FF000000FFFFFFFFF";
        wait for CLK_period;

        address <= "10000";
        wait for CLK_period;
        data_in <= X"F0000000F000000FF000000F00000000";
        wait for CLK_period;

        address <= "10001";
        wait for CLK_period;
        data_in <= X"000000000000000000000000FFFFFFFF";
        wait for CLK_period;

        wr <= '0';

        -- Do Checks

        address <= "00000";
        wait for CLK_period;
        assert (data_out = X"00000001000000010000000100000001") report "Incorrect Result" severity failure;
        wait for CLK_period;

        address <= "00001";
        wait for CLK_period;
        assert (data_out = X"000F00000000F00000000F00000000F0") report "Incorrect Result" severity failure;
        wait for CLK_period;

        address <= "00010";
        wait for CLK_period;
        assert (data_out = X"F0000000F000000FF000000FFFFFFFFF") report "Incorrect Result" severity failure;
        wait for CLK_period;

        address <= "10000";
        wait for CLK_period;
        assert (data_out(35 downto 32) = "ZZZZ") report "Incorrect Result" severity failure;
        assert (data_out(31 downto 0) = X"00000000") report "Incorrect Result" severity failure;
        wait for CLK_period;

        address <= "10001";
        wait for CLK_period;
        assert ( data_out(31 downto 0) = X"FFFFFFFF") report "Incorrect Result" severity failure;
        assert not ( data_out = X"000000000000000000000000FFFFFFFF") report "Incorrect Result" severity failure;
        wait for CLK_period;
        
        rst <= '1';
        wait for CLK_period;
        assert (data_out = "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ") report "Incorrect Result" severity failure;
        report "Tests Completed Successfully";

        looping <= false;
        wait;
    end process;

end Behavioral;
