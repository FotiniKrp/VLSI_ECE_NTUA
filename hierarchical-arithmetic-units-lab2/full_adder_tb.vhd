library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture full_adder_test of full_adder_tb is
   component full_adder
     Port (
        A, B, Cin: in std_logic;
        S, Cout: out std_logic
      );
   end component;
   signal test_input: std_logic_vector(2 downto 0);
   signal Cout_tb, S_tb: std_logic;
begin
  uut: full_adder port map (
    A => test_input(2),
    B => test_input(1),
    S => S_tb,
    Cin => test_input(0),
    Cout => Cout_tb
  );
  
  check: process
  begin 
    test_input <= "000"; wait for 10ns;
    test_input <= "001"; wait for 10ns;
    test_input <= "010"; wait for 10ns;
    test_input <= "011"; wait for 10ns;
    test_input <= "100"; wait for 10ns;
    test_input <= "101"; wait for 10ns;   
    test_input <= "110"; wait for 10ns;
    test_input <= "111"; wait for 10ns;    
  end process check;
end full_adder_test;