library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
	port(
	D, CLK, RST: in bit;
	Q, NQ: out bit);
end DFF;

architecture Behavioral_DFF of DFF is
begin
	process(CLK, RST)
		begin
			if RST = '1'
				then Q <= '0'; 
			elsif(CLK'EVENT) and (CLK = '1')
				then Q <= D;
					NQ <= not D;
			end if;
	end process;
end Behavioral_DFF;