library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity top_tb is

end entity top_tb;

architecture sim of top_tb is
  signal symbol_in  : std_logic_vector(3 downto 0) := (others => '0');
  signal symbol_out : std_logic_vector(3 downto 0);
  signal codeword   : std_logic_vector(5 downto 0);

  component gol_enc is
    port (
      symbol   : in  std_logic_vector(3 downto 0);
      codeword : out std_logic_vector(5 downto 0));
  end component gol_enc;

  component gol_dec is
    port (
      codeword : in  std_logic_vector(5 downto 0);
      symbol   : out std_logic_vector(3 downto 0));
  end component gol_dec;

begin  -- architecture sim

  stimili : process is
  begin  -- process stimili
    wait for 20 ns;
    symbol_in <= std_logic_vector(unsigned(symbol_in) + 1);
  end process stimili;


  gol_enc_1 : gol_enc
    port map (
      symbol   => symbol_in,
      codeword => codeword);

  gol_dec_1 : gol_dec
    port map (
      codeword => codeword,
      symbol   => symbol_out);

  assert_check : process is
  begin  -- process assert_check
    wait for 10 ns;
    assert (symbol_in = symbol_out)
      report "Something went wrong! Check your implementation in the Task 1 and Task 2"
      severity failure;
  end process assert_check;

end architecture sim;
