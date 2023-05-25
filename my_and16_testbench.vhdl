LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_and16_testbench IS
END my_and16_testbench;

ARCHITECTURE behavioral OF my_and16_testbench IS
    COMPONENT my_and16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, o
        (a => "0000000000000000", b => "0000000000000000", o => "0000000000000000"),
        (a => "0000000000000000", b => "1111111111111111", o => "0000000000000000"),
        (a => "1111111111111111", b => "0000000000000000", o => "0000000000000000"),
        (a => "1111111111111111", b => "1111111111111111", o => "1111111111111111"),
        -- generated test cases
        (a => "0011000101101000", b => "1101110101111100", o => "0001000101101000"),
        (a => "1011000101010111", b => "1000010000110110", o => "1000000000010110"),
        (a => "1101110001100001", b => "1001010101110000", o => "1001010001100000"),
        (a => "0101010001111011", b => "1100000011000011", o => "0100000001000011"),
        (a => "1010101110000101", b => "0110101100001010", o => "0010101100000000"),
        (a => "1011001110110011", b => "1110111010001101", o => "1010001010000001"),
        (a => "1011011111010011", b => "0110000101001100", o => "0010000101000000"),
        (a => "1100000100111100", b => "1100011011001000", o => "1100000000001000"),
        (a => "1000000001100001", b => "0100001100101110", o => "0000000000100000"),
        (a => "0100110100100010", b => "0011011110111001", o => "0000010100100000"),
        (a => "0001110101110001", b => "0001001000001011", o => "0001000000000001"),
        (a => "0101001110100010", b => "1011000000011101", o => "0001000000000000"),
        (a => "1000001001011001", b => "1001111011001100", o => "1000001001001000"),
        (a => "0011010001010101", b => "1111111011000101", o => "0011010001000101"),
        (a => "0001001110000011", b => "0111010110000100", o => "0001000110000000"),
        (a => "0101101010001010", b => "0100010011101011", o => "0100000010001010")
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
    bench : my_and16 PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ", b = " & slv_to_string(b) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;