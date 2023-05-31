LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram4k IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_ram4k;

ARCHITECTURE my_ram4k_architecture OF my_ram4k IS
    COMPONENT my_ram512
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_dmux8way
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            a, b, c, d, e, f, g, h : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_mux8way16
        PORT (
            a, b, c, d, e, f, g, h : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, c, d, e, f, g, h : STD_LOGIC;
    SIGNAL o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    load_dmux : my_dmux8way PORT MAP(load, sel(11 DOWNTO 9), a, b, c, d, e, f, g, h);
    ram512_a : my_ram512 PORT MAP(clk, a, i, sel(8 DOWNTO 0), o_a);
    ram512_b : my_ram512 PORT MAP(clk, b, i, sel(8 DOWNTO 0), o_b);
    ram512_c : my_ram512 PORT MAP(clk, c, i, sel(8 DOWNTO 0), o_c);
    ram512_d : my_ram512 PORT MAP(clk, d, i, sel(8 DOWNTO 0), o_d);
    ram512_e : my_ram512 PORT MAP(clk, e, i, sel(8 DOWNTO 0), o_e);
    ram512_f : my_ram512 PORT MAP(clk, f, i, sel(8 DOWNTO 0), o_f);
    ram512_g : my_ram512 PORT MAP(clk, g, i, sel(8 DOWNTO 0), o_g);
    ram512_h : my_ram512 PORT MAP(clk, h, i, sel(8 DOWNTO 0), o_h);
    o_mux : my_mux8way16 PORT MAP(o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h, sel(11 DOWNTO 9), o);
END my_ram4k_architecture;