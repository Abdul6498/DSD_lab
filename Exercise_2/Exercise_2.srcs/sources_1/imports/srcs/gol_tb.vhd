library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library xil_defaultlib;
use xil_defaultlib.auxiliary.all;

-------------------------------------------------------------------------------

entity gol_tb is

end entity gol_tb;

-------------------------------------------------------------------------------

architecture sim of gol_tb is

  component gol is
    port (
      grid_in  : in  grid_t;
      grid_out : out grid_t);
  end component gol;

  -- component ports
  signal grid_in  : grid_t := (('0','0','0','0','0','0'),
                               ('0','0','0','0','0','0'),
                               ('0','0','0','0','0','0'),
                               ('0','0','1','1','1','0'),
                               ('0','1','1','1','0','0'),
                               ('0','0','0','0','0','0'));
  signal grid_out : grid_t;


begin  -- architecture sim

  -- Toad Oscillator!
  grid_in <= grid_out after 10 ns;

  -- component instantiation
  DUT: gol
    port map (
      grid_in  => grid_in,
      grid_out => grid_out);

end architecture sim;

-------------------------------------------------------------------------------
