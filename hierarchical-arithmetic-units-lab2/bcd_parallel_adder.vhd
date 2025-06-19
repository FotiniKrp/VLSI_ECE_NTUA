library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_parallel_adder is
   Port (
      A1, A2, A3, A4: in std_logic_vector(3 downto 0);
      B1, B2, B3, B4: in std_logic_vector(3 downto 0);
      Cin: in std_logic; 
      Cout: inout std_logic;
      Ones, Tens, Hundreds, Thousands: out std_logic_vector(3 downto 0)
   );
end bcd_parallel_adder;

architecture bcd_parallel_adder_arch of bcd_parallel_adder is
  component bcd_full_adder is
     Port (
       Ain, Bin: in std_logic_vector(3 downto 0);
       Carryin: in std_logic;
       S: out std_logic_vector(3 downto 0);
       Carryout: inout std_logic 
     );
  end component;
  signal c1_out, c2_out, c3_out: std_logic;
begin
  u1: bcd_full_adder port map (Ain=>A1, Bin=>B1, Carryin=>Cin, S=>Ones, Carryout=>c1_out);
  u2: bcd_full_adder port map (Ain=>A2, Bin=>B2, Carryin=>c1_out, S=>Tens, Carryout=>c2_out);
  u3: bcd_full_adder port map (Ain=>A3, Bin=>B3, Carryin=>c2_out, S=>Hundreds, Carryout=>c3_out);
  u4: bcd_full_adder port map (Ain=>A4, Bin=>B4, Carryin=>c3_out, S=>Thousands, Carryout=>Cout);
end bcd_parallel_adder_arch;