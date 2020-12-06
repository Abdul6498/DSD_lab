library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AND_Gate_tb is
end;

architecture bench of AND_Gate_tb is

  component AND_Gate
      Port ( a : in STD_LOGIC;
             b : in STD_LOGIC;
             c : out STD_LOGIC);
  end component;

  signal a: STD_LOGIC;
  signal b: STD_LOGIC;
  signal c: STD_LOGIC;

begin

  uut: AND_Gate port map ( a => a,
                           b => b,
                           c => c );

  stimulus: process
  begin
  
  a <= '0';
  b <= '0';
  wait for 10 ns;
  
  a <= '0';
  b <= '1';
  wait for 10 ns;
  
  a <= '1';
  b <= '0';
  wait for 10 ns;
    
  a <= '1';
  b <= '1';
  wait for 10 ns;
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;