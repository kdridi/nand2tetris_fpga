LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux4way IS
    PORT (
        i : IN STD_LOGIC;
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        a, b, c, d : OUT STD_LOGIC
    );
END my_dmux4way;

ARCHITECTURE behavioral OF my_dmux4way IS
    COMPONENT my_dmux
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL ab : STD_LOGIC;
    SIGNAL cd : STD_LOGIC;
BEGIN
    gate_abcd : my_dmux PORT MAP(i, sel(1), ab, cd);
    gate_ab : my_dmux PORT MAP(ab, sel(0), a, b);
    gate_cd : my_dmux PORT MAP(cd, sel(0), c, d);
END behavioral;