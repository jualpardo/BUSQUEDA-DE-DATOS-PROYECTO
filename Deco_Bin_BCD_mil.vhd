library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  Deco_Bin_BCD_mil is
    port (EN: in std_logic;  
			BINARIO: in std_logic_vector(13 downto 0);
			cifra_mii, cifra_sute,cifra_zeci,cifra_unitati: out std_logic_vector(3 downto 0));
end Deco_Bin_BCD_mil;

architecture ARH of Deco_Bin_BCD_mil is 
begin
	cifra_mii<="0000";    -- 1st digit
	cifra_sute<="0000";   -- 2nd digit
	cifra_zeci<="0000";   -- 3rd digit
	cifra_unitati<="0000";  -- 4th digit
    process(EN, BINARIO)
    variable BIN: std_logic_vector(13 downto 0);
    variable BCD: std_logic_vector(15 downto 0):=(others => '0');
    variable i: integer:=0;
    begin
        if EN='1' then
            BIN := BINARIO;
            -- Convert Binary to BCD (Double Dabble algorithm)
            for i in 0 to 13 loop
                bcd(15 downto 1) := bcd(14 downto 0);  --shifting the bits.
                bcd(0) := bin(13);
                bin(13 downto 1) := bin(12 downto 0);
                bin(0) :='0';

                if(i < 13 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(3 downto 0) := bcd(3 downto 0) + "0011";
                end if;
                if(i < 13 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
                bcd(7 downto 4) := bcd(7 downto 4) + "0011";
                end if;
                if(i < 13 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(11 downto 8) := bcd(11 downto 8) + "0011";
                end if; 
                if(i < 13 and bcd(15 downto 12) > "0100") then  --add 3 if BCD digit is greater than 4.
                bcd(15 downto 12) := bcd(15 downto 12) + "0011";
                end if;
            end loop; 
            end if;
            cifra_mii <= BCD(15 downto 12); 
            cifra_sute <= BCD(11 downto 8);
            cifra_zeci <= BCD(7 downto 4);
            cifra_unitati <=BCD(3 downto 0);
    end process; 
end ARH;