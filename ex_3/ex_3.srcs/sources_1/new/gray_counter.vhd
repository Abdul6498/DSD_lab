
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity gray_counter is
 -- generic (
  --  g_WIDTH : integer := 4
  --  );
    Port ( clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end gray_counter;

architecture Behavioral of gray_counter is

signal count_bin, bin_to_grey : std_logic_vector(3 downto 0) := "0000";

begin
j_count: process(clk)
    begin
        if (rising_edge(clk)) then
            count_bin <= count_bin + 1;       
        end if;
    end process;
    bin_to_grey(0) <= count_bin(0);
    conversion : for ii in 1 to 3 generate
    bin_to_grey(ii) <= count_bin(ii) xor count_bin(ii - 1);           
    end generate conversion;    
    --count <= count_bin;
    count <= bin_to_grey;
end Behavioral;
