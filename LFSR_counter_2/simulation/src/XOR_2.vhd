library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_2 is
	port(
	A,B: in bit;
	C: out bit);
end XOR_2;

architecture Behavioral_XOR_2 of XOR_2 is
begin
	process(A,B)
	begin
		C <= A xor B;
	end process;
end Behavioral_XOR_2;
