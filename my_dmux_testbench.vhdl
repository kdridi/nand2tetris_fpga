LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux_testbench IS
END my_dmux_testbench;

ARCHITECTURE behavioral OF my_dmux_testbench IS
    COMPONENT my_dmux
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC;
    SIGNAL sel : STD_LOGIC;
    SIGNAL a_actual, b_actual : STD_LOGIC;
    SIGNAL a_expected, b_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        i : STD_LOGIC;
        sel : STD_LOGIC;
        a, b : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, sel, a, b
        (i => '0', sel => '0', a => '0', b => '0'),
        (i => '1', sel => '0', a => '1', b => '0'),
        (i => '0', sel => '1', a => '0', b => '0'),
        (i => '1', sel => '1', a => '0', b => '1')
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
    bench : my_dmux PORT MAP(i, sel, a_actual, b_actual);

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
                "i = " & STD_LOGIC'image(i) &
                ", sel = " & STD_LOGIC'image(sel) &
                ". expected a = " & STD_LOGIC'image(a_expected) &
                ", got " & STD_LOGIC'image(a_actual) &
                ". expected b = " & STD_LOGIC'image(b_expected) &
                ", got " & STD_LOGIC'image(b_actual) SEVERITY error;
        END LOOP;

        WAIT;

    END PROCESS;

END behavioral;