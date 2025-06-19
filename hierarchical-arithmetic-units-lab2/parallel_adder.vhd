library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder is
   port (
      A, B: in std_logic_vector(3 downto 0);
      Cin: in std_logic;
      Sum: out std_logic_vector(3 downto 0);
      Cout: out std_logic
   );
end parallel_adder;

architecture parallel_adder_arch of parallel_adder is
  signal u1_out_carry, u2_out_carry, u3_out_carry: std_logic;
  component full_adder is
    Port (
       A,B,Cin: in std_logic;
       S, Cout: out std_logic
     );
  end component;
begin
  u1: full_adder port map(A=>A(0), B=>B(0), Cin=>Cin, S=>Sum(0), Cout=>u1_out_carry);
  u2: full_adder port map(A=>A(1), B=>B(1), Cin=>u1_out_carry, S=>Sum(1), Cout=>u2_out_carry);
  u3: full_adder port map(A=>A(2), B=>B(2), Cin=>u2_out_carry, S=>Sum(2), Cout=>u3_out_carry);
  u4: full_adder port map(A=>A(3), B=>B(3), Cin=>u3_out_carry, S=>Sum(3), Cout=>Cout);
end parallel_adder_arch;
