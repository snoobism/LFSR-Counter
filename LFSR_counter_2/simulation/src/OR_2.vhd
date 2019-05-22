library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_2 is
	port(
	A,B: in bit;
	C: out bit);
end entity OR_2;

architecture Behavioral_OR_2 of OR_2 is
begin
	process(A,B)
	begin
		C <= A or B;
	end process;
end Behavioral_OR_2;