library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Bin_gray_bin_tb is
end;

architecture bench of Bin_gray_bin_tb is

  component Bin_gray_bin
      Port ( bin_p : in std_ulogic_vector (7 downto 0);
             gray_p : in STD_ULOGIC_VECTOR (7 downto 0);
             sel_p : in STD_LOGIC;
             output : out STD_ULOGIC_VECTOR (7 downto 0));
  end component;

  signal bin_p: std_ulogic_vector (7 downto 0);
  signal gray_p: STD_ULOGIC_VECTOR (7 downto 0);
  signal sel_p: STD_LOGIC;
  signal output : STD_ULOGIC_VECTOR (7 downto 0);

begin

  uut: Bin_gray_bin port map ( bin_p  => bin_p,
                               gray_p => gray_p,
                               sel_p  => sel_p,
                               output => output);

  stimulus: process
  begin
  
  bin_p <= "11011010";
  gray_p <= "10110111";
  sel_p <= '1';
  wait for 10ns;
  
  
  gray_p <= "10110111";
  bin_p <= "11011010";   
  sel_p <= '0';  
  wait for 10ns;

  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;