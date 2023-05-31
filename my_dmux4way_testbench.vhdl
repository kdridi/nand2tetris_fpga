LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux4way_testbench IS
END my_dmux4way_testbench;

ARCHITECTURE behavioral OF my_dmux4way_testbench IS
    COMPONENT my_dmux4way
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC;
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual : STD_LOGIC;
    SIGNAL a_expected, b_expected, c_expected, d_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        i : STD_LOGIC;
        sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
        a, b, c, d : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b, c, d
        (i => '0', sel => "00", a => '0', b => '0', c => '0', d => '0'),
        (i => '0', sel => "01", a => '0', b => '0', c => '0', d => '0'),
        (i => '0', sel => "10", a => '0', b => '0', c => '0', d => '0'),
        (i => '0', sel => "11", a => '0', b => '0', c => '0', d => '0'),
        (i => '1', sel => "00", a => '1', b => '0', c => '0', d => '0'),
        (i => '1', sel => "01", a => '0', b => '1', c => '0', d => '0'),
        (i => '1', sel => "10", a => '0', b => '0', c => '1', d => '0'),
        (i => '1', sel => "11", a => '0', b => '0', c => '0', d => '1')
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
    bench : my_dmux4way PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual);

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
                "i = " & STD_LOGIC'image(i) &
                ", sel = " & slv_to_string(sel) &
                ". expected a = " & STD_LOGIC'image(a_expected) &
                ", got " & STD_LOGIC'image(a_actual) &
                ". expected b = " & STD_LOGIC'image(b_expected) &
                ", got " & STD_LOGIC'image(b_actual) &
                ". expected c = " & STD_LOGIC'image(c_expected) &
                ", got " & STD_LOGIC'image(c_actual) &
                ". expected d = " & STD_LOGIC'image(d_expected) &
                ", got " & STD_LOGIC'image(d_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;