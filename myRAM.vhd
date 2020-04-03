library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity myRam is

generic(NumOfBytes :integer := 8);

port( DataIn					:in std_logic_vector(7 downto 0);
		address_W, address_R :in std_logic_vector(NumOfBytes-1 downto 0);
		DataOut					:out std_logic_vector(7 downto 0);
		Clock, W_R 			   :in std_logic);
end entity;

architecture arch_myRAM of myRAM is

type MEM is array (NumOfBytes-1 downto 0) of std_logic_vector(7 downto 0);
signal Memory : MEM; 

begin

	process(Clock)
	begin
		if rising_edge(Clock) then
			if W_R = '1' then
				Memory(CONV_INTEGER(address_W)) <= DataIn;
			end if;
		end if;
	end process;

	DataOut <= Memory(CONV_INTEGER(address_R));
	
end architecture;