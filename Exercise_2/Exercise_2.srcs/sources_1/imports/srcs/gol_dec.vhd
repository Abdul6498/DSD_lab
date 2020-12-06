library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity gol_dec is
  port (
    codeword : in  std_logic_vector(5 downto 0);
    symbol   : out std_logic_vector(3 downto 0)
    );
end entity gol_dec;

architecture rtl of gol_dec is
begin  -- architecture rtl

end architecture rtl;
