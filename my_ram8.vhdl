LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram8 IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END my_ram8;

ARCHITECTURE my_ram8_architecture OF my_ram8 IS
    COMPONENT my_register
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
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
    load_dmux : my_dmux8way PORT MAP(load, sel, a, b, c, d, e, f, g, h);
    register_a : my_register PORT MAP(clk, a, i, o_a);
    register_b : my_register PORT MAP(clk, b, i, o_b);
    register_c : my_register PORT MAP(clk, c, i, o_c);
    register_d : my_register PORT MAP(clk, d, i, o_d);
    register_e : my_register PORT MAP(clk, e, i, o_e);
    register_f : my_register PORT MAP(clk, f, i, o_f);
    register_g : my_register PORT MAP(clk, g, i, o_g);
    register_h : my_register PORT MAP(clk, h, i, o_h);
    o_mux : my_mux8way16 PORT MAP(o_a, o_b, o_c, o_d, o_e, o_f, o_g, o_h, sel, o);
END my_ram8_architecture;