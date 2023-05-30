LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_inc16_testbench IS
END my_inc16_testbench;

ARCHITECTURE behavioral OF my_inc16_testbench IS
    COMPONENT my_inc16
        PORT (
            a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            c : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL c_actual : STD_LOGIC;
    SIGNAL c_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        a : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, o, c
        (a => "0000000000000000", o => "0000000000000001", c => '0'),
        (a => "1111111111111111", o => "0000000000000000", c => '1'),
        -- generated test cases
        (a => "0111011110100111", o => "0111011110101000", c => '0'),
        (a => "1100100100000100", o => "1100100100000101", c => '0'),
        (a => "1010000000010110", o => "1010000000010111", c => '0'),
        (a => "1011011001110101", o => "1011011001110110", c => '0'),
        (a => "1001110000011110", o => "1001110000011111", c => '0'),
        (a => "0011111001111000", o => "0011111001111001", c => '0'),
        (a => "1011011111010111", o => "1011011111011000", c => '0'),
        (a => "0010010001100110", o => "0010010001100111", c => '0'),
        (a => "0111101010111101", o => "0111101010111110", c => '0'),
        (a => "0001011110000001", o => "0001011110000010", c => '0'),
        (a => "0101111001000100", o => "0101111001000101", c => '0'),
        (a => "0011101010001100", o => "0011101010001101", c => '0'),
        (a => "1010011101000100", o => "1010011101000101", c => '0'),
        (a => "1001110110010110", o => "1001110110010111", c => '0'),
        (a => "1010011010001101", o => "1010011010001110", c => '0'),
        (a => "1001011000011100", o => "1001011000011101", c => '0')
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
    bench : my_inc16 PORT MAP(a, o_actual, c_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            o_expected <= test_cases(n).o;
            c_expected <= test_cases(n).c;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected AND c_actual = c_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) &
                ". expected c = " & STD_LOGIC'image(c_expected) &
                ", got " & STD_LOGIC'image(c_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;