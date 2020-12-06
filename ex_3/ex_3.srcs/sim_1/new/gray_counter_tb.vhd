library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity gray_counter_tb is
end;

architecture bench of gray_counter_tb is

  component gray_counter
      Port ( clk : in STD_LOGIC;
             count : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal count: STD_LOGIC_VECTOR (3 downto 0);

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  uut: gray_counter port map ( clk   => clk,
                               count => count );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  