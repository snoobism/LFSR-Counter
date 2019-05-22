library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_32_TO_1 is
	port(
	L : in BIT_VECTOR (4 downto 0);
	NR : in BIT_VECTOR(31 downto 0);
	X : out BIT
	);
end entity MUX_32_TO_1;

architecture Behavioral_MUX_32_TO_1 of MUX_32_TO_1 is
begin
with L select
	X<= NR(5) when "00101",
		NR(10) when "01010",
		NR(14) when "01110",
		NR(16) when "10000",
		NR(18) when "10010",
		NR(22) when "10110",
		NR(27) when "11011",
		NR(31) when "11111",
		'1' when others;
end architecture Behavioral_MUX_32_TO_1;
	