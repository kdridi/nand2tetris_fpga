LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux8way16 IS
    PORT (
        a, b, c, d, e, f, g, h : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_mux8way16;

ARCHITECTURE behavioral OF my_mux8way16 IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_mux4way16
        PORT (
            a, b, c, d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL abcd, efgh : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    gate_abcd : my_mux4way16 PORT MAP(a, b, c, d, sel(1 DOWNTO 0), abcd);
    gate_efgh : my_mux4way16 PORT MAP(e, f, g, h, sel(1 DOWNTO 0), efgh);
    gate_o : my_mux16 PORT MAP(abcd, efgh, sel(2), o);
END behavioral;