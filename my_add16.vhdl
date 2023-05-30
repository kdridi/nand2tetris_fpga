LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_add16 IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : OUT STD_LOGIC
    );
END my_add16;

ARCHITECTURE behavioral OF my_add16 IS
    COMPONENT my_half_adder
        PORT (
            a, b : IN STD_LOGIC;
            o, c : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_full_adder
        PORT (
            a, b : IN STD_LOGIC;
            c_in : IN STD_LOGIC;
            o : OUT STD_LOGIC;
            c_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL carry : STD_LOGIC_VECTOR(14 DOWNTO 0);
BEGIN
    bit_00 : my_half_adder PORT MAP(a(0), b(0), o(0), carry(0));
    bit_01 : my_full_adder PORT MAP(a(1), b(1), carry(0), o(1), carry(1));
    bit_02 : my_full_adder PORT MAP(a(2), b(2), carry(1), o(2), carry(2));
    bit_03 : my_full_adder PORT MAP(a(3), b(3), carry(2), o(3), carry(3));
    bit_04 : my_full_adder PORT MAP(a(4), b(4), carry(3), o(4), carry(4));
    bit_05 : my_full_adder PORT MAP(a(5), b(5), carry(4), o(5), carry(5));
    bit_06 : my_full_adder PORT MAP(a(6), b(6), carry(5), o(6), carry(6));
    bit_07 : my_full_adder PORT MAP(a(7), b(7), carry(6), o(7), carry(7));
    bit_08 : my_full_adder PORT MAP(a(8), b(8), carry(7), o(8), carry(8));
    bit_09 : my_full_adder PORT MAP(a(9), b(9), carry(8), o(9), carry(9));
    bit_10 : my_full_adder PORT MAP(a(10), b(10), carry(9), o(10), carry(10));
    bit_11 : my_full_adder PORT MAP(a(11), b(11), carry(10), o(11), carry(11));
    bit_12 : my_full_adder PORT MAP(a(12), b(12), carry(11), o(12), carry(12));
    bit_13 : my_full_adder PORT MAP(a(13), b(13), carry(12), o(13), carry(13));
    bit_14 : my_full_adder PORT MAP(a(14), b(14), carry(13), o(14), carry(14));
    bit_15 : my_full_adder PORT MAP(a(15), b(15), carry(14), o(15), c);
END behavioral;