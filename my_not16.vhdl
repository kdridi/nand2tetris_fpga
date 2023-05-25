LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not16 IS
    PORT (
        i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_not16;

ARCHITECTURE behavioral OF my_not16 IS
    COMPONENT my_not
        PORT (
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    gate_00 : my_not PORT MAP(i(0), o(0));
    gate_01 : my_not PORT MAP(i(1), o(1));
    gate_02 : my_not PORT MAP(i(2), o(2));
    gate_03 : my_not PORT MAP(i(3), o(3));
    gate_04 : my_not PORT MAP(i(4), o(4));
    gate_05 : my_not PORT MAP(i(5), o(5));
    gate_06 : my_not PORT MAP(i(6), o(6));
    gate_07 : my_not PORT MAP(i(7), o(7));
    gate_08 : my_not PORT MAP(i(8), o(8));
    gate_09 : my_not PORT MAP(i(9), o(9));
    gate_10 : my_not PORT MAP(i(10), o(10));
    gate_11 : my_not PORT MAP(i(11), o(11));
    gate_12 : my_not PORT MAP(i(12), o(12));
    gate_13 : my_not PORT MAP(i(13), o(13));
    gate_14 : my_not PORT MAP(i(14), o(14));
    gate_15 : my_not PORT MAP(i(15), o(15));
END behavioral;