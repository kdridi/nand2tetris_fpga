LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux4way16_testbench IS
END my_dmux4way16_testbench;

ARCHITECTURE behavioral OF my_dmux4way16_testbench IS
    COMPONENT my_dmux4way16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected, c_expected, d_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        i : STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
        a, b, c, d : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b, c, d
        (i => "0111110100001010", sel => "00", a => "0111110100001010", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000"),
        (i => "0100010000100010", sel => "01", a => "0000000000000000", b => "0100010000100010", c => "0000000000000000", d => "0000000000000000"),
        (i => "0101001110011010", sel => "10", a => "0000000000000000", b => "0000000000000000", c => "0101001110011010", d => "0000000000000000"),
        (i => "0111110011001111", sel => "11", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0111110011001111"),
        (i => "1101100010010000", sel => "00", a => "1101100010010000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000"),
        (i => "1101101000110110", sel => "01", a => "0000000000000000", b => "1101101000110110", c => "0000000000000000", d => "0000000000000000"),
        (i => "0001001001101011", sel => "10", a => "0000000000000000", b => "0000000000000000", c => "0001001001101011", d => "0000000000000000"),
        (i => "0010000011110001", sel => "11", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0010000011110001"),
        (i => "0011110011001100", sel => "00", a => "0011110011001100", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000"),
        (i => "0111111001110001", sel => "01", a => "0000000000000000", b => "0111111001110001", c => "0000000000000000", d => "0000000000000000"),
        (i => "0000001010101010", sel => "10", a => "0000000000000000", b => "0000000000000000", c => "0000001010101010", d => "0000000000000000"),
        (i => "1111101101101010", sel => "11", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "1111101101101010"),
        (i => "0000111111000001", sel => "00", a => "0000111111000001", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000"),
        (i => "1001110101110111", sel => "01", a => "0000000000000000", b => "1001110101110111", c => "0000000000000000", d => "0000000000000000"),
        (i => "0110010011100001", sel => "10", a => "0000000000000000", b => "0000000000000000", c => "0110010011100001", d => "0000000000000000"),
        (i => "1111100111110110", sel => "11", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "1111100111110110")
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
    bench : my_dmux4way16 PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            sel <= test_cases(n).sel;
            a_expected <= test_cases(n).a;
            b_expected <= test_cases(n).b;
            c_expected <= test_cases(n).c;
            d_expected <= test_cases(n).d;

            WAIT FOR 10 ns;

            ASSERT (a_actual = a_expected AND b_actual = b_expected AND c_actual = c_expected AND d_actual = d_expected)
            REPORT "test failed for " &
                "i = " & slv_to_string(i) &
                ", sel = " & slv_to_string(sel) &
                ". expected a = " & slv_to_string(a_expected) &
                ", got " & slv_to_string(a_actual) &
                ". expected b = " & slv_to_string(b_expected) &
                ", got " & slv_to_string(b_actual) &
                ". expected c = " & slv_to_string(c_expected) &
                ", got " & slv_to_string(c_actual) &
                ". expected d = " & slv_to_string(d_expected) &
                ", got " & slv_to_string(d_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;