LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_xor16 IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END my_xor16;

ARCHITECTURE behavioral OF my_xor16 IS
    COMPONENT my_xor
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    and00_gate : my_xor PORT MAP(a(0), b(0), o(0));
    and01_gate : my_xor PORT MAP(a(1), b(1), o(1));
    and02_gate : my_xor PORT MAP(a(2), b(2), o(2));
    and03_gate : my_xor PORT MAP(a(3), b(3), o(3));
    and04_gate : my_xor PORT MAP(a(4), b(4), o(4));
    and05_gate : my_xor PORT MAP(a(5), b(5), o(5));
    and06_gate : my_xor PORT MAP(a(6), b(6), o(6));
    and07_gate : my_xor PORT MAP(a(7), b(7), o(7));
    and08_gate : my_xor PORT MAP(a(8), b(8), o(8));
    and09_gate : my_xor PORT MAP(a(9), b(9), o(9));
    and10_gate : my_xor PORT MAP(a(10), b(10), o(10));
    and11_gate : my_xor PORT MAP(a(11), b(11), o(11));
    and12_gate : my_xor PORT MAP(a(12), b(12), o(12));
    and13_gate : my_xor PORT MAP(a(13), b(13), o(13));
    and14_gate : my_xor PORT MAP(a(14), b(14), o(14));
    and15_gate : my_xor PORT MAP(a(15), b(15), o(15));
END behavioral;