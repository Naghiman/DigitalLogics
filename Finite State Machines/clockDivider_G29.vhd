library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity clockDivider_G29 is

port ( clk: in std_logic;
       reset: in std_logic; --reset button(Active low)
       enable: in std_logic; --start button(Active high)
       en_out: out std_logic); --pulse signal

end clockDivider_G29;


architecture behavior of clockDivider_G29 is

	signal count:integer; --temporary variable for counting

	constant Cycles : integer := 49;--9999; cycle period(for test only)

begin

process(clk,reset)

begin
--The circuit being restarted and the count is set to the cycle period
if(reset = '0') then
	count <= Cycles;
	en_out <= '0';

elsif(rising_edge(clk)) then --at the positive edge of the clock

if(enable = '1') then --decrementing count while the circuit is enable 
	count <= count-1;

case count is  --Turn on en_out for one positive edge of the clock
	when 0 => en_out <= '0'; --Whenever the count becomes zero, en_out goes back to zero
	count <= Cycles;

	when 1 => en_out <= '1';--Whenever the count becomes one, en_out throws a pulse
	when others => en_out <= '0';

end case;

else --Count remains the same when the circuit is not enabled
	count <= count;

end if;

end if;

end process;

end behavior;