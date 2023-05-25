LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux16_testbench IS
END my_dmux16_testbench;

ARCHITECTURE behavioral OF my_dmux16_testbench IS
    COMPONENT my_dmux16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL a_actual, b_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        i : STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : STD_LOGIC;
        a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b
        (i => "0010001011000110", sel => '0', a => "0010001011000110", b => "0000000000000000"),
        (i => "0011001010001000", sel => '1', a => "0000000000000000", b => "0011001010001000"),
        (i => "0111010010111000", sel => '0', a => "0111010010111000", b => "0000000000000000"),
        (i => "1011111100111101", sel => '1', a => "0000000000000000", b => "1011111100111101"),
        (i => "1001010000100000", sel => '0', a => "1001010000100000", b => "0000000000000000"),
        (i => "0101111100111111", sel => '1', a => "0000000000000000", b => "0101111100111111"),
        (i => "1110100110011001", sel => '0', a => "1110100110011001", b => "0000000000000000"),
        (i => "1011111110010010", sel => '1', a => "0000000000000000", b => "1011111110010010"),
        (i => "0001110000101100", sel => '0', a => "0001110000101100", b => "0000000000000000"),
        (i => "0111101000100111", sel => '1', a => "0000000000000000", b => "0111101000100111"),
        (i => "0001100111100101", sel => '0', a => "0001100111100101", b => "0000000000000000"),
        (i => "1101101101001101", sel => '1', a => "0000000000000000", b => "1101101101001101"),
        (i => "0010101010110111", sel => '0', a => "0010101010110111", b => "0000000000000000"),
        (i => "1101001000101011", sel => '1', a => "0000000000000000", b => "1101001000101011"),
        (i => "0111101101111100", sel => '0', a => "0111101101111100", b => "0000000000000000"),
        (i => "0100101010111010", sel => '1', a => "0000000000000000", b => "0100101010111010")
    );

    FUNCTION slv_to_string (slv : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE str : STRING (slv'length - 1 DOWNTO 1) := (OTHERS => NUL);
    BEGIN
        FOR n IN slv'length - 1 DOWNTO 1 LOOP
            str(n) := STD_LOGIC'image(slv((n - 1)))(2);
        END LOOP;
        RETURN str;
    END FUNCTION;

BEGIN
    bench : my_dmux16 PORT MAP(i, sel, a_actual, b_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            sel <= test_cases(n).sel;
            a_expected <= test_cases(n).a;
            b_expected <= test_cases(n).b;

            WAIT FOR 10 ns;

            ASSERT (a_actual = a_expected AND b_actual = b_expected)
            REPORT "test failed for " &
                "i = " & slv_to_string(i) &
                ", sel = " & STD_LOGIC'image(sel) &
                ". expected a = " & slv_to_string(a_expected) &
                ", got " & slv_to_string(a_actual) &
                ". expected b = " & slv_to_string(b_expected) &
                ", got " & slv_to_string(b_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;