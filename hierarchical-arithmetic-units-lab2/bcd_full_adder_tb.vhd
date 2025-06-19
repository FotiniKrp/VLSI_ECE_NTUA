library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_full_adder_tb is
end bcd_full_adder_tb;

architecture bcd_full_adder_test of bcd_full_adder_tb is
   component bcd_full_adder
     Port (
        Ain, Bin: in std_logic_vector(3 downto 0);
        Carryin: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Carryout: inout std_logic
      );
   end component;
   signal A_tb, B_tb, Sum_tb: std_logic_vector(3 downto 0);
   signal Cin_tb, Cout_tb: std_logic;
begin
  uut: bcd_full_adder port map (
    Ain => A_tb,
    Bin => B_tb,
    S => Sum_tb,
    Carryin => Cin_tb,
    Carryout => Cout_tb
  );
  
  check: process
  begin 
    Cin_tb <= '0'; A_tb <= "1000"; B_tb <= "0001"; wait for 10ns;
    Cin_tb <= '1'; A_tb <= "0000"; B_tb <= "0011"; wait for 10ns; 
    Cin_tb <= '1'; A_tb <= "0110"; B_tb <= "0011"; wait for 10ns;
    Cin_tb <= '1'; A_tb <= "0111"; B_tb <= "1000"; wait for 10ns;
    Cin_tb <= '0'; A_tb <= "0101"; B_tb <= "1001"; wait for 10ns;
    Cin_tb <= '1'; A_tb <= "1001"; B_tb <= "1001"; wait for 10ns;    
  end process check;
end bcd_full_adder_test;