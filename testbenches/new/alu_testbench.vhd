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

entity alu_testbench is
--  Port ( );
end alu_testbench;

architecture Behavioral of alu_testbench is

constant CLK_period : time := 500 ns;

component alu_32_Bit is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0);
           instr : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end component;

signal clock : std_logic;
signal output : std_logic_vector(31 downto 0);
signal in_a : std_logic_vector(31 downto 0);
signal in_b : std_logic_vector(31 downto 0);
signal instruction : std_logic_vector(7 downto 0);

begin

    UUT: alu_32_Bit
        port map(a => in_a, b => in_b, res => output, instr => instruction, clk => clock);
        
    clock_process : process
    begin
        clock <= '0';
        wait for CLK_period / 2;
        clock <= '1';
        wait for CLK_period / 2;
    end process;
    
    process is
    begin
    
        in_a <= X"00000000";
        in_b <= X"00000001";
        instruction <= X"00";
        
        wait for CLK_period;
        assert (output = X"00000001") report "Incorrect Result" severity failure;
        
        
        in_a <= X"00000001";
        in_b <= X"00000001";
        instruction <= X"00";
        
        wait for CLK_period;
        assert (output = X"00000002") report "Incorrect Result" severity failure;
        
        
        in_a <= X"0000000F";
        in_b <= X"00000001";
        instruction <= X"00";
        
        wait for CLK_period;
        assert (output = X"00000010") report "Incorrect Result" severity failure;
        
        
        in_a <= X"FFFFFFFF";
        in_b <= X"00000001";
        instruction <= X"00";
        
        wait for CLK_period;
        assert (output = X"00000000") report "Incorrect Result" severity failure;
        
        
        in_a <= X"00000008";
        in_b <= X"00000008";
        instruction <= X"00";
        
        wait for CLK_period;
        assert (output = X"00000010") report "Incorrect Result" severity failure;
        
    end process;

end Behavioral;
