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
use std.env.finish;

entity ram_testbench is
--  Port ( );
end ram_testbench;

architecture Behavioral of ram_testbench is

constant CLK_period : time := 500 ns;

component ram is
    generic (
      ADDRESS_WIDTH : integer := 8;
      DATA_WIDTH : integer := 24
    );
    port (
      clock   : in  std_logic;
      write_en: in  std_logic;
      address : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      datain  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      dataout : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
  end component;

signal clock    : std_logic := '0';
signal write_en : std_logic := '0';

signal address  : std_logic_vector(7  downto 0);
signal data_out : std_logic_vector(23 downto 0);
signal data_in  : std_logic_vector(23 downto 0);

signal looping  : boolean := true;

begin

    UUT: ram
        port map(clock => clock, 
                 write_en => write_en, 
                 address => address,
                 datain => data_in,
                 dataout => data_out);
        
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
        
        write_en <= '1';
        address <= X"00";
        wait for CLK_period;

        data_in <= X"010101";

        wait for CLK_period;
        write_en <= '0';
        wait for CLK_period;

        write_en <= '1';
        address <= X"01";
        wait for CLK_period;

        data_in <= X"101010";

        wait for CLK_period;
        write_en <= '0';
        wait for CLK_period;

        address <= X"00";
        wait for CLK_period;
        assert (data_out = X"010101") report "Incorrect Result" severity failure;
        
        address <= X"01";
        wait for CLK_period;
        assert (data_out = X"101010") report "Incorrect Result" severity failure;
        
        report "Tests Completed Successfully";
        looping <= false;
        wait;
    end process;

end Behavioral;
