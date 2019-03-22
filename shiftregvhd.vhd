library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity shiftregvhd is
	port (
		clkin : in std_logic;
		running_led : out unsigned(9 downto 0);
		btn : in std_logic;
		segtest : out std_logic
	);
	
end shiftregvhd;

architecture runner of shiftregvhd is
	signal temp : unsigned(9 downto 0) := "0000000001";
	signal counter : integer range 0 to 50000000 := 0;
	signal button_cond : std_logic;
	signal segment : std_logic := '1';
begin
	button_cond <= btn;
	process(clkin) begin
		if(rising_edge(clkin)) then
			counter <= counter + 1;
			if(counter >= 5000000) then
				counter <= 0;
				segment <= not segment;
				segtest <= segment;
				if(button_cond = '0') then
					temp <= (shift_left(temp, 1));
				elsif(button_cond = '1') then
					temp <= (shift_left(temp, 1) or "0000000001");
				end if;
				running_led <= temp;
			end if;
		end if;
	end process;
end runner;