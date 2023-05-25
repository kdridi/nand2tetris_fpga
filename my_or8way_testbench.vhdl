LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or8way_testbench IS
END my_or8way_testbench;

ARCHITECTURE behavioral OF my_or8way_testbench IS
    COMPONENT my_or8way
        PORT (
            i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        i : STD_LOGIC_VECTOR(7 DOWNTO 0);
        o : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, o
        (i => "00000000", o => '0'),
        (i => "11111111", o => '1'),
        -- generated test cases
        (i => "01000111", o => '1'),
        (i => "11100000", o => '1'),
        (i => "11001000", o => '1'),
        (i => "00100101", o => '1'),
        (i => "01100111", o => '1'),
        (i => "01110111", o => '1'),
        (i => "11101001", o => '1'),
        (i => "01011001", o => '1'),
        (i => "11101000", o => '1'),
        (i => "11101000", o => '1'),
        (i => "01010101", o => '1'),
        (i => "01011010", o => '1'),
        (i => "11000010", o => '1'),
        (i => "11011001", o => '1'),
        (i => "10101010", o => '1'),
        (i => "11110010", o => '1')
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
    bench : my_or8way PORT MAP(i, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "i = " & slv_to_string(i) &
                ". expected o = " & STD_LOGIC'image(o_expected) &
                ", got " & STD_LOGIC'image(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;