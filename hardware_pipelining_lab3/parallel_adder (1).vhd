library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder is
    Port (
        A, B : in STD_LOGIC_VECTOR(3 downto 0);
        Clk, Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR(3 downto 0)
    );
end parallel_adder;

architecture pipeline_pa of parallel_adder is
    component full_adder is
        Port (
            A, B, Cin, Clk: in  STD_LOGIC;
            Sum, Cout: out  STD_LOGIC
        );
    end component;
    
    signal A2, B2: std_logic_vector(2 downto 0);
    signal A3, B3: std_logic_vector(1 downto 0);
    signal A4, B4, C2, C3, C4, S1: std_logic;
    signal S2: std_logic_vector(1 downto 0);
    signal S3: std_logic_vector(2 downto 0);
begin
    process(Clk)
    begin
        if (Clk'event and Clk='1') then
            A2 <= A(3 downto 1);
            A3 <= A2(2 downto 1);
            A4 <= A3(1);
            B2 <= B(3 downto 1);
            B3 <= B2(2 downto 1);
            B4 <= B3(1);
            S2(0) <= S1;
            S3(1 downto 0) <= S2;
            Sum(2 downto 0) <= S3;
        end if;
    end process;

    fa_0: full_adder port map(
        A => A(0), B => B(0), Cin => Cin, 
        Sum => S1, Cout => C2, Clk => Clk
    );
    fa_1: full_adder port map(
        A => A2(0), B => B2(0), Cin => C2, 
        Sum => S2(1), Cout => C3, Clk => Clk
    );
    fa_2: full_adder port map(
        A => A3(0), B => B3(0), Cin => C3, 
        Sum => S3(2), Cout => C4, Clk => Clk
    );
    fa_3: full_adder port map(
        A => A4, B => B4, Cin => C4, 
        Sum => Sum(3), Cout => Cout, Clk => Clk
    );
end pipeline_pa;