library IEEE;
     use IEEE.STD_LOGIC_1164.all;
     use IEEE.NUMERIC_STD.all;
     use ieee.std_logic_unsigned.all;
ENTITY Ag_ceros_dato IS
       PORT (a : IN std_logic_vector(10 DOWNTO 0); 
				 b :OUT std_logic_vector(17 DOWNTO 0));
END Ag_ceros_dato;
 
ARCHITECTURE sol OF Ag_ceros_dato IS
BEGIN
	b<="0000000"&a;
END sol;
