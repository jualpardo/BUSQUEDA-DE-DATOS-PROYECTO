library IEEE;
     use IEEE.STD_LOGIC_1164.all;
     use IEEE.NUMERIC_STD.all;
     use ieee.std_logic_unsigned.all;
ENTITY Ag_ceros IS
       PORT (a : IN std_logic_vector(1 DOWNTO 0); 
             b : OUT std_logic_vector(3 DOWNTO 0));
     END Ag_ceros;
 
ARCHITECTURE sol OF Ag_ceros IS
     BEGIN
		 b<="00"&a;
     END sol;
