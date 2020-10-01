----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 09:42:25 PM
-- Design Name: 
-- Module Name: reg_testbench - Behavioral
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
use std.env.finish;

entity vec_reg_testbench is
--  Port ( );
end vec_reg_testbench;

architecture Behavioral of vec_reg_testbench is

constant CLK_period : time := 500 ns;

component vec_reg is
    generic (
        vec_length : integer := 32
    );
    Port (
        d : in STD_LOGIC_VECTOR ((vec_length*32)-1 downto 0);
        q : out STD_LOGIC_VECTOR ((vec_length*32)-1 downto 0);
        en: in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC
    );
end component;

signal clock    : std_logic := '0';
signal en       : std_logic := '0';
signal rst      : std_logic;

signal data_out : std_logic_vector(127 downto 0);
signal data_in  : std_logic_vector(127 downto 0);

signal looping  : boolean := true;

begin
    UUT: vec_reg
        generic map(
            vec_length => 4
        )
        port map(
            d => data_in, 
            q => data_out, 
            en => en,
            rst => rst,
            clk => clock
        );
        
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
        
        en <= '1';
        data_in <= X"00000001000000010000000100000001";
        wait for CLK_period;
        assert (data_out = X"00000001000000010000000100000001") report "Incorrect Result" severity failure;

        data_in <= X"000F00000000F00000000F00000000F0";
        wait for CLK_period;
        assert (data_out = X"000F00000000F00000000F00000000F0") report "Incorrect Result" severity failure;
        en <= '0';

        wait for CLK_period;

        data_in <= X"F0000000F000000FF000000FFFFFFFFF";
        wait for CLK_period;
        assert (data_out = X"000F00000000F00000000F00000000F0") report "Incorrect Result" severity failure;

        rst <= '1';
        wait for CLK_period;
        assert (data_out = X"00000000000000000000000000000000") report "Incorrect Result" severity failure;
        
        report "Tests Completed Successfully";
        looping <= false;
        wait;
    end process;

end Behavioral;
