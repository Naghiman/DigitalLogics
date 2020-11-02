library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g29_multi_mode_counter is 
	Port (start : in std_logic;
	      stop : in std_logic;
			direction : in std_logic;
			reset : in std_logic;
			clock: in std_logic;
			HEX0 : out std_logic_vector ( 6 downto 0);
			HEX1 : out std_logic_vector ( 6 downto 0));
end g29_multi_mode_counter;

architecture behavior of g29_multi_mode_counter is 
	
	component G29_FSM is 
		Port ( enable : in std_logic;
		       direction: in std_logic;
				 reset: in std_logic;
				 clk: in std_logic;
				 count: out std_logic_vector( 3 downto 0));
	end component G29_FSM;	

	component clockDivider_G29 is 
		Port ( clk,reset : in std_logic;
				 enable : in std_logic;
				 en_out : out std_logic);
	end component clockDivider_G29;
	
	component g29_7_segment_decoder is 
		Port ( code : in std_logic_vector(3 downto 0);
		       segments : out std_logic_vector(6 downto 0));
	end component g29_7_segment_decoder;
	
	signal masterStart : std_logic;
	signal enFSM : std_logic;
	
	signal fsmCount : std_logic_vector( 3 downto 0);
	signal timeMinus : std_logic_vector( 3 downto 0); --Serves as a boolean to help convert the output to decimals
	
	signal temp1 : std_logic_vector( 3 downto 0); --temp for code 0
	signal temp2 : std_logic_vector( 3 downto 0); --temp for code 1
	
	signal temp_reset : std_logic; -- reset after releasing of button
	
	begin
	
	clockDivider : clockDivider_G29 port map (
		enable => masterStart,
		reset => temp_reset,
		clk => clock,
		en_out => enFSM
	);
	
	fsm : G29_FSM port map (
		enable => enFSM,
		reset => temp_reset,
		direction => direction,
		clk => clock,
		count => fsmCount
	);
	
	decoder1 : g29_7_segment_decoder port map (
		 code => temp1,
		 segments => HEX0
	);
	
	decoder2 : g29_7_segment_decoder port map (
		 code => temp2,
		 segments => HEX1
	);
	
	process(start, stop, clock, reset)
		begin 
		
		if(reset = '0') then 
		temp_reset <= '0' ; 
		masterStart <= '0' ; --disable masterStart when the reset button is pressed 
		
		elsif(reset <= '1') then 
		temp_reset <= '1';
		end if;
		
		if(start = '0') then 
		temp_reset <= '0' ;
		masterStart <= '1';--start the masterStart 
		
		elsif(stop <= '0')then 
		masterStart <= '0';
		end if;
		
		if(fsmCount > "1001" ) then 
		timeMinus <= "1111" ;
		elsif(fsmCount <= "1001") then 
		timeMinus <= "0000";
		end if;
	
	end process;
	
	temp1 <= std_logic_vector( unsigned( fsmCount) - unsigned( "1010" and timeMinus));
	
	temp2 <= "000" & timeMinus(0);
	
	end behavior;
	
	
	