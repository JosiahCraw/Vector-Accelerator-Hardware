----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 09:42:25 PM
-- Design Name: 
-- Module Name: alu_testbench - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vec_alu_testbench is
--  Port ( );
end vec_alu_testbench;

architecture Behavioral of vec_alu_testbench is

constant CLK_period : time := 500 ns;

component vec_alu is
    generic (
        vec_length : integer := 32
    );
    Port ( 
        a     : in  STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        b     : in  STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        res   : out STD_LOGIC_VECTOR ((32*vec_length)-1 downto 0);
        instr : in  STD_LOGIC_VECTOR (7 downto 0);
        clk   : in  STD_LOGIC
    );
end component;

signal clock : std_logic;
signal output : std_logic_vector(127 downto 0);
signal in_a : std_logic_vector(127 downto 0);
signal in_b : std_logic_vector(127 downto 0);
signal instruction : std_logic_vector(7 downto 0);

signal looping : boolean := true;

begin

    UUT: vec_alu
        generic map(vec_length => 4)
        port map(a => in_a, b => in_b, res => output, instr => instruction, clk => clock);
        
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
        wait for CLK_period/2;
        
        instruction <= X"00";
        in_a(31 downto 0) <= X"00000000";
        in_b(31 downto 0) <= X"00000001";

        in_a(63 downto 32) <= X"00000001";
        in_b(63 downto 32) <= X"00000001";

        in_a(95 downto 64) <= X"0000000F";
        in_b(95 downto 64) <= X"00000001";

        in_a(127 downto 96) <= X"FFFFFFFF";
        in_b(127 downto 96) <= X"00000001";

        wait for CLK_period;
        assert (output(31 downto 0)   = X"00000001") report "Incorrect Result" severity failure;
        assert (output(63 downto 32)  = X"00000002") report "Incorrect Result" severity failure;
        assert (output(95 downto 64)  = X"00000010") report "Incorrect Result" severity failure;
        assert (output(127 downto 96) = X"00000000") report "Incorrect Result" severity failure;

        report "Tests Completed Successfully";
        looping <= false;
        wait;
    end process;

end Behavioral;
