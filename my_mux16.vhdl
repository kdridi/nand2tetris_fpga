LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux16 IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN STD_LOGIC;
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_mux16;

ARCHITECTURE behavioral OF my_mux16 IS
    COMPONENT my_mux
        PORT (
            a, b, sel : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    gate_00 : my_mux PORT MAP(a(0), b(0), sel, o(0));
    gate_01 : my_mux PORT MAP(a(1), b(1), sel, o(1));
    gate_02 : my_mux PORT MAP(a(2), b(2), sel, o(2));
    gate_03 : my_mux PORT MAP(a(3), b(3), sel, o(3));
    gate_04 : my_mux PORT MAP(a(4), b(4), sel, o(4));
    gate_05 : my_mux PORT MAP(a(5), b(5), sel, o(5));
    gate_06 : my_mux PORT MAP(a(6), b(6), sel, o(6));
    gate_07 : my_mux PORT MAP(a(7), b(7), sel, o(7));
    gate_08 : my_mux PORT MAP(a(8), b(8), sel, o(8));
    gate_09 : my_mux PORT MAP(a(9), b(9), sel, o(9));
    gate_10 : my_mux PORT MAP(a(10), b(10), sel, o(10));
    gate_11 : my_mux PORT MAP(a(11), b(11), sel, o(11));
    gate_12 : my_mux PORT MAP(a(12), b(12), sel, o(12));
    gate_13 : my_mux PORT MAP(a(13), b(13), sel, o(13));
    gate_14 : my_mux PORT MAP(a(14), b(14), sel, o(14));
    gate_15 : my_mux PORT MAP(a(15), b(15), sel, o(15));
END behavioral;