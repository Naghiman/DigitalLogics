library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity clockDivider_G29 is

port ( clk,reset: in std_logic;

enable: in std_logic;

en_out: out std_logic);

end clockDivider_G29;


architecture behavior of clockDivider_G29 is

	signal count:integer;

	constant Cycles : integer := 49;--9999;--49 for test only

begin

process(clk,reset)

begin

if(reset = '0') then
	count <= Cycles;
	en_out <= '0';

elsif(rising_edge(clk)) then 

if(enable = '1') then
	count <= count-1;

case count is
	when 0 => en_out <= '0';
	count <= Cycles;

	when 1 => en_out <= '1';
	when others => en_out <= '0';

end case;

else
	count <= count;

end if;

end if;

end process;

end behavior;