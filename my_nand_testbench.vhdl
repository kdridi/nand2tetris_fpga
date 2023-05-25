LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_nand_testbench IS
END my_nand_testbench;

ARCHITECTURE behavioral OF my_nand_testbench IS
    COMPONENT my_nand
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        a, b : STD_LOGIC;
        o : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, o
        ('0', '0', '1'),
        ('0', '1', '1'),
        ('1', '0', '1'),
        ('1', '1', '0')
    );

BEGIN
    bench : my_nand PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "a = " & STD_LOGIC'image(a) &
                ", b = " & STD_LOGIC'image(b) &
                ". expected o = " & STD_LOGIC'image(o_expected) &
                ", got " & STD_LOGIC'image(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;