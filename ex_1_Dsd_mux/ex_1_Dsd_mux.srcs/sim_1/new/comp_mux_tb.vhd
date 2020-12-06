library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity comp_mux_tb is
end;

architecture bench of comp_mux_tb is

  component comp_mux
    port (
      in0    : in  std_logic_vector(3 downto 0);
      in1    : in  std_logic_vector(3 downto 0);
      op     : in  std_logic_vector(1 downto 0);
      output : out std_logic_vector(3 downto 0));
  end component;

  signal in0: std_logic_vector(3 downto 0);
  signal in1: std_logic_vector(3 downto 0);
  signal op: std_logic_vector(1 downto 0);
  signal output: std_logic_vector(3 downto 0);

begin

  uut: comp_mux port map ( in0    => in0,
                           in1    => in1,
                           op     => op,
                           output => output );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    in0 <= "0010";
    in1 <= "0100";
    op <= "00";
    wait for 10ns;
    
    in0 <= "1010";
    in1 <= "0100";
    op <= "01";
    wait for 10ns;
    
    in0 <= "0010";
    in1 <= "0101";
    op <= "10";
    wait for 10ns;
    
    in0 <= "0011";
    in1 <= "0110";
    op <= "11";
    wait for 10ns;
    
    
    
    

    -- Put test bench stimulus code here

    wait;
  end process;


end;