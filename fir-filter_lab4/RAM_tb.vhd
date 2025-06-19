library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mlab_ram_tb is
end mlab_ram_tb;

architecture sim of mlab_ram_tb is
    constant DATA_WIDTH : integer := 8;
    
    signal clk : std_logic := '0';
    signal we : std_logic := '0';
    signal en : std_logic := '0';
    signal addr : std_logic_vector(2 downto 0) := "000";
    signal di : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal do : std_logic_vector(DATA_WIDTH-1 downto 0);
    
begin
    -- Instantiate the unit under test
    dut : entity work.mlab_ram
        generic map (
            data_width => DATA_WIDTH
        )
        port map (
            clk => clk,
            we => we,
            en => en,
            addr => addr,
            di => di,
            do => do
        );
   check: process
   begin
      we <= '1'; en <= '1'; di <= "00000001"; wait for 10 ns;
      clk <= '1'; wait for 10 ns; 
      
      clk <= '0'; di <= "00000011"; wait for 10 ns;
      clk <= '1'; wait for 10 ns; 
      
      clk <= '0'; we <= '0'; addr <= "000"; wait for 10 ns; 
      clk <= '1'; wait for 10 ns;
      
      clk <= '0'; addr <= "001"; wait for 10 ns; 
      clk <= '1'; wait for 10 ns;
   end process;     
end sim;