library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_5_TO_5 is
  port ( address : in BIT_VECTOR(4 downto 0);
         data : out BIT_VECTOR(0 to 4) );
end ROM_5_TO_5;


architecture Behavioral_ROM_5_TO_5 of ROM_5_TO_5 is
	type mem is array (0 to 31) of BIT_VECTOR(0 to 4);
	constant my_ROM: mem:= (
		0 => "00000",
		1 => "00000",
		2 => "10101",
		3 => "10110",
		4 => "01000",
		5 => "11011",
		6 => "01100",
		7 => "11000",
		8 => "00111",
		9 => "10001",
		10 => "01011",
		11 => "00010",
		12 => "10011",
		13 => "11101",
		14 => "01111",
		15 => "00100",
		16 => "00101",
		17 => "01110",
		18 => "11100",
		19 => "11100",
		20 => "10010",
		21 => "00011",
		22 => "10000",
		23 => "10000",
		24 => "00110",
		25 => "11001",
		26 => "01101",
		27 => "01001",
		28 => "01001",
		29 => "10111",
		30 => "10100",
		31 => "11110"
		);
begin
	process (address)
	begin
	case address is
		when "00000" => data <= my_ROM(0);
		when "00001" => data <= my_ROM(1);
		when "00010" => data <= my_ROM(2);
		when "00011" => data <= my_ROM(3);
		when "00100" => data <= my_ROM(4);
		when "00101" => data <= my_ROM(5);
		when "00110" => data <= my_ROM(6);
		when "00111" => data <= my_ROM(7);
		when "01000" => data <= my_ROM(8);
		when "01001" => data <= my_ROM(9);
		when "01010" => data <= my_ROM(10);
		when "01011" => data <= my_ROM(11);
		when "01100" => data <= my_ROM(12);
		when "01101" => data <= my_ROM(13);
		when "01110" => data <= my_ROM(14);
		when "01111" => data <= my_ROM(15);
		when "10000" => data <= my_ROM(16);
		when "10001" => data <= my_ROM(17);
		when "10010" => data <= my_ROM(18);
		when "10011" => data <= my_ROM(19);
		when "10100" => data <= my_ROM(20);
		when "10101" => data <= my_ROM(21);
		when "10110" => data <= my_ROM(22);
		when "10111" => data <= my_ROM(23);
		when "11000" => data <= my_ROM(24);
		when "11001" => data <= my_ROM(25);
		when "11010" => data <= my_ROM(26);
		when "11011" => data <= my_ROM(27);
		when "11100" => data <= my_ROM(28);
		when "11101" => data <= my_ROM(29);
		when "11110" => data <= my_ROM(30);
		when "11111" => data <= my_ROM(31);
		end case;
	end process;
end architecture Behavioral_ROM_5_TO_5;