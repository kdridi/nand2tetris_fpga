LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux16 IS
    PORT (
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC;
        a, b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_dmux16;

ARCHITECTURE behavioral OF my_dmux16 IS
    COMPONENT my_dmux
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    gate_00 : my_dmux PORT MAP(i(0), sel, a(0), b(0));
    gate_01 : my_dmux PORT MAP(i(1), sel, a(1), b(1));
    gate_02 : my_dmux PORT MAP(i(2), sel, a(2), b(2));
    gate_03 : my_dmux PORT MAP(i(3), sel, a(3), b(3));
    gate_04 : my_dmux PORT MAP(i(4), sel, a(4), b(4));
    gate_05 : my_dmux PORT MAP(i(5), sel, a(5), b(5));
    gate_06 : my_dmux PORT MAP(i(6), sel, a(6), b(6));
    gate_07 : my_dmux PORT MAP(i(7), sel, a(7), b(7));
    gate_08 : my_dmux PORT MAP(i(8), sel, a(8), b(8));
    gate_09 : my_dmux PORT MAP(i(9), sel, a(9), b(9));
    gate_10 : my_dmux PORT MAP(i(10), sel, a(10), b(10));
    gate_11 : my_dmux PORT MAP(i(11), sel, a(11), b(11));
    gate_12 : my_dmux PORT MAP(i(12), sel, a(12), b(12));
    gate_13 : my_dmux PORT MAP(i(13), sel, a(13), b(13));
    gate_14 : my_dmux PORT MAP(i(14), sel, a(14), b(14));
    gate_15 : my_dmux PORT MAP(i(15), sel, a(15), b(15));
END behavioral;