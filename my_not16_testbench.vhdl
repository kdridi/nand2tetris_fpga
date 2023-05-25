LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not16_testbench IS
END my_not16_testbench;

ARCHITECTURE behavioral OF my_not16_testbench IS
    COMPONENT my_not16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        i : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, o
        (i => "0000000000000000", o => "1111111111111111"),
        (i => "1111111111111111", o => "0000000000000000"),
        -- generated test cases
        (i => "1100111101000101", o => "0011000010111010"),
        (i => "1101100111001000", o => "0010011000110111"),
        (i => "1001010111000010", o => "0110101000111101"),
        (i => "1101111000100101", o => "0010000111011010"),
        (i => "1010100110110010", o => "0101011001001101"),
        (i => "1111001111110110", o => "0000110000001001"),
        (i => "1110001111110101", o => "0001110000001010"),
        (i => "1110011100011001", o => "0001100011100110"),
        (i => "1000101001011101", o => "0111010110100010"),
        (i => "1111101110100101", o => "0000010001011010"),
        (i => "0111101010110010", o => "1000010101001101"),
        (i => "1101010111100000", o => "0010101000011111"),
        (i => "0110000110011011", o => "1001111001100100"),
        (i => "1110110111000100", o => "0001001000111011"),
        (i => "1100010110100110", o => "0011101001011001"),
        (i => "1111110001110110", o => "0000001110001001")
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
    bench : my_not16 PORT MAP(i, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            i <= test_cases(n).i;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "i = " & slv_to_string(i) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;