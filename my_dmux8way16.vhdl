LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux8way16 IS
    PORT (
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        a, b, c, d, e, f, g, h : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_dmux8way16;

ARCHITECTURE behavioral OF my_dmux8way16 IS
    COMPONENT my_dmux16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_dmux4way16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL abcd : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL efgh : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    gate : my_dmux16 PORT MAP(i, sel(2), abcd, efgh);
    gate_abcd : my_dmux4way16 PORT MAP(abcd, sel(1 DOWNTO 0), a, b, c, d);
    gate_efgh : my_dmux4way16 PORT MAP(efgh, sel(1 DOWNTO 0), e, f, g, h);
END behavioral;