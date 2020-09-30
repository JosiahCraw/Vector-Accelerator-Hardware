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
--use UNISIM.VComponents.all

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

    component uart is
	GENERIC(
		clk_freq	:	INTEGER		:= 100_000_000;	--frequency of system clock in Hertz
		baud_rate	:	INTEGER		:= 19_200;		--data link baud rate in bits/second
		os_rate		:	INTEGER		:= 16;			--oversampling rate to find center of receive bits (in samples per baud period)
		d_width		:	INTEGER		:= 8; 			--data bus width
		parity		:	INTEGER		:= 1;			--0 for no parity, 1 for parity
		parity_eo	:	STD_LOGIC	:= '0');		--'0' for even, '1' for odd parity
	PORT(
		clk		:	IN	STD_LOGIC;										--system clock
		reset_n	:	IN	STD_LOGIC;										--ascynchronous reset
		tx_ena	:	IN	STD_LOGIC;										--initiate transmission
		tx_data	:	IN	STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);           --data to transmit
		rx		:	IN	STD_LOGIC;										--receive pin
		rx_busy	:	OUT	STD_LOGIC;										--data reception in progress
		rx_error:	OUT	STD_LOGIC;										--start, parity, or stop bit error detected
		rx_data	:	OUT	STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);	        --data received
		tx_busy	:	OUT	STD_LOGIC;  									--transmission in progress
		tx		:	OUT	STD_LOGIC);										--transmit pin
    end component;

begin


end Behavioral