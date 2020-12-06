
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;



entity Mod_9_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           counter : out STD_LOGIC_vector(3 downto 0));
end Mod_9_counter;

architecture Behavioral of Mod_9_counter is

signal count_temp: std_logic_vector(3 downto 0) := "0000";

begin

    Mod9: process(clk,reset, count_temp)
    begin
        if reset = '1' then
        count_temp <= "0000";
        elsif (rising_edge(clk) and reset = '0') then
        count_temp <= count_temp + 1;
        end if;
        if count_temp = "1000" then
            count_temp <= "0000";
        end if;
        
    end process;

end Behavioral;
