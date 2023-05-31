LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux8way IS
    PORT (
        i : IN STD_LOGIC;
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        a, b, c, d, e, f, g, h : OUT STD_LOGIC
    );
END my_dmux8way;

ARCHITECTURE behavioral OF my_dmux8way IS
    COMPONENT my_dmux
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_dmux4way
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL abcd : STD_LOGIC;
    SIGNAL efgh : STD_LOGIC;
BEGIN
    gate : my_dmux PORT MAP(i, sel(2), abcd, efgh);
    gate_abcd : my_dmux4way PORT MAP(abcd, sel(1 DOWNTO 0), a, b, c, d);
    gate_efgh : my_dmux4way PORT MAP(efgh, sel(1 DOWNTO 0), e, f, g, h);
END behavioral;