
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity lsr is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           rst : in STD_LOGIC;
           load : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end lsr;

architecture Behavioral of lsr is

signal data_out_temp: unsigned (7 downto 0);
signal internel_reg: STD_LOGIC_VECTOR (7 downto 0);

begin
j_count: process(clk,rst)
    begin
        if ( clk_en = '1' and rising_edge(clk)) then
            if (rst = '1') then
                data_out_temp <= (others => '0');
                internel_reg <= (others => '0');
            elsif(load = '0') then
                data_out_temp <= shift_left(unsigned(internel_reg),1);
            elsif(load = '1') then
                internel_reg <= data_in;
            end if;
        end if;
    end process;
    data_out <= std_logic_vector(data_out_temp);
end Behavioral;
