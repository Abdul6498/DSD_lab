
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC := '1';
           out_q : out STD_LOGIC_VECTOR (3 downto 0));
end johnson_counter;

architecture Behavioral of johnson_counter is
signal temp_q : std_logic_vector(3 downto 0) := "0000";
begin
    rst_d: process(reset)
    begin
        if reset = '0' then
        temp_q <= "0000";
        end if;
 --  temp_q <= d_in;
    end process;
    j_count: process(clk,temp_q)
    begin
        if (rising_edge(clk)) then
            temp_q(1) <= temp_q(0);
            temp_q(2) <= temp_q(1);
            temp_q(3) <= temp_q(2);
            temp_q(0) <= not temp_q(3);
            
        end if;
        
    end process;
    out_q <= temp_q;
end Behavioral;
