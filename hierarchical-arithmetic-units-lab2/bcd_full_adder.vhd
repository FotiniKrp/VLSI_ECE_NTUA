library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_full_adder is
   Port (
     Ain, Bin: in std_logic_vector(3 downto 0);
     Carryin: in std_logic;
     S: out std_logic_vector(3 downto 0);
     Carryout: inout std_logic 
   );
end bcd_full_adder;

architecture bcd_full_adder_arch of bcd_full_adder is
  component parallel_adder is 
    port (
        A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        Sum: out std_logic_vector(3 downto 0);
        Cout: out std_logic
     );
  end component;
  signal u1_out_sum, u2_in: std_logic_vector(3 downto 0);
  signal u1_out_cout, u2_out_cout, and1, and2: std_logic;
begin
  u1: parallel_adder port map (A=>Ain, B=>Bin, Cin=>Carryin, Sum=>u1_out_sum, Cout=>u1_out_cout);
  and1 <= u1_out_sum(3) and u1_out_sum(2);
  and2 <= u1_out_sum(3) and u1_out_sum(1);
  Carryout <= and1 or and2 or u1_out_cout; 
  u2_in <= '0'&Carryout&Carryout&'0';
  u2: parallel_adder port map (A=>u2_in, B=>u1_out_sum, Cin=>'0', Sum=>S, Cout=>u2_out_cout);

end bcd_full_adder_arch;
