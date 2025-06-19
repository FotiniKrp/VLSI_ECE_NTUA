library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_tb is
end half_adder_tb;

architecture half_adder_test of half_adder_tb is
   component half_adder
     Port (
        A, B: in std_logic;
        Sum, Carry: out std_logic
      );
   end component;
   signal A_tb, B_tb, Sum_tb, Carry_tb: std_logic;
begin
  uut: half_adder port map (
    A => A_tb,
    B => B_tb,
    Sum => Sum_tb,
    Carry => Carry_tb
  );
  
  check: process
  begin 
   A_tb <= '0'; B_tb <= '0';
   wait for 10 ns;
   
   A_tb <= '0'; B_tb <= '1';
   wait for 10 ns;
   
   A_tb <= '1'; B_tb <= '0';
   wait for 10 ns;
   
   A_tb <= '1'; B_tb <= '1';
   wait for 10 ns;
  end process check;
end half_adder_test;