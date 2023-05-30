LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_pc_testbench IS
END my_pc_testbench;

ARCHITECTURE behavioral OF my_pc_testbench IS
    COMPONENT my_pc
        PORT (
            clk : IN STD_LOGIC;
            load, inc, reset : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL clk : STD_LOGIC;
    SIGNAL load, inc, reset : STD_LOGIC;
    SIGNAL i : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR (15 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 ns;

    TYPE test_case IS RECORD
        previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
        load, inc, reset : STD_LOGIC;
        i : STD_LOGIC_VECTOR (15 DOWNTO 0);
        o : STD_LOGIC_VECTOR (15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- previous, load, inc, reset, i, o
        (previous => "UUUUUUUUUUUUUUUU", load => '0', inc => '1', reset => '0', i => "0000100000100100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', inc => '1', reset => '0', i => "1011010100100111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', inc => '1', reset => '1', i => "0100100000001110", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '1', reset => '0', i => "0010011001011111", o => "0010011001011111"),
        (previous => "0010011001011111", load => '0', inc => '0', reset => '1', i => "0011110111011101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '1', i => "0001010001110101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '1', i => "1011111000011000", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '0', reset => '0', i => "1010000110111100", o => "1010000110111100"),
        (previous => "1010000110111100", load => '0', inc => '1', reset => '0', i => "1000100000000100", o => "1010000110111101"),
        (previous => "1010000110111101", load => '0', inc => '1', reset => '1', i => "1001100101100001", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '0', reset => '0', i => "1111101011000110", o => "1111101011000110"),
        (previous => "1111101011000110", load => '1', inc => '0', reset => '1', i => "0101101011001101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '0', i => "0110101111101001", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '1', reset => '0', i => "1011000101010101", o => "1011000101010101"),
        (previous => "1011000101010101", load => '1', inc => '1', reset => '1', i => "0010111010111101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '1', reset => '0', i => "0110111010111100", o => "0000000000000001"),
        (previous => "0000000000000001", load => '0', inc => '1', reset => '1', i => "1011101101101100", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '1', reset => '0', i => "1111111010101100", o => "1111111010101100"),
        (previous => "1111111010101100", load => '0', inc => '0', reset => '0', i => "1001011111000100", o => "1111111010101100"),
        (previous => "1111111010101100", load => '0', inc => '0', reset => '1', i => "0111010101110101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '1', reset => '1', i => "0110011101001100", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '0', i => "0100100100101010", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '1', reset => '1', i => "0010010011110101", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '1', i => "0001100111100110", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '1', i => "0010001000111111", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '0', i => "1010010000100000", o => "0000000000000000"),
        (previous => "0000000000000000", load => '1', inc => '0', reset => '1', i => "1110011111001110", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '0', reset => '0', i => "0001111000000111", o => "0000000000000000"),
        (previous => "0000000000000000", load => '0', inc => '1', reset => '0', i => "1111100100110111", o => "0000000000000001"),
        (previous => "0000000000000001", load => '0', inc => '0', reset => '0', i => "0110001111100101", o => "0000000000000001"),
        (previous => "0000000000000001", load => '0', inc => '0', reset => '0', i => "0000110011001111", o => "0000000000000001"),
        (previous => "0000000000000001", load => '1', inc => '1', reset => '1', i => "1100010101100100", o => "0000000000000000")
    );
    CONSTANT total_cycles : INTEGER := test_cases'LENGTH;
    FUNCTION slv_to_string (slv : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE str : STRING (slv'length - 1 DOWNTO 1) := (OTHERS => NUL);
    BEGIN
        FOR n IN slv'length - 1 DOWNTO 1 LOOP
            str(n) := STD_LOGIC'image(slv((n - 1)))(2);
        END LOOP;
        RETURN str;
    END FUNCTION;

BEGIN
    bench : my_pc PORT MAP(clk, load, inc, reset, i, o_actual);

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
            previous <= test_cases(n).previous;
            load <= test_cases(n).load;
            inc <= test_cases(n).inc;
            reset <= test_cases(n).reset;
            i <= test_cases(n).i;

            WAIT FOR 3 * clk_period / 4;

            o_expected <= test_cases(n).o;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "previous = " & slv_to_string(previous) &
                ". load = " & STD_LOGIC'image(load) &
                ". inc = " & STD_LOGIC'image(inc) &
                ". reset = " & STD_LOGIC'image(reset) &
                ". i = " & slv_to_string(i) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;

            WAIT FOR 1 * clk_period / 4;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;