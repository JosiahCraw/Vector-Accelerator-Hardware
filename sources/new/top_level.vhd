----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2020 08:51:07 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( UART_TXD_IN : in std_logic,
           UART_RXD_OUT : out std_logic);
end top_level;

architecture Behavioral of top_level is

    component vec_mem is
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

    component vec_alu is
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
    end component;

begin


end Behavioral