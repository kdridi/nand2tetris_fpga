LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux8way_testbench IS
END my_dmux8way_testbench;

ARCHITECTURE behavioral OF my_dmux8way_testbench IS
    COMPONENT my_dmux8way
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            a, b, c, d, e, f, g, h : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC;
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual : STD_LOGIC;
    SIGNAL a_expected, b_expected, c_expected, d_expected, e_expected, f_expected, g_expected, h_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        i : STD_LOGIC;
        sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
        a, b, c, d, e, f, g, h : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b, c, d, e, f, g, h
        (i => '0', sel => "000", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "001", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "010", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "011", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "100", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "101", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "110", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '0', sel => "111", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '1', sel => "000", a => '1', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '1', sel => "001", a => '0', b => '1', c => '0', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '1', sel => "010", a => '0', b => '0', c => '1', d => '0', e => '0', f => '0', g => '0', h => '0'),
        (i => '1', sel => "011", a => '0', b => '0', c => '0', d => '1', e => '0', f => '0', g => '0', h => '0'),
        (i => '1', sel => "100", a => '0', b => '0', c => '0', d => '0', e => '1', f => '0', g => '0', h => '0'),
        (i => '1', sel => "101", a => '0', b => '0', c => '0', d => '0', e => '0', f => '1', g => '0', h => '0'),
        (i => '1', sel => "110", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '1', h => '0'),
        (i => '1', sel => "111", a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0', h => '1')
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
    bench : my_dmux8way PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual);

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
                "i = " & STD_LOGIC'image(i) &
                ", sel = " & slv_to_string(sel) &
                ". expected a = " & STD_LOGIC'image(a_expected) &
                ", got " & STD_LOGIC'image(a_actual) &
                ". expected b = " & STD_LOGIC'image(b_expected) &
                ", got " & STD_LOGIC'image(b_actual) &
                ". expected c = " & STD_LOGIC'image(c_expected) &
                ", got " & STD_LOGIC'image(c_actual) &
                ". expected d = " & STD_LOGIC'image(d_expected) &
                ", got " & STD_LOGIC'image(d_actual) &
                ". expected e = " & STD_LOGIC'image(e_expected) &
                ", got " & STD_LOGIC'image(e_actual) &
                ". expected f = " & STD_LOGIC'image(f_expected) &
                ", got " & STD_LOGIC'image(f_actual) &
                ". expected g = " & STD_LOGIC'image(g_expected) &
                ", got " & STD_LOGIC'image(g_actual) &
                ". expected h = " & STD_LOGIC'image(h_expected) &
                ", got " & STD_LOGIC'image(h_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;