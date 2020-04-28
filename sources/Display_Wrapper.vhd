-- Display_Wrapper.vhd
-- Top-level file for use with the testbench in 
-- Display_tb.vhd.
-- 
-- C.P. Moore
-- 28 April 2020

library IEEE;
use IEEE.std_logic_1164.all;

entity Display_Wrapper is
  port (CLK     : in STD_LOGIC;
        Message : in STD_LOGIC_VECTOR (15 downto 0);
        CA, CB, CC, CD, CE, CF, CG : out STD_LOGIC; -- Segment cathodes
        AN 		: out STD_LOGIC_VECTOR ( 3 downto 0));
end entity;

-- Do not change anything above this line.
-- Edit the architecture below to match your project files.

architecture structural of Display_Wrapper is
  component XYZ is
    port (...);
  end component;
  ...
  
  begin
    component_label: XYZ port map (...);
  