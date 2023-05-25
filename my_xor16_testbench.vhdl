LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_xor16_testbench IS
END my_xor16_testbench;

ARCHITECTURE behavioral OF my_xor16_testbench IS
    COMPONENT my_xor16
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
        (a => "0000000000000000", b => "1111111111111111", o => "1111111111111111"),
        (a => "1111111111111111", b => "0000000000000000", o => "1111111111111111"),
        (a => "1111111111111111", b => "1111111111111111", o => "0000000000000000"),
        -- generated test cases
        (a => "1111110101101100", b => "1110000100011101", o => "0001110001110001"),
        (a => "0110010110101011", b => "0111000010010010", o => "0001010100111001"),
        (a => "0001010111011000", b => "0111000101010001", o => "0110010010001001"),
        (a => "0010100101111101", b => "0110001101010110", o => "0100101000101011"),
        (a => "0010111001010000", b => "1010010101110111", o => "1000101100100111"),
        (a => "1101111110100100", b => "0110001101001111", o => "1011110011101011"),
        (a => "1101101011101000", b => "0001010001011101", o => "1100111010110101"),
        (a => "1110110111000101", b => "0001101000001010", o => "1111011111001111"),
        (a => "0011000100010111", b => "0110011000101101", o => "0101011100111010"),
        (a => "0000110111000110", b => "1001001000101101", o => "1001111111101011"),
        (a => "1100110010111110", b => "0000000110001001", o => "1100110100110111"),
        (a => "1001111100000100", b => "1000011110100010", o => "0001100010100110"),
        (a => "0000101111101111", b => "1101101000111101", o => "1101000111010010"),
        (a => "1100010111111100", b => "0110001101110111", o => "1010011010001011"),
        (a => "0001110110100110", b => "0010111101011011", o => "0011001011111101"),
        (a => "0000100100101101", b => "0001101100010011", o => "0001001000111110")
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
    bench : my_xor16 PORT MAP(a, b, o_actual);

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