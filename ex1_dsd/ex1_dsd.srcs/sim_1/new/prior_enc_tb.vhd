library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity prior_enc_tb is
end;

architecture bench of prior_enc_tb is

  component prior_enc
    port (
      r      : in  std_logic_vector(3 downto 0);
      code   : out std_logic_vector(1 downto 0);
      active : out std_logic);
  end component;

  signal r: std_logic_vector(3 downto 0);
  signal code: std_logic_vector(1 downto 0);
  signal active: std_logic;

begin

  uut: prior_enc port map ( r      => r,
                            code   => code,
                            active => active );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here
  r <= "1000";
  wait for 10 ns;
  
  r <= "0100";
  wait for 10 ns;
  
  r <= "0010";
  wait for 10 ns;  
  
  r <= "0001";
  wait for 10 ns;
  
  r <= "0000";
  wait for 10 ns;

    wait;
  end process;


end;
  