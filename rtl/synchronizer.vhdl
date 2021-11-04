library ieee;
use ieee.std_logic_1164.all

entity synchronizer is 
	generic(DWIDTH : integer := 1)
	port(
		clk1	: in std_logic;
		clk2	: in std_logic;
		data_i	: in std_logic_vector(DWIDTH -1 downto 0);
		data_o	: out std_logic_vector(DWIDTH -1 downto 0)
	
	);
	
end entity synchronizer;

architecture rtl of synchronizer is 
	signal Q1		: std_logic_vector(DWIDTH -1 downto 0);
	signal Q2		: std_logic_vector(DWIDTH -1 downto 0);
	
begin
	-- clock domain 1
	D1_prc : process(clk1)
	begin
		if(rising_edge(clk1)) then
			Q1 <= data_i;
		end if;
	end process D1_prc;
	
	-- clock domain 2 to synchronize data
	syn_prc: process(clk2)
	begin
		if(rising_edge(clk1)) then
			Q2 <= Q1;
			data_o <= Q2;
		end if;
	end process D2_3_prc;
	
end rtl;


