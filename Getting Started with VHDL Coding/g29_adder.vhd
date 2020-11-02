library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g29_adder is
	Port ( A , B				: in  std_logic_vector(4 downto 0); --Taking two 5bits binary numbers as inputs
			 decoded_A			: out std_logic_vector(13 downto 0); --Two hexadecimal digits representing first hexadecimal number in the addition
			 decoded_B			: out std_logic_vector(13 downto 0); --Two hexadecimal digits representing second hexadecimal number in the addition
			 decoded_AplusB	: out std_logic_vector(13 downto 0));--The result of adding two hexadecimal numbers together
end g29_adder;

architecture behavioral of g29_adder is
	--importing the 7-segments decoder
	component g29_7_segment_decoder is
		port(	code		: in	std_logic_vector(3 downto 0); --Takes 4bits binary number as input
				segments	: out std_logic_vector(6 downto 0)); --Gives the segments that need to be turned on for the given binary number 
	end component g29_7_segment_decoder;
	
	signal sum: std_logic_vector(5 downto 0); --sum of the binary numbers is not an input so must be declared as signal
	--Temp variables are declared to use inside the the port map
	signal A1_code_temp, B1_code_temp, sum1_code_temp: std_logic_vector(3 downto 0); --temp second digit of the hexadecimal numbers
	
	begin
	A1_code_temp <= "000" & A(4); --Concatonating the fifth bit of the input number with three zero to create 4bits binary number to represent the second digit of the hexadecimal number A
	B1_code_temp <= "000" & B(4); --Concatonating the fifth bit of the input number with three zero to create 4bits binary number to represent the second digit of the hexadecimal number B
	sum1_code_temp <= "00" & sum(5 downto 4);--Concatonating the fifth and sixth bit of the result of addition of inputs number with two zero to create 4bits binary number to represent the second digit of the hexadecimal number Sum
	
	sum <= std_logic_vector (unsigned('0' & A) + unsigned('0' & B)); --adding A and B together. Adding a zero to the left of each to prevent overflow
	
	A0: 	g29_7_segment_decoder port map( code => A(3 downto 0),   segments => decoded_A(6 downto 0)); -- Converting First digit of hexadecimal number A to show on the LED
 	
	A1: 	g29_7_segment_decoder port map( code => A1_code_temp ,   segments => decoded_A(13 downto 7)); -- Converting Second digit of hexadecimal number A to show on the LED
	
	B0: 	g29_7_segment_decoder port map( code => B(3 downto 0),   segments => decoded_B(6 downto 0)); --Converting First digit of hexadecimal number B to show on the LED
	
	B1: 	g29_7_segment_decoder port map( code => B1_code_temp ,   segments => decoded_B(13 downto 7)); --Converting Second digit of hexadecimal number B to show on the LED
	
	sum0: g29_7_segment_decoder port map( code => sum(3 downto 0), segments => decoded_AplusB(6 downto 0)); --Converting First digit of hexadecimal number result to show on the LED
	
	sum1: g29_7_segment_decoder port map( code => sum1_code_temp,  segments => decoded_AplusB(13 downto 7)); --Converting Second digit of hexadecimal number result to show on the LED
	
	end behavioral;