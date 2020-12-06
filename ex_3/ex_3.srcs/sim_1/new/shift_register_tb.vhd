library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shift_register_tb is
end;

architecture bench of shift_register_tb is

  component shift_register
      Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
             data_out : out STD_LOGIC_VECTOR (3 downto 0);
             serial_data_in_r: in STD_LOGIC;
             serial_data_in_l: in STD_LOGIC;
             clk : in STD_LOGIC;
             reset : in STD_LOGIC;
             sel : in STD_LOGIC_vector(1 downto 0) := "00");
  end component;

  signal data_in: STD_LOGIC_VECTOR (3 downto 0);
  signal data_out: STD_LOGIC_VECTOR (3 downto 0);
  signal serial_data_in_r: STD_LOGIC;
  signal serial_data_in_l: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal sel: STD_LOGIC_vector(1 downto 0) := "00";

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  uut: shift_register port map ( data_in          => data_in,
                                 data_out         => data_out,
                                 serial_data_in_r => serial_data_in_r,
                                 serial_data_in_l => serial_data_in_l,
                                 clk              => clk,
                                 reset            => reset,
                                 sel              => sel );

  stimulus: process
  begin
  
    -- Put initialisation code here

    reset <= '1';
    data_in <= "0000";
    sel <= "00";
    serial_data_in_r <= '0';
    serial_data_in_l <= '0';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

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