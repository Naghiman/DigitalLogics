library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g29_stopwatch is 
	Port (		start : in std_logic; --active low, board button
			stop  : in std_logic; --active low, board button
			reset : in std_logic; --active low, board button
			clock : in std_logic;
			HEX0  : out std_logic_vector( 6 downto 0);
			HEX1  : out std_logic_vector( 6 downto 0);
			HEX2  : out std_logic_vector( 6 downto 0);
			HEX3  : out std_logic_vector( 6 downto 0);
			HEX4  : out std_logic_vector( 6 downto 0);
			HEX5  : out std_logic_vector( 6 downto 0));
			
end entity g29_stopwatch;

architecture behavior of g29_stopwatch is 

	--7_segment_decoder
	component g29_7_segment_decoder is 
		Port (		code			: in  std_logic_vector(3 downto 0);
				segments		: out std_logic_vector(6 downto 0));
	end component g29_7_segment_decoder;


	--Counter = max digit number is 15, we want decimal = max 9 (reset at 10)
	component g29_counter is 
		Port (	       enable : in std_logic; --active high
				reset : in std_logic; --active low
				clock : in std_logic;
				count : out std_logic_vector(3 downto 0));	
	end component g29_counter;
	
	--Clock Divider
	component clockDivider_G29 is
	Port (		enable : in std_logic;
			reset  : in std_logic;
			clk    : in std_logic;
			en_out : out std_logic); 	
	end component clockDivider_G29;
	
	
	--Signals
	signal masterStart : std_logic; --Reads values of start and stop buttons
	signal enC0        : std_logic; --Enables the first counter when clock reaches 10ms
	signal clockup     : std_logic; --Switches counters by using clockDivder
	signal enC1, enC2, enC3, enC4, enC5 : std_logic; --Enabled counters
	signal reset0, reset1, reset2, reset3, reset4, reset5 : std_logic; --Resets counters(Active high)
	signal count0, count1, count2, count3, count4, count5 : std_logic_vector(3 downto 0); --Counters
	
	begin
	
	--portmaps (variable => actualValues)
	clockDivider : clockDivider_G29 Port Map (
		enable => masterStart, -- mapping enable variable to the corresponding button on the board
		reset  => reset, --mapping reset variable to the corresponding button on the board
		clk    => clock, --mapping to stopwatch clock
		en_out => clockup --enCX => clock to count X
	);
	
	counter0 : g29_counter Port map (
		enable => enC0, 
		reset  => reset0,
		clock  => clock,
		count  => count0
	);
	counter1 : g29_counter Port map (
		enable => enC1,
		reset  => reset1,
		clock  => clock,
		count  => count1
	);
	counter2 : g29_counter Port map (
		enable => enC2,
		reset  => reset2,
		clock  => clock,
		count  => count2
	);	
	counter3 : g29_counter Port map (
		enable => enC3,
		reset  => reset3,
		clock  => clock,
		count  => count3
	);
	counter4 : g29_counter Port map (
		enable => enC4,
		reset  => reset4,
		clock  => clock,
		count  => count4
	);	
	counter5 : g29_counter Port map (
		enable => enC5,
		reset  => reset5,
		clock  => clock,
		count  => count5
	);
	
	decoder0 : g29_7_segment_decoder Port Map (
		code 	 => count0,
		segments => HEX0
	);
	decoder1 : g29_7_segment_decoder Port Map (
		code 	 => count1,
		segments => HEX1
	);
	decoder2 : g29_7_segment_decoder Port Map (
		code 	 => count2,
		segments => HEX2
	);
	decoder3 : g29_7_segment_decoder Port Map (
		code 	 => count3,
		segments => HEX3
	);
	decoder4 : g29_7_segment_decoder Port Map (
		code 	 => count4,
		segments => HEX4
	);
	decoder5 : g29_7_segment_decoder Port Map (
		code 	 => count5,
		segments => HEX5
	);
	
	
	
	process(start, stop, reset, clock)
		
		begin	
		
		--masterStart = enable of clockDivider = changes enC1
		if (start = '0') then 
			masterStart <= '1';
		
		elsif (stop = '0') then
			masterStart <= '0';
		
		elsif (reset='0') then --this is the borad's reset button, rests entire stopwatch
			--stop clock
			masterStart <= '0';
			
			--reset all enables
			--don't need to reset enC0 b/c it's controlled by masterStart
			enC1 <= '0';
			enC2 <= '0';
			enC3 <= '0';
			enC4 <= '0';
			enC5 <= '0';
		
		   --turn on all resets = reset all counters
			reset0 <= '0';
			reset1 <= '0';
			reset2 <= '0';
			reset3 <= '0';
			reset4 <= '0';
			reset5 <= '0';
		
		  --reset all resets
		elsif (reset = '1') then 
			reset0 <= '1';
			reset1 <= '1';
			reset2 <= '1';
			reset3 <= '1';
			reset4 <= '1';
			reset5 <= '1';
			
		end if;
			
		enC0 <= clockup;
		
		case count0 is
			when "1001" => --9
				enC1 <= enC0; --enable the next counter only if the previous counter is enabled
			when "1010" => --10
				reset0 <= '0'; --reset itself
			when others => 
				enC1 <= '0';
		end case;
		
		case count1 is
			when "1001" =>
				enC2 <= enC1;
			when "1010" =>
				reset1 <= '0';
			when others => 
				enC2 <= '0';
			end case;
			
		case count2 is
			when "1001" =>
				enC3 <= enC2; 
			when "1010" => 
				reset2 <= '0';
			when others => 
				enC3 <= '0';
		end case;
		
		case count3 is
			when "0101" => --5
				enC4 <= enC3;
			when "0110" => --6
				reset3 <= '0';
			when others => 
				enC4 <= '0';
		end case;
			
		case count4 is
			when "1001" => --9
				enC5 <= enC4;
			when "1010" => --10
				reset4 <= '0';
			when others => 
				enC5 <= '0';
		end case;
			
		case count5 is
			when "0101" => --5
				reset5 <= '0'; --reset 6th counter (all others are already zero)
			when others =>
				reset5 <= reset5; --reset5 => '0' disables C5 
		end case;
					
	
	end process;
	
	
end behavior;