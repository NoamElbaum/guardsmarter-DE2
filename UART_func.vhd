library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package UART_func is
	procedure recive(data :out std_logic_vector(7 downto 0); state  :out std_logic);
	procedure send(data :in std_logic_vector(7 downto 0));
end package;

package body UART_func is

	procedure recive(data :out std_logic_vector(7 downto 0); state  :out std_logic) is
	begin
	
	end procedure;
	
	procedure send(data :in std_logic_vector(7 downto 0)) is
	begin
	
	end procedure

end package body;