library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
       A,B,Cin: in std_logic;
       S, Cout: out std_logic
     );
end full_adder;

architecture full_adder_arch of full_adder is
  signal u1_out_carry, u1_out_sum, u2_out_carry: std_logic;
  component half_adder is 
    port (
       A,B: in std_logic;
       Sum, Carry: out std_logic
    );
  end component;
begin
  u1:half_adder port map(A=>A, B=>B, Sum=>u1_out_sum, Carry=>u1_out_carry);
  u2:half_adder port map(A=>u1_out_sum, B=>Cin, Sum=>S, Carry=>u2_out_carry);
  Cout <= u1_out_carry or u2_out_carry;
end full_adder_arch;