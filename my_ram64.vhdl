LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram64 IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END my_ram64;

ARCHITECTURE my_ram64_architecture OF my_ram64 IS
    COMPONENT my_ram8
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
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
    load_dmux : my_dmux8way PORT MAP(load, sel(5 DOWNTO 3), a, b, c, d, e, f, g, h);
    ram8_a : my_ram8 PORT MAP(clk, a, i, sel(2 DOWNTO 0), o_a);
    ram8_b : my_ram8 PORT MAP(clk, b, i, sel(2 DOWNTO 0), o_b);
    ram8_c : my_ram8 PORT MAP(clk, c, i, sel(2 DOWNTO 0), o_c);
    ram8_d : my_ram8 PORT MAP(clk, d, i, sel(2 DOWNTO 0), o_d);
    ram8_e : my_ram8 PORT MAP(clk, e, i, sel(2 DOWNTO 0), o_e);
    ram8_f : my_ram8 PORT MAP(clk, f, i, sel(2 DOWNTO 0), o_f);
    ram8_g : my_ram8 PORT MAP(clk, g, i, sel(2 DOWNTO 0), o_g);
    ram8_h : my_ram8 PORT MAP(clk, h, i, sel(2 DOWNTO 0), o_h);
    o_mux : my_mux8way16 PORT MAP(o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h, sel(5 DOWNTO 3), o);
END my_ram64_architecture;