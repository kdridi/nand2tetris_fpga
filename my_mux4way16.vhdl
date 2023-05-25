LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux4way16 IS
    PORT (
        a, b, c, d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_mux4way16;

ARCHITECTURE behavioral OF my_mux4way16 IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL ab : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL cd : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    gate_ab : my_mux16 PORT MAP(a, b, sel(0), ab);
    gate_cd : my_mux16 PORT MAP(c, d, sel(0), cd);
    gate_o : my_mux16 PORT MAP(ab, cd, sel(1), o);
END behavioral;