LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not_testbench IS
END my_not_testbench;

ARCHITECTURE behavioral OF my_not_testbench IS
    COMPONENT my_not
        PORT (
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        i : STD_LOGIC;
        o : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, o
        ('0', '1'),
        ('1', '0')
    );

BEGIN
    bench : my_not PORT MAP(i, o_actual);

    PROCESS
    BEGIN

    FOR n IN test_cases'RANGE LOOP
        i <= test_cases(n).i;
        o_expected <= test_cases(n).o;

        WAIT FOR 10 ns;

        ASSERT (o_actual = o_expected)
        REPORT "test failed for " &
            "i = " & STD_LOGIC'image(i) &
            ". expected o = " & STD_LOGIC'image(o_expected) &
            ", got " & STD_LOGIC'image(o_actual) SEVERITY error;
    END LOOP;
    WAIT;

END PROCESS;

END behavioral;