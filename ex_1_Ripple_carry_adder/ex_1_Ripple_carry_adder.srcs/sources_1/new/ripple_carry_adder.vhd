----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 05:52:31 PM
-- Design Name: 
-- Module Name: ripple_carry_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_carry_adder is
  Port (x_s : in std_ulogic;
        y_s : in std_ulogic;
        cin_s : in std_ulogic;
        cout_s : out std_ulogic;
        sum_s: out std_ulogic);
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is

begin

sum_s <= x_s xor y_s xor cin_s;
cout_s <= (x_s and y_s) or (x_s and cin_s) or (y_s and cin_s);
end Behavioral;
