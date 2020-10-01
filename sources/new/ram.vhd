library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
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
end entity ram;

architecture Behavioral of ram is

   type   ram_type is array (0 to (2**ADDRESS_WIDTH)-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal block_ram : ram_type;

begin

  RamProc: process(clock) is

  begin
    if rising_edge(clock) then
      if write_en = '1' then
        block_ram(to_integer(unsigned(address))) <= datain;
      end if;
    end if;
  end process RamProc;

  dataout <= block_ram(to_integer(unsigned(address)));

end Behavioral;

