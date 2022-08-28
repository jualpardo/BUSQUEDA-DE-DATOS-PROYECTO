library IEEE;
     use IEEE.STD_LOGIC_1164.all;
     use IEEE.NUMERIC_STD.all;
     use ieee.std_logic_unsigned.all;
ENTITY sum_vhdl IS
       GENeric (n:INTEGER:=18); 
       PORT (a : IN std_logic_vector(n-1 DOWNTO 0); 
             b : IN std_logic_vector(n-1 DOWNTO 0); 
             salida : OUT std_logic_vector(n-1 DOWNTO 0));
     END sum_vhdl;
 
     ARCHITECTURE synth OF sum_vhdl IS
     BEGIN
 
       PROCESS (a, b) IS
       BEGIN
         salida <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
       END PROCESS;
     END synth;
