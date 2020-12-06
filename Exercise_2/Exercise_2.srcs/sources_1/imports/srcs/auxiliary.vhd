library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package auxiliary is

  constant WIDTH : natural := 6;
  constant HEIGHT : natural := 6;

  -------------------------
  --    |   |   |   |    --
  -- ---o---o---o---o--- --
  -- ---o---o---o---o--- --
  -- ---o---o---o---o--- --
  -- ---o---o---o---o--- --
  --    |   |   |   |    --
  -------------------------
  type grid_t is array (HEIGHT-1 downto 0, WIDTH-1 downto 0) of std_logic;
end package auxiliary;
