LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux4way16 IS
    PORT (
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        a, b, c, d : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_dmux4way16;

ARCHITECTURE behavioral OF my_dmux4way16 IS
    COMPONENT my_dmux16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL ab : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL cd : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    gate_abcd : my_dmux16 PORT MAP(i, sel(1), ab, cd);
    gate_ab : my_dmux16 PORT MAP(ab, sel(0), a, b);
    gate_cd : my_dmux16 PORT MAP(cd, sel(0), c, d);
END behavioral;