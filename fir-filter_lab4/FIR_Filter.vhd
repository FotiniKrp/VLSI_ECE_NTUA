library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fir_filter is
  port ( 
        clk, reset, valid_in: in std_logic;
        x: in std_logic_vector(7 downto 0);
        valid_out: out std_logic;
        y: out std_logic_vector(18 downto 0)
        );
end fir_filter;

architecture fir_filter_arch of fir_filter is
    component mac_unit is
    port (
        clk : in std_logic;
        rom_out : in std_logic_vector(7 downto 0); 
        ram_out : in std_logic_vector(7 downto 0); 
        mac_init : in std_logic;
        valid_out: out std_logic;
        valid_out_tmp: in std_logic;
        y_out : out std_logic_vector(18 downto 0) 
    );
    end component;
    
    component control_unit is
    port (
        clk : in std_logic;
        reset : in std_logic;
        valid_in: in std_logic;
        mac_init : out std_logic;
        we, en: out std_logic;
        valid_out_tmp: out std_logic;
        rom_address : out std_logic_vector(2 downto 0);
        ram_address : out std_logic_vector(2 downto 0)
    );
    end component;
    
    component mlab_ram is
    generic (
        data_width : integer :=8                  
    );
    port (clk  : in std_logic;
          reset: in std_logic;
          we   : in std_logic;                        
          en   : in std_logic;                       
          addr : in std_logic_vector(2 downto 0);            
          di   : in std_logic_vector(data_width-1 downto 0);        
          do   : out std_logic_vector(data_width-1 downto 0));
    end component;
    
    component mlab_rom is
    generic (
        coeff_width : integer :=8                        
     );
    port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;                                    
           addr : in  STD_LOGIC_VECTOR (2 downto 0);            
           rom_out : out  STD_LOGIC_VECTOR (coeff_width-1 downto 0));    
    end component; 
    
    component D1 is 
    port ( 
          reset, Clk, D: in std_logic;
          Q: out std_logic
         );
    end component;
    
    component D2 is
    Port( 
          Clk, reset, D: in std_logic;
          Q: out std_logic
         );
    end component;
    
    signal rom_out, ram_out: std_logic_vector(7 downto 0);
    signal rom_ad, ram_ad: std_logic_vector(2 downto 0);
    signal mac_i, mac_ii, we, en, pr_i, pr_ii: std_logic;
begin
    control: control_unit port map(clk => clk, reset => reset, valid_in => valid_in,
                                   mac_init => mac_i, rom_address => rom_ad,
                                   ram_address => ram_ad, we => we, en => en, valid_out_tmp => pr_i);
    valid_ff: D1 port map (clk => clk, D => pr_i, Q => pr_ii, reset => reset);
    mac_in_delay: D1 port map (clk => clk, D => mac_i, Q => mac_ii, reset => '0');
    ram: mlab_ram generic map(data_width => 8)
         port map(clk => clk, reset => reset, 
                  we => we, en => en, addr => ram_ad, di => x, do => ram_out);
    rom: mlab_rom generic map(coeff_width => 8)
         port map(clk => clk, en => en, addr => rom_ad, rom_out => rom_out);
    mac: mac_unit port map (clk => clk, rom_out => rom_out, ram_out => ram_out, valid_out_tmp => pr_ii,
                            valid_out => valid_out, mac_init => mac_ii, y_out => y);
end fir_filter_arch;