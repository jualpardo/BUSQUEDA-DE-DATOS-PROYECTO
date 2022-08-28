library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity RAM_CORRIENTE is 
	generic(n: integer:=11;-- n-bits per data
	m: integer:=7); -- m-bits of addresses
	port(
		clk: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Dout : out std_logic_vector(n-1 downto 0)); 
end RAM_CORRIENTE;

architecture solve of RAM_CORRIENTE is	
	type ram_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_ram: ram_type; 
	attribute ram_init_file: string;
	attribute ram_init_file of tmp_ram: signal is "CORRIENTE.mif";
	begin
	process(clk)
		begin 
			if (clk'event and clk='1') then
				Dout <= tmp_ram(conv_integer(addr)); ---leer
			end if; 
	end process; 
end solve;