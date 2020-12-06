
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;


entity shift_register is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (3 downto 0);
           serial_data_in_r: in STD_LOGIC;
           serial_data_in_l: in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sel : in STD_LOGIC_vector(1 downto 0) := "00");
end shift_register;

architecture Behavioral of shift_register is
signal data_out_temp: std_logic_vector(3 downto 0) := "0000";
begin
shift_register: process(reset,sel,clk,serial_data_in_r,serial_data_in_l,data_in)
begin
    if reset = '1' then
    data_out_temp <= "0000";
    elsif (rising_edge(clk) and reset = '0') then
        if (sel = "00") then
        --hold the previous values
        data_out <= data_out_temp;
        elsif (sel = "01") then
        --shift right
        -- Bit 0: MSB & BIT 1: LSB
        data_out_temp(0) <= serial_data_in_r;
        data_out_temp(1) <= data_out_temp(0);
        data_out_temp(2) <= data_out_temp(1);
        data_out_temp(3) <= data_out_temp(2);
               
        elsif (sel = "10") then
        --shift left
        -- Bit 0: MSB & BIT 1: LSB
        data_out_temp(3) <= serial_data_in_l;
        data_out_temp(2) <= data_out_temp(3);
        data_out_temp(1) <= data_out_temp(2);
        data_out_temp(0) <= data_out_temp(1);
        
        elsif (sel = "11") then
        --Parallel load  
        data_out_temp <= data_in;
        end if;
    end if;
    data_out <= data_out_temp;
end process;
end Behavioral;
