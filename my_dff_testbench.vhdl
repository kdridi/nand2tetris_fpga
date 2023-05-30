LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dff_testbench IS
END my_dff_testbench;

ARCHITECTURE behavioral OF my_dff_testbench IS
    COMPONENT my_dff
        PORT (
            clk : IN STD_LOGIC;
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL i : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

    CONSTANT clk_period : TIME := 10 ns;

    TYPE test_case IS RECORD
        i : STD_LOGIC;
        o : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, o
        (i => '0', o => 'U'),
        (i => '1', o => '0'),
        (i => '1', o => '1'),
        (i => '0', o => '1'),
        (i => '0', o => '0'),
        (i => '1', o => '0'),
        (i => '0', o => '1')
    );
    CONSTANT total_cycles : INTEGER := test_cases'LENGTH;
BEGIN
    bench : my_dff PORT MAP(clk, i, o_actual);

    PROCESS
    BEGIN
        clk <= '1';
        WAIT FOR clk_period / 4;

        FOR cycle IN 1 TO total_cycles LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;

            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    PROCESS
    BEGIN
        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            o_expected <= test_cases(n).o;

            WAIT FOR 1 * clk_period / 4;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "i = " & STD_LOGIC'image(i) &
                ". expected o = " & STD_LOGIC'image(o_expected) &
                ", got " & STD_LOGIC'image(o_actual) SEVERITY error;

            WAIT FOR 3 * clk_period / 4;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;