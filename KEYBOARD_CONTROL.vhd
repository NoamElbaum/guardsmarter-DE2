library ieee;
use ieee.std_logic_1164.all;

entity KEYBOARD_CONTROL is
	port ( scan_code  : in std_logic_vector(7 downto 0);
		   x     : out std_logic_vector (2 downto 0);
		   clk,reset  : in std_logic);		   
end entity;

architecture arch_KEYBOARD_CONTROL of KEYBOARD_CONTROL is
begin
	process (clk,reset)
	
	begin
			
			if reset='0' then
				x <= "000";
		elsif rising_edge(clk) then
		
			case scan_code(7 downto 0) is
			
			when x"2d" => x <= "100"; --r
			when x"34" => x <= "010"; --g
			when x"32" => x <= "001"; --b

				when others => 
					
			end case;						

		end if;			
	end process;
end architecture;