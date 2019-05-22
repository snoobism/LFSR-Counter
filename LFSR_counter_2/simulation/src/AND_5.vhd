library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_5 is
	port(
		Qin1, Qin2, Qin3, Qin4, Qin5: in bit;
		f: out bit);
end AND_5;

architecture Behavioral_AND_5 of AND_5 is
begin
	process(Qin1, Qin2, Qin3, Qin4, Qin5)
	begin
		f <= Qin1 and Qin2 and Qin3 and Qin4 and Qin5;
	end process;
end Behavioral_AND_5;