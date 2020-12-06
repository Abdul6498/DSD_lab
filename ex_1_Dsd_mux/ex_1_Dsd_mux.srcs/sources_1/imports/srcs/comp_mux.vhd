library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity comp_mux is
  port (
    in0    : in  std_logic_vector(3 downto 0);
    in1    : in  std_logic_vector(3 downto 0);
    op     : in  std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0));
end entity comp_mux;

architecture rtl of comp_mux is

signal sum        : std_logic_vector(3 downto 0);
signal abs_dif    : std_logic_vector(3 downto 0);
signal bitwise_or : std_logic_vector(3 downto 0);
signal abs_in1    : std_logic_vector(3 downto 0);
signal sign       : std_logic;
signal temp       : std_logic_vector(3 downto 0);
signal shiftL     : std_logic_vector(3 downto 0);
signal shiftR     : std_logic_vector(3 downto 0);


begin  -- architecture rtl

sum <= std_logic_vector(signed(in0) + signed(in1));
abs_dif <= std_logic_vector(abs(signed(in0) - signed(in1)));
bitwise_or <= in0 OR in1;
abs_in1 <= std_logic_vector(abs(signed(in1)));
sign <= in1(3);
temp <= "0000";
shiftL <= std_logic_vector(shift_left(signed(in0),to_integer(unsigned(abs_in1))));
shiftR <= std_logic_vector(shift_right(signed(in0),to_integer(unsigned(abs_in1))));

with sign select
    temp <= shiftL when '1',
            shiftR when others;
        

with op select
    output <= sum when "00",
              abs_dif when "01",
              bitwise_or when "10",
              temp when others; 


end architecture rtl;
