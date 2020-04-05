----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2020 10:59:57
-- Design Name: 
-- Module Name: FSM_countdown_tb - Behavioral
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

entity FSM_countdown_tb is
--  Port ( );
end FSM_countdown_tb;

architecture Behavioral of FSM_countdown_tb is

    component FSM_countdown is
        Port ( 
            Clock    : in STD_LOGIC := '0';
            Trigger_Button : in STD_LOGIC := '0';
            Lights_Output : out std_logic_vector(2 downto 0)
        );
    end component;
        
    -- internal signals to handle IO of test module
    signal button_i : std_logic := '0';
    signal lights_o : std_logic_vector(2 downto 0);
    
    -- our automated testbench clock
    signal clock_sim : std_logic := '0';
    constant clock_sim_period : time := 1sec;
    
    -- simulation end signal, used to stop the clock
    signal done : boolean := false;
begin

    -- Instantiate the FSM_countdown with a name,
    -- in this case UUT_countdown
    -- and map the ports of the module to signals
    -- available in this entity.
    UUT_countdown : FSM_countdown port map (
            Clock => clock_sim,
            Trigger_Button => button_i,
            Lights_Output => lights_o
        );
        
    -- we also need a clock process, so we define one here.
    -- It will run continuously, until 'done' is true.
    clk_process_sim : process
    begin
        while( not done) loop
            clock_sim <= '1';
            wait for clock_sim_period/2; -- for half a period, signal is '0'.
            clock_sim <= '0';
            wait for clock_sim_period/2; -- for next half a period, signal is '1'.
         end loop;
         wait;
     end process;
     
     
     -- TEST PROCEDURE
     -- we need to control the input signal(s), and
     -- we need to check the behaviour of the Unit Under Test.
     MAIN_STIMULUS : process
     begin
        --begin just before 1s
        wait for 900 ms;
        
        --press button for 1.1 sec, so that 1 Hz clock is sure to catch it
        button_i <= '1';
        wait for 1100 ms;
        
        --release button, wait for 0.5 sec, just to come back to integer seconds
        button_i <= '0';
        wait for 500 ms;
        
        --wait 2.5 sec, countdown should be finished.
        wait for 2500 ms;
        
        --stop here, using our 'done' boolean to stop the clock.
        done <= true; 
        wait;        
     end process; 
     
     -- My rough attempt and asserting things in parallet with stimulus
     ASSERTIONS : process
     begin
        wait for 500 ms; -- first check at 0.5s, before anything starts.
        assert lights_o = "000" report "Outputs not off at beginning";
        
        wait for 1000ms; --button pressed, should be all on now
        assert lights_o = "111" report "Outputs not 3 when expected";
        
        wait for 1000ms; --a second later, should be 2
        assert lights_o = "011" report "Outputs not 2 when expected";
        
        wait for 1000ms; --a second later, should be 1
        assert lights_o = "001" report "Outputs not 1 when expected";
        
        wait for 1000ms; --a second later, should be 0, off
        assert lights_o = "000" report "Outputs not off when expected";
        
        wait for 1000ms; --a second later, should still be 0, off
        assert lights_o = "000" report "Outputs not off when expected";
        
        wait;
     end process;

end Behavioral;
