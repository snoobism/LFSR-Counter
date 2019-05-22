library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR_counter is
	port(LEN: in bit_vector(4 downto 0);
	RESET_PRE: in BIT;
	BUTTON_PRE: in BIT;				
	ON32: in BIT;					 
	CLK: in BIT;
	an: out STD_LOGIC_VECTOR(7 DOWNTO 0);
	cat: out STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
end LFSR_counter;

architecture Structural_LFSR_counter of LFSR_counter is

component SSD is
port( clk: in bit;
		number: in bit_vector(4 DOWNTO 0);
		lenn: in bit_vector(4 DOWNTO 0);
		an: out STD_LOGIC_VECTOR(7 DOWNTO 0);
		cat: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

component XNOR_2 is
	port (A, B: in bit;
			C: out bit);
end component;

component OR_2 is
port(
	A,B: in bit;
	C: out bit);
end component;

component XOR_2 is
	port(
	A,B: in bit;
	C: out bit);
end component;

component AND_5 is
	port(
		Qin1, Qin2, Qin3, Qin4, Qin5: in bit;
		f: out bit);
end component;

component MUX_2_TO_1 is
	port(
	sel : in bit;
	sel_1 : in bit;
	sel_0: in bit;
	X : out BIT
	);
end component;

component DFF is
	port(
	D, CLK, RST: in bit;
	Q, NQ: out bit);
end component;

component MUX_32_TO_1 is
	port(
	L : in BIT_VECTOR (4 downto 0);
	NR : in BIT_VECTOR(31 downto 0);
	X : out BIT
	);
end component;

component ROM_5_TO_5 is
  port ( address : in BIT_VECTOR(4 downto 0);
         data : out BIT_VECTOR(0 to 4) );
end component; 

component Debounce is
  Port (
    CLK : in  bit;
    x : in  bit;
    DBx : out  bit
  );
end component;

signal Q: bit_vector(0 to 4);
signal Qn: bit_vector(0 to 4);
signal SELECT_C_INPUT: bit_vector(0 to 4);
signal C_INPUT: bit_vector(4 downto 0);
signal C_SIGNAL: bit;
signal C_CHECK: bit;
signal C_TO_OR: bit;
signal A_SIGNAL: bit;
signal MUX_32_INPUT: bit_vector(31 downto 0); 
signal MUX_32_OUT: bit;
signal B_SIGNAL: bit;
signal OR_SIGNAL: bit;
signal XOR_SIGNAL: bit;		 
signal MUX_ON_TO_B: bit;
signal CHECK_31: bit;
signal BUTTON: bit;
signal RESET:bit;

begin

	MUX_32_INPUT(0) <= '1';
	MUX_32_INPUT(1) <= '1';
	MUX_32_INPUT(2) <= '1';
	MUX_32_INPUT(3) <= '1';
	MUX_32_INPUT(4) <= '1';
	MUX_32_INPUT(5) <= Q(4);
	MUX_32_INPUT(6) <= '1';
	MUX_32_INPUT(7) <= '1';
	MUX_32_INPUT(8) <= '1';
	MUX_32_INPUT(9) <= '1';
	MUX_32_INPUT(10) <= Q(4);
	MUX_32_INPUT(11) <= '1';
	MUX_32_INPUT(12) <= '1';
	MUX_32_INPUT(13) <= '1';
	MUX_32_INPUT(14) <= Q(4);
	MUX_32_INPUT(15) <= '1';
	MUX_32_INPUT(16) <= Q(4);
	MUX_32_INPUT(17) <= '1';
	MUX_32_INPUT(18) <= Q(4);
	MUX_32_INPUT(19) <= '1';
	MUX_32_INPUT(20) <= '1';
	MUX_32_INPUT(21) <= '1';
	MUX_32_INPUT(22) <= Q(4);
	MUX_32_INPUT(23) <= '1';
	MUX_32_INPUT(24) <= '1';
	MUX_32_INPUT(25) <= '1';
	MUX_32_INPUT(26) <= '1';
	MUX_32_INPUT(27) <= Q(4);
	MUX_32_INPUT(28) <= '1';
	MUX_32_INPUT(29) <= '1';
	MUX_32_INPUT(30) <= '1';
	MUX_32_INPUT(31) <= Q(4);


	DEBOUNCER_RESET: Debounce port map(CLK, RESET_PRE, RESET);
	DEBOUNCER_BUTON: Debounce port map(CLK, BUTTON_PRE, BUTTON);
	CODE_MAP: ROM_5_TO_5 port map(LEN, SELECT_C_INPUT);
	MUX_4: MUX_2_TO_1 port map(SELECT_C_INPUT(4), Q(4), Qn(4), C_INPUT(4));
	MUX_3: MUX_2_TO_1 port map(SELECT_C_INPUT(3), Q(3), Qn(3), C_INPUT(3));
	MUX_2: MUX_2_TO_1 port map(SELECT_C_INPUT(2), Q(2), Qn(2), C_INPUT(2));
	MUX_1: MUX_2_TO_1 port map(SELECT_C_INPUT(1), Q(1), Qn(1), C_INPUT(1));
	MUX_0: MUX_2_TO_1 port map(SELECT_C_INPUT(0), Q(0), Qn(0), C_INPUT(0));
	GATE_C: AND_5 port map(C_INPUT(4), C_INPUT(3), C_INPUT(2), C_INPUT(1), C_INPUT(0), C_SIGNAL);
	CHECK_USE_GATE_C: AND_5 port map(Q(4), Q(3), Q(2), Q(1), Q(0), CHECK_31);
	OR_C_ON32: OR_2 port map(CHECK_31, ON32, C_CHECK);
	MUX_C: MUX_2_TO_1 port map(C_CHECK, '0', C_SIGNAL, C_TO_OR);
	GATE_A: XNOR_2 port map(Q(4), Q(2), A_SIGNAL); 
	MUX_32: MUX_32_TO_1 port map(LEN, MUX_32_INPUT, MUX_32_OUT);	 
	MUX_ON: MUX_2_TO_1 port map(ON32, '1', MUX_32_OUT, MUX_ON_TO_B);
	GATE_B: AND_5 port map(MUX_ON_TO_B, Q(3), Q(2), Q(1), Q(0), B_SIGNAL);
	GATE_OR: OR_2 port map(B_SIGNAL, C_TO_OR, OR_SIGNAL);
	GATE_XOR: XOR_2 port map(OR_SIGNAL, A_SIGNAL, XOR_SIGNAL);
	DFF0: DFF port map(XOR_SIGNAL, BUTTON, RESET, Q(0), Qn(0));
	DFF1: DFF port map(Q(0), BUTTON, RESET, Q(1), Qn(1));
	DFF2: DFF port map(Q(1), BUTTON, RESET, Q(2), Qn(2));
	DFF3: DFF port map(Q(2), BUTTON, RESET, Q(3), Qn(3));
	DFF4: DFF port map(Q(3), BUTTON, RESET, Q(4), Qn(4));
	DISPLAY: SSD port map(CLK, Q, LEN, an, cat);
	
end architecture Structural_LFSR_counter;


