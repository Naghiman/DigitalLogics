library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g29_counter Is
	Port (enable		: in std_logic;
			reset			: in std_logic;
			clock			: in std_logic;
			count			: out std_logic_vector(3 downto 0));
end g29_counter;							

architecture Behavioral of g29_counter is
signal temp_count:	unsigned(3 downto 0);
begin

	process(clock,reset)
		begin
				if(reset = '0') then --reset is active low
			temp_count <= "0000";
	
	elsif (rising_edge(clock)) then
		if(enable = '1') then
		temp_count <= temp_count+1;
		else
		temp_count <= temp_count;
		end if;
	end if;
	end process;
count <= std_logic_vector(temp_count(3 downto 0)); --Assigning temp variable to count


end Behavioral;