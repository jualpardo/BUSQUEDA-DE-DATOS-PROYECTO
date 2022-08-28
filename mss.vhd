library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mss is
	port(
		reset,clock,start: in std_logic;
		direccion_127, P_o_I,max,min,prom,dato_mayor_datomax,dato_menor_datomin: in std_logic;		
		Fin,En_ram,Ld_ram,Reset_ram,resetMin,En_max,En_min,En_sum,En_prom,display,en_binario: out std_logic;
		sel_dato: out std_logic_vector(1 downto 0);
		reset_max,reset_prom: out std_logic)
		
end mss;

architecture solve of mss is
Type estado is (T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T16,T17,T18,T19,T20,T21,T22,T23,T24,T28,T29,T30,T31,T32,T33,T34);
SIGNAL y:estado;
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then y<=T1;
  		elsif (clock'event and clock='1') then
			case y is
				when T1=> 	if start='1' then y<=T2;
								else y<=T1;
								end if;
				when T2=>	if start='1' then y<=T2;
								else y<=T3;
								end if;
				when T3=>	if P_o_I='1' then y<=T4;
								else y<=T4;
								end if;
				when T4=>	if max='1' then y<=T5;
								--elsif min='1' then y<=T11;
								--elsif prom='1' then y<=T18;
								else y<=T32; 
								end if;
				When T32=>  if min='1' then  y<=T11;
								else y<=T33;
				when T33=>  if PROM='1' then  y<=T18;
								else y<=T4;
								
				-- MAXIMO				
				when T5=>	y<=T6;
				when T6=>	if dato_mayor_datomax='1' then y<=T9;
								elsif direccion_127='1' then y<=T28;
								else y<=T10;	end if;	
				when T7=>	y<=T8;
				when T8=>	y<=T3;				
				when T9=>	if direccion_127='1' then y<=T7;
								else y<=T10;
								end if;
				when T10=>	y<=T6;
				when T28=> if dato_mayor_datomax='1' then y<=T29;
							  else y<=T7;	end if;
				when T29=> y<=T7;
				
				-- MINIMO
				when T11=>	y<=T12;
				when T12=>	y<=T13;
				when T13=>	if dato_menor_datomin='1' then y<=T16;
								elsif direccion_127='1' then y<=T30;
								else y<=T17;
								end if;
				When T14=>	y<=T8;
				when T16=>	if direccion_127='1' then y<=T30;
								else y<=T17; end if;				
				when T17=>	y<=T13;
				when T30=>	if dato_menor_datomin='1' then y<=T31;
								else y<=T14;
								end if;
				when T31=>	y<=T14;

				
				-- PROMEDIO
				
				when T18=>	y<=T19;
				when T19=>	if direccion_127='1' then y<=T22;
								else y<=T20; 
								end if;
				when T20=>	y<=T21;
				when T21=>	y<=T19;
				when T22=>	y<=T23;
				when T23=>	y<=T24;			
				when T24=>	y<=T8;				
			end case;
		end if;
	END PROCESS;
	
sec: PROCESS(y)
	BEGIN
		Reset_ram<='0';En_Ram<='0';Ld_Ram<='0';resetMin<='0';En_max<='0';En_min<='0';En_sum<='0';
		Fin<='0';En_prom<='0';display<='0';en_binario<='0';reset_max<='0';reset_prom<='0';
			case y is
				when T1=>	
				when T2=>	
				when T3=>	
				when T4=>	
				when T5=>	En_ram<='1';
								Ld_ram<='1';
								Reset_ram<='1';
								reset_max<='1';
				when T6=>	
				when T7=>	sel_dato<="00";
								en_binario<='1';
				when T8=>	display<='1';
								Fin<='1';
				when T9=>	En_max<='1';
				when T10=>	En_Ram<='1';
				when T11=>	En_ram<='1';
								Ld_ram<='1';
								Reset_ram<='1';
								resetMin<='1';
				when T12=>	En_min<='1';
				when T13=>	
				when T14=>	sel_dato<="01";
								en_binario<='1';
				when T16=>	En_min<='1';
				when T17=>	En_ram<='1';
				when T18=>	En_ram<='1';
								Ld_ram<='1';
								Reset_ram<='1';
								reset_prom<='1';
				when T19=>	
				when T20=>	En_sum<='1';
				when T21=>	En_ram<='1';
				
				when T22=>	En_sum<='1';
				when T23=>  En_prom<='1';
				
				when T24=>	sel_dato<="10";
								en_binario<='1';
				when T28=>
				when T29=> En_max<='1';
				when T30=>	
				when T31=>	En_min<='1';
			end case;
	END PROCESS;
END solve;

