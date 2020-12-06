----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 10:01:17 AM
-- Design Name: 
-- Module Name: Bin_gray_bin - rtl
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

entity Bin_gray_bin is
    Port ( bin_p : in std_ulogic_vector (7 downto 0);
           gray_p : in STD_ULOGIC_VECTOR (7 downto 0);
           output : out STD_ULOGIC_VECTOR (7 downto 0);
           sel_p : in STD_LOGIC);
end Bin_gray_bin;

architecture rtl of Bin_gray_bin is

signal bin_s : std_ulogic_vector (7 downto 0);
signal gray_s : std_ulogic_vector (7 downto 0);
signal out_bin_s : std_ulogic_vector (7 downto 0);
signal out_gray_s : std_ulogic_vector (7 downto 0);

begin
--Binary to Gray
--Gray to Binary
--B_G : process(bin_p,gray_p,sel_p,help_s,a_s)
--begin
bin_s <= bin_p;
gray_s <= gray_p;
out_bin_s(0) <= gray_s(0);
out_gray_s(0) <= bin_s(0);

loop_1 : for i in 7 downto 1 generate
B_G : process(sel_p,bin_s,gray_s,out_gray_s,out_bin_s)
begin
           if(sel_p='1') then   --Binary to gray
            out_gray_s(i) <= bin_s(i) xor bin_s(i-1);
           else --gray to binary
            out_bin_s(i) <= gray_s(i) xor out_bin_s(i-1);         
           end if; 
end process B_G;         
        end generate;
with sel_p select
    output <= out_gray_s when '1',
              out_bin_s when others;
              
              
--end process B_G;
end rtl;
