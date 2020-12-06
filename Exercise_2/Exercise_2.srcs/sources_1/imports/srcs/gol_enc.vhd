library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity gol_enc is
  port (
    symbol   : in  std_logic_vector(3 downto 0);
    codeword : out std_logic_vector(5 downto 0));
end entity gol_enc;

architecture rtl of gol_enc is
    signal r : std_logic_vector(1 downto 0);
    signal q : std_logic_vector(1 downto 0);
    signal un_q : std_logic_vector(3 downto 0);
begin  -- architecture rtl
    --q = abs
end architecture rtl;
