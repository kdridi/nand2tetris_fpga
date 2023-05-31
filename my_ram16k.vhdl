LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram16k IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_ram16k;

ARCHITECTURE my_ram16k_architecture OF my_ram16k IS
    COMPONENT my_ram4k
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_dmux4way
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_mux4way16
        PORT (
            a, b, c, d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, c, d : STD_LOGIC;
    SIGNAL o_a, o_b, o_c, o_d : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    load_dmux : my_dmux4way PORT MAP(load, sel(13 DOWNTO 12), a, b, c, d);
    ram4k_a : my_ram4k PORT MAP(clk, a, i, sel(11 DOWNTO 0), o_a);
    ram4k_b : my_ram4k PORT MAP(clk, b, i, sel(11 DOWNTO 0), o_b);
    ram4k_c : my_ram4k PORT MAP(clk, c, i, sel(11 DOWNTO 0), o_c);
    ram4k_d : my_ram4k PORT MAP(clk, d, i, sel(11 DOWNTO 0), o_d);
    o_mux : my_mux4way16 PORT MAP(o_a, o_b, o_c, o_d, sel(13 DOWNTO 12), o);
END my_ram16k_architecture;