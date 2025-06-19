library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_parallel_adder_tb is
end bcd_parallel_adder_tb;

architecture bcd_parallel_adder_test of bcd_parallel_adder_tb is
   component bcd_parallel_adder
    Port (
      A1, A2, A3, A4: in std_logic_vector(3 downto 0);
      B1, B2, B3, B4: in std_logic_vector(3 downto 0);
      Cin: in std_logic; 
      Cout: inout std_logic;
      Ones, Tens, Hundreds, Thousands: out std_logic_vector(3 downto 0)
     );
   end component;
  signal A1_tb, A2_tb, A3_tb, A4_tb: std_logic_vector(3 downto 0);
  signal B1_tb, B2_tb, B3_tb, B4_tb: std_logic_vector(3 downto 0);
  signal Cin_tb, Cout_tb: std_logic; 
  signal Ones_tb, Tens_tb, Hundreds_tb, Thousands_tb: std_logic_vector(3 downto 0);
  
begin
  uut: bcd_parallel_adder port map (
    A1 => A1_tb, A2 => A2_tb, A3 => A3_tb, A4 => A4_tb,
    B1 => B1_tb, B2 => B2_tb, B3 => B3_tb, B4 => B4_tb,
    Cin => Cin_tb, Cout => Cout_tb,
    Ones => Ones_tb, Tens => Tens_tb, Hundreds => Hundreds_tb, Thousands => Thousands_tb
  );

  check: process
  begin 
   A1_tb <= "0010"; A2_tb <= "1000"; A3_tb <= "0011"; A4_tb <= "1001"; Cin_tb <= '0';
   B1_tb <= "0011"; B2_tb <= "0000"; B3_tb <= "0001"; B4_tb <= "0100"; wait for 10 ns;
   
   A1_tb <= "1001"; A2_tb <= "1001"; A3_tb <= "1001"; A4_tb <= "1001"; Cin_tb <= '1';
   B1_tb <= "1001"; B2_tb <= "1001"; B3_tb <= "1001"; B4_tb <= "1001"; wait for 10 ns;
   
   A1_tb <= "1001"; A2_tb <= "1001"; A3_tb <= "1001"; A4_tb <= "1001"; Cin_tb <= '0';
   B1_tb <= "0001"; B2_tb <= "0000"; B3_tb <= "0000"; B4_tb <= "0000"; wait for 10 ns;
  end process check;
end bcd_parallel_adder_test;