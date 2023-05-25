LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux8way16_testbench IS
END my_dmux8way16_testbench;

ARCHITECTURE behavioral OF my_dmux8way16_testbench IS
    COMPONENT my_dmux8way16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            a, b, c, d, e, f, g, h : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected, c_expected, d_expected, e_expected, f_expected, g_expected, h_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        i : STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
        a, b, c, d, e, f, g, h : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b, c, d, e, f, g, h
        (i => "1001101011101001", sel => "000", a => "1001101011101001", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1100011111010011", sel => "001", a => "0000000000000000", b => "1100011111010011", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1010100110011001", sel => "010", a => "0000000000000000", b => "0000000000000000", c => "1010100110011001", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "0100110000010011", sel => "011", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0100110000010011", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "0000100001010101", sel => "100", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000100001010101", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "0010001000101000", sel => "101", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0010001000101000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1111101010110111", sel => "110", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "1111101010110111", h => "0000000000000000"),
        (i => "1111001011000001", sel => "111", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "1111001011000001"),
        (i => "0001101000100000", sel => "000", a => "0001101000100000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1011000111101110", sel => "001", a => "0000000000000000", b => "1011000111101110", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "0001101001111110", sel => "010", a => "0000000000000000", b => "0000000000000000", c => "0001101001111110", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "0101110100101110", sel => "011", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0101110100101110", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1111100001000011", sel => "100", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "1111100001000011", f => "0000000000000000", g => "0000000000000000", h => "0000000000000000"),
        (i => "1001111011100111", sel => "101", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "1001111011100111", g => "0000000000000000", h => "0000000000000000"),
        (i => "1100010101000000", sel => "110", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "1100010101000000", h => "0000000000000000"),
        (i => "1011000000011001", sel => "111", a => "0000000000000000", b => "0000000000000000", c => "0000000000000000", d => "0000000000000000", e => "0000000000000000", f => "0000000000000000", g => "0000000000000000", h => "1011000000011001")
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
    bench : my_dmux8way16 PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            sel <= test_cases(n).sel;
            a_expected <= test_cases(n).a;
            b_expected <= test_cases(n).b;
            c_expected <= test_cases(n).c;
            d_expected <= test_cases(n).d;
            e_expected <= test_cases(n).e;
            f_expected <= test_cases(n).f;
            g_expected <= test_cases(n).g;
            h_expected <= test_cases(n).h;

            WAIT FOR 10 ns;

            ASSERT (a_actual = a_expected AND b_actual = b_expected AND c_actual = c_expected AND d_actual = d_expected AND e_actual = e_expected AND f_actual = f_expected AND g_actual = g_expected AND h_actual = h_expected)
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
                ", got " & slv_to_string(d_actual) &
                ". expected e = " & slv_to_string(e_expected) &
                ", got " & slv_to_string(e_actual) &
                ". expected f = " & slv_to_string(f_expected) &
                ", got " & slv_to_string(f_actual) &
                ". expected g = " & slv_to_string(g_expected) &
                ", got " & slv_to_string(g_actual) &
                ". expected h = " & slv_to_string(h_expected) &
                ", got " & slv_to_string(h_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;