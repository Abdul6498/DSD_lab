library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity prior_enc is
  port (
    r      : in  std_logic_vector(3 downto 0);
    code   : out std_logic_vector(1 downto 0);
    active : out std_logic);
end entity prior_enc;

architecture rtl of prior_enc is

begin  -- architecture rtl
    with r select
     code <= "11" when "1---",
             "10" when "01--",
             "01" when "001-",
             "00" when others;
             
     with r select
     active <= '0' when "0000",
               '1' when others;
     
             

end architecture rtl;
