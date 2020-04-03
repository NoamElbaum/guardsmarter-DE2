library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TESTER is
port( 
		-----------GENERAL I/O-------------
		clk, rst,RAM_BUSY		 :in std_logic;
	   T_LED 					 :out std_logic;
		F_LED						 :out std_logic_vector(3 downto 0);
		-------------RAM I/O---------------
		RAM_IN					 :in std_logic_vector(7 downto 0);
		R_ADDRESS					 :out std_logic_vector(7 downto 0));
end entity;


architecture arch_TESTER of TESTER is

	type test is array (7 downto 0) of std_logic_vector(7 downto 0);     -- array type for testing.
	signal tester       : test;
	signal R_addr       :std_logic_vector(7 downto 0) := "00000000";		--address for reading from the RAM.
	signal FAULSE_COUNT :std_logic_vector(3 downto 0) := "0000";				--counts how many bytes came wrong.

begin

	tester(0) <= "00110000"; --set's the values 0-7 in ASCII code on the testing array.
	tester(1) <= "00110001";
	tester(2) <= "00110010";
	tester(3) <= "00110011";
	tester(4) <= "00110100";
	tester(5) <= "00110101";
	tester(6) <= "00110110";
	tester(7) <= "00110111";
	
	process(clk, rst)
	begin
		if rst = '0' then 
			FAULSE_COUNT <= "0000";
			T_LED <= '0';
		elsif rising_edge(clk) then 
			if RAM_BUSY <= '0' then
				R_ADDRESS <= R_addr;
				if RAM_IN = tester(CONV_INTEGER(R_addr)) then
				else	
					FAULSE_COUNT <= FAULSE_COUNT + 1;
				end if;
				if R_addr > 6 then 
					R_addr <= "00000000";
					F_LED <= FAULSE_COUNT;
					if FAULSE_COUNT = 0 then
						T_LED <= '1';
					else 
						T_LED <= '0';
					end if;
					FAULSE_COUNT <= "0000";
				else
					R_addr <= R_addr + 1;
				end if;
			end if;	
		end if;
	end process;
end architecture;