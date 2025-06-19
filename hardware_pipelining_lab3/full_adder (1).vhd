library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
          A, B, Cin, Clk: in std_logic;
          Sum, Cout: out std_logic
          );
end full_adder;

architecture fa_arch of full_adder is
    signal con: std_logic_vector(2 downto 0);
begin
 con <= A&B&Cin;
 process(Clk)
 begin
    if (Clk'event and Clk='1') then 
        case con is
      when "000" => 
         Sum <= '0'; Cout <= '0';
      when "001" =>
         Sum <= '1'; Cout <= '0';
      when "010" =>
         Sum <= '1'; Cout <= '0';
      when "011" =>
         Sum <= '0'; Cout <= '1';
      when "100" =>
         Sum <= '1'; Cout <= '0';
      when "101" =>
         Sum <= '0'; Cout <= '1';
      when "110" =>
         Sum <= '0'; Cout <= '1';
      when "111" =>
         Sum <= '1'; Cout <= '1';
      when others =>
         Sum <= 'U'; Cout <= 'U';
     end case;
    end if;
 end process;
end fa_arch;