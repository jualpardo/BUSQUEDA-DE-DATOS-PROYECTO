library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Deco_Bin_Bcd4 is
	 port(
        num_bin: in  std_logic_vector(10 downto 0);
        num_bcd: out std_logic_vector(13 downto 0);
		  uni,dec,cen: out std_logic_vector(3 downto 0);
		  mil:out std_logic_vector(1 downto 0));
end Deco_Bin_Bcd4;

--Architecture
architecture solve of Deco_Bin_Bcd4 is
	-- Signals,Constants,Variables,Components
	begin
    --Process #1
	proceso_bcd: process(num_bin)
	--Sequential programming
	variable z: std_logic_vector(26 downto 0);
		begin
		-- Inicialización de datos en cero.
		z := (others => '0');
		-- Se realizan los primeros tres corrimientos.
		z(13 downto 3) := num_bin;-- este es valor es un paso antes de ocurre la suma entre 3 (Shift3)
		for i in 0 to 7 loop
				-- Unidades (4 bits).
			if z(10 downto 0) > 4 then
				z(10 downto 0) := z(10 downto 0) + 3;
				end if;
			-- -- Decenas (4 bits).
			if z(14 downto 11) > 4 then
				z(14 downto 11) := z(14 downto 11) + 3;
			end if;
			-- Centenas (3 bits).
			if z(18 downto 15) > 4 then
				z(18 downto 15) := z(18 downto 15) + 3;
			end if;
			-- Unidad de mil
			if z(22 downto 19) > 4 then
				z(22 downto 19) := z(22 downto 19) + 3;
			end if;
			-- Corrimiento a la izquierda.
			z(26 downto 1) := z(25 downto 0);
		end loop;
		-- Pasando datos de variable Z, correspondiente a BCD.
		num_bcd <= z(24 downto 11);
		uni<= z(14 downto 11);
		dec<= z(18 downto 15);
		cen<= z(22 downto 19);
		mil<= z(24 downto 23);
	end process;
	--Process #n...
end solve;