library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mac_unit_tb is
end mac_unit_tb;

architecture sim of mac_unit_tb is
    signal clk : std_logic := '0';
    signal rom_out : std_logic_vector(7 downto 0) := (others => '0');
    signal ram_out : std_logic_vector(7 downto 0) := (others => '0');
    signal mac_init : std_logic := '0';
    signal y_out : std_logic_vector(18 downto 0);
    
begin
    -- Instantiate the unit under test
    dut : entity work.mac_unit
        port map (
            clk => clk,
            rom_out => rom_out,
            ram_out => ram_out,
            mac_init => mac_init,
            y_out => y_out
        );
        
  
    -- Stimulus process
    check : process
    begin
        clk <= '0'; mac_init <= '1'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 5 ns;
        mac_init <= '0'; wait for 15 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        clk <= '1'; wait for 20 ns;
        --clk <= '0'; mac_init <= '0'; ram_out <= "00000001"; rom_out <= "00000001"; wait for 20 ns;
        --clk <= '1'; wait for 20 ns;
        
    end process;
end sim;