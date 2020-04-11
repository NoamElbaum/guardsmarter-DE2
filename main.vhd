library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity main is
port( 
		-----------GENERAL I/O-------------
		clk, rst		:in std_logic;
		-------------RAM I/O---------------
		RAM_IN		:in std_logic_vector(7 downto 0);
		R_ADDRESS	:out std_logic_vector(7 downto 0);
		-------------VGA I/O---------------
		R,G,B			:out std_logic;
		------------keyboard I/O-----------
		scan_code	:in std_logic_vector(7 downto 0));
		
end entity;


architecture arch_main of main is
begin
	
	R_ADDRESS <= "00000000";
	
	process(clk, rst)
	begin
		if rst = '0' then 
			R <= '0';
			G <= '0';
			B <= '0';
		elsif rising_edge(clk) then 
			if scan_code = "01110110" then 
				R <= '0';
				G <= '1';
				B <= '0';
			else
				if RAM_IN = "01100011" then
					R <= '1';
					G <= '0';
					B <= '0';
				elsif RAM_IN = "01101111" then
					R <= '0';
					G <= '1';
					B <= '0';
				end if;	
			end if;
		end if;
	end process;
end architecture;