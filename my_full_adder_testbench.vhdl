LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_full_adder_testbench IS
END my_full_adder_testbench;

ARCHITECTURE behavioral OF my_full_adder_testbench IS
    COMPONENT my_full_adder
        PORT (
            a, b : IN STD_LOGIC;
            c_in : IN STD_LOGIC;
            o : OUT STD_LOGIC;
            c_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC;
    SIGNAL c_in : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL c_out_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;
    SIGNAL c_out_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        a, b : STD_LOGIC;
        c_in : STD_LOGIC;
        o : STD_LOGIC;
        c_out : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, c_in, o, c_out
        (a => '0', b => '0', c_in => '0', o => '0', c_out => '0'),
        (a => '0', b => '1', c_in => '0', o => '1', c_out => '0'),
        (a => '1', b => '0', c_in => '0', o => '1', c_out => '0'),
        (a => '1', b => '1', c_in => '0', o => '0', c_out => '1'),
        (a => '0', b => '0', c_in => '1', o => '1', c_out => '0'),
        (a => '0', b => '1', c_in => '1', o => '0', c_out => '1'),
        (a => '1', b => '0', c_in => '1', o => '0', c_out => '1'),
        (a => '1', b => '1', c_in => '1', o => '1', c_out => '1')
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
    bench : my_full_adder PORT MAP(a, b, c_in, o_actual, c_out_actual);

    PROCESS
    BEGIN

    FOR n IN test_cases'RANGE LOOP
        a <= test_cases(n).a;
        b <= test_cases(n).b;
        c_in <= test_cases(n).c_in;
        o_expected <= test_cases(n).o;
        c_out_expected <= test_cases(n).c_out;

        WAIT FOR 10 ns;

        ASSERT (o_actual = o_expected AND c_out_actual = c_out_expected)
        REPORT "test failed for " &
            "a = " & STD_LOGIC'image(a) &
            ", b = " & STD_LOGIC'image(b) &
            ", c_in = " & STD_LOGIC'image(c_in) &
            ". expected o = " & STD_LOGIC'image(o_expected) &
            ", got " & STD_LOGIC'image(o_actual) &
            ". expected c_out = " & STD_LOGIC'image(c_out_expected) &
            ", got " & STD_LOGIC'image(c_out_actual) SEVERITY error;
    END LOOP;
    WAIT;

END PROCESS;

END behavioral;