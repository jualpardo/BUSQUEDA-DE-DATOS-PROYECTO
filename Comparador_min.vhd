library ieee;
use ieee.std_logic_1164.all;

Entity Comparador_min is
	generic ( n: integer :=11);--<-- nbits
	Port(
		A: in std_logic_vector(n-1 downto 0);
		B: in std_logic_vector(n-1 downto 0);
		AmenorB, AmayorB, AigualB: out std_logic);
end Comparador_min;

Architecture solve of Comparador_min is
	Begin
		AmenorB<='1' when A<B else '0';
		AmayorB<='1' when A>B else '0';
		AigualB<='1' when A=B else '0';
end solve;