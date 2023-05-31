LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram512 IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_ram512;

ARCHITECTURE my_ram512_architecture OF my_ram512 IS
    COMPONENT my_ram64
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
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
    load_dmux : my_dmux8way PORT MAP(load, sel(8 DOWNTO 6), a, b, c, d, e, f, g, h);
    ram64_a : my_ram64 PORT MAP(clk, a, i, sel(5 DOWNTO 0), o_a);
    ram64_b : my_ram64 PORT MAP(clk, b, i, sel(5 DOWNTO 0), o_b);
    ram64_c : my_ram64 PORT MAP(clk, c, i, sel(5 DOWNTO 0), o_c);
    ram64_d : my_ram64 PORT MAP(clk, d, i, sel(5 DOWNTO 0), o_d);
    ram64_e : my_ram64 PORT MAP(clk, e, i, sel(5 DOWNTO 0), o_e);
    ram64_f : my_ram64 PORT MAP(clk, f, i, sel(5 DOWNTO 0), o_f);
    ram64_g : my_ram64 PORT MAP(clk, g, i, sel(5 DOWNTO 0), o_g);
    ram64_h : my_ram64 PORT MAP(clk, h, i, sel(5 DOWNTO 0), o_h);
    o_mux : my_mux8way16 PORT MAP(o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h, sel(8 DOWNTO 6), o);
END my_ram512_architecture;