library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity main is
port( 
		-----------GENERAL I/O-------------
		clk, rst,RAM_BUSY		 :in std_logic;
		-------------RAM I/O---------------
		RAM_IN					 :in std_logic_vector(7 downto 0);
		R_ADDRESS				 :out std_logic_vector(7 downto 0);
		-------------VGA I/O---------------
		R,G,B						 :out std_logic);
		
end entity;


architecture arch_main of main is

	signal R_addr       :std_logic_vector(7 downto 0) := "00000000";		--address for reading from the RAM.

begin
	
	process(clk, rst)
	begin
		if rst = '0' then 
			R <= '0';
			G <= '0';
			B <= '1';
		elsif rising_edge(clk) then 
			if RAM_BUSY <= '0' then
				R_ADDRESS <= "00000000";
				if RAM_IN = "00000000" then
					R <= '1';
					G <= '0';
					B <= '0';
				elsif RAM_IN = "11111111" then
					R <= '0';
					G <= '1';
					B <= '0';
				end if;
			end if;	
		end if;
	end process;
end architecture;