library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library xil_defaultlib;
use xil_defaultlib.auxiliary.all;

entity gol is
  port (
    grid_in  : in  grid_t;
    grid_out : out grid_t);
end entity gol;

architecture rtl of gol is

begin  -- architecture rtl

end architecture rtl;
