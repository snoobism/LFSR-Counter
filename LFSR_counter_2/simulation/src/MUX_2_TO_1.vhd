library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_TO_1 is
	port(
	sel : in bit;
	sel_1 : in bit;
	sel_0: in bit;
	X : out BIT
	);
end entity MUX_2_TO_1;

architecture Behavioral_MUX_2_TO_1 of MUX_2_TO_1 is
begin
with sel select
	X<= sel_0 when '0',
		sel_1 when '1';

end architecture Behavioral_MUX_2_TO_1;