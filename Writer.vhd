library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Writer is
port(
		--------general I/O-------------
	  clk, rst				:in std_logic;
	  ---------UART I/O----------------
	  send					:out std_logic;
	  READ_FLAG				:in std_logic;
	  UART_IN 				:in std_logic_vector(7 downto 0);
	  UART_OUT				:out std_logic_vector(7 downto 0);
	  -----------RAM I/O--------------
	  W_R							:out std_logic;
	  W_ADDRESS, RAM_OUT		:out std_logic_vector(7 downto 0));
end entity;

architecture arch_Writer of Writer is

	signal last_flag :std_logic := '0';									         --last value of the UART ready to read flag.

begin

	send <= '1';
	
	process(clk,rst)
	begin
		if rst = '0' then   --when rst button is pressed set default values.
			W_R        <= '0';
			W_ADDRESS  <= "00000000";
			UART_OUT   <= "00000000";
			RAM_OUT    <= "00000000";
			last_flag  <= '0';
			
		elsif rising_edge(clk) then				--check for clk.
			if last_flag = not READ_FLAG then	--check if the READ_FLAG changed (change means ready for read).
				last_flag <= READ_FLAG;				--sets last flag.
				RAM_OUT <= UART_IN; 					--write to the RAM.
				W_R <= '1';
			else											--sets the RAM to read mode.
				W_R <= '0';
			end if;
		end if;
	end process;
end architecture;
			