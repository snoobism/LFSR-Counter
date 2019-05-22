library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XNOR_2 is
	port (A, B: in bit;
			C: out bit);
end XNOR_2;

architecture Behavioral_XNOR_2 of XNOR_2 is
	begin
		process(A, B)
			begin
				C <= A xnor B;
		end process;
end Behavioral_XNOR_2;