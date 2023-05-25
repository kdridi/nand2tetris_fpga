LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux_testbench IS
END my_mux_testbench;

ARCHITECTURE behavioral OF my_mux_testbench IS
    COMPONENT my_mux
        PORT (
            a, b : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC;
    SIGNAL sel : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        a, b : STD_LOGIC;
        sel : STD_LOGIC;
        o : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, sel, o
        (a => '0', b => '0', sel => '0', o => '0'),
        (a => '0', b => '1', sel => '0', o => '0'),
        (a => '1', b => '0', sel => '0', o => '1'),
        (a => '1', b => '1', sel => '0', o => '1'),
        (a => '0', b => '0', sel => '1', o => '0'),
        (a => '0', b => '1', sel => '1', o => '1'),
        (a => '1', b => '0', sel => '1', o => '0'),
        (a => '1', b => '1', sel => '1', o => '1')
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
    bench : my_mux PORT MAP(a, b, sel, o_actual);

    PROCESS
    BEGIN

    FOR n IN test_cases'RANGE LOOP
        a <= test_cases(n).a;
        b <= test_cases(n).b;
        sel <= test_cases(n).sel;
        o_expected <= test_cases(n).o;

        WAIT FOR 10 ns;

        ASSERT (o_actual = o_expected) REPORT "test failed for " &
            "a = " & STD_LOGIC'image(a) &
            ", b = " & STD_LOGIC'image(b) &
            ", sel = " & STD_LOGIC'image(sel) &
            ". expected o = " & STD_LOGIC'image(o_expected) &
            ", got " & STD_LOGIC'image(o_actual) SEVERITY error;
    END LOOP;

    WAIT;

END PROCESS;

END behavioral;