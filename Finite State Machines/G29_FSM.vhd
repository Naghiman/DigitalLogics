LIBRARY IEEE;
USE IEEE.STD_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY G29_FSM IS
	Port ( enable  : in std_logic;
	       direction : in std_logic;
			 reset : in std_logic;
			 clk   : in std_logic;
			 count : out std_logic_vector(3 downto 0));
			 
end G29_FSM;
	
architecture behavior of G29_FSM is 

	type state is (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O);
	
	SIGNAL sg : state;
	
	constant c_A : std_logic_vector(3 downto 0) := "0001"; --1
	constant c_B : std_logic_vector(3 downto 0) := "0010"; --2
	constant c_C : std_logic_vector(3 downto 0) := "0100"; --4
	constant c_D : std_logic_vector(3 downto 0) := "1000"; --8
	constant c_E : std_logic_vector(3 downto 0) := "0011"; --3
	constant c_F : std_logic_vector(3 downto 0) := "0110"; --6
	constant c_G : std_logic_vector(3 downto 0) := "1100"; --12
	constant c_H : std_logic_vector(3 downto 0) := "1011"; --11
	constant c_I : std_logic_vector(3 downto 0) := "0101"; --5
	constant c_J : std_logic_vector(3 downto 0) := "1010"; --10
	constant c_K : std_logic_vector(3 downto 0) := "0111"; --7
	constant c_L : std_logic_vector(3 downto 0) := "1110"; --14
	constant c_M : std_logic_vector(3 downto 0) := "1111"; --15
	constant c_N : std_logic_vector(3 downto 0) := "1101"; --13
   constant C_O : std_logic_vector(3 downto 0) := "1001"; --9
	
	begin 
	
	process(reset, clk)
	
	begin
	
		if(reset = '0') then 
		
		if(direction = '1')then --count down the order of the state
		sg <= A;
		elsif (direction = '0')then
		sg <= O;
		end if;
		
		elsif(rising_edge(clk)) then
		
		if(enable = '1')then
		case sg is 
		when A => 
			if(direction = '1') then sg<=B;
			elsif(direction = '0')then sg<=O;
			end if;
		when B =>
			if(direction = '1') then sg<=C;
			elsif(direction = '0')then sg<=A;
			end if;
		when C=> 
			if(direction = '1') then sg<=D;
			elsif(direction = '0')then sg<=B;
			end if;
		when D=>
			if(direction = '1') then sg<=E;
			elsif(direction = '0')then sg<=C;
			end if;
		when E =>
			if(direction = '1') then sg<= F;
			elsif(direction = '0')then sg<=D;
			end if;
		when F =>
			if(direction = '1') then sg<=G;
			elsif(direction = '0')then sg<=E;
			end if;
		when G =>
			if(direction = '1') then sg<=H;
			elsif(direction = '0')then sg<=F;
			end if;
		when H =>
			if(direction = '1') then sg<=I;
			elsif(direction = '0')then sg<=G;
			end if;
		when I =>
			if(direction = '1') then sg<=J;
			elsif(direction = '0')then sg<=H;
			end if;
	   when J =>
			if(direction = '1') then sg<=K;
			elsif(direction = '0')then sg<=I;
			end if;
		when K =>
			if(direction = '1') then sg<=L;
			elsif(direction = '0')then sg<=J;
			end if;
		when L =>
			if(direction = '1') then sg<=M;
			elsif(direction = '0')then sg<=K;
			end if;
		when M =>
			if(direction = '1') then sg<=N;
			elsif(direction = '0')then sg<=L;
			end if;
		when N =>
			if(direction = '1') then sg<=O;
			elsif(direction = '0')then sg<=M;
			end if;
		when O =>
			if(direction = '1') then sg<=A;
			elsif(direction = '0')then sg<=N;
			end if;
		when others =>
		   sg <= A;
		end case;
	end if;
	end if;
end process;

--decoding state to get output
with sg select count <= 
	c_A when A,
	c_B when B,
	c_C when C,
	c_D when D,
	c_E when E,
	c_F when F,
	c_G when G,
	c_H when H,
	c_I when I,
	c_J when J,
	c_K when K,
	c_L when L,
	c_M when M,
	c_N when N,
	c_O when O,
	c_A when others;

end behavior;

