library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
   Port ( 
      A, B: in std_logic;
      Sum, Carry: out std_logic
   );
end half_adder;

architecture half_adder_arch of half_adder is
begin
     Sum <= A xor B;
     Carry <= A and B;
end half_adder_arch;