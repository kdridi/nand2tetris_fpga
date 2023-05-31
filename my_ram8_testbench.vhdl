LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram8_testbench IS
END my_ram8_testbench;

ARCHITECTURE behavioral OF my_ram8_testbench IS
    COMPONENT my_ram8
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL clk : STD_LOGIC;
    SIGNAL load : STD_LOGIC;
    SIGNAL i : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR (15 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 ns;

    TYPE test_case IS RECORD
        previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
        load : STD_LOGIC;
        i : STD_LOGIC_VECTOR (15 DOWNTO 0);
        sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
        o : STD_LOGIC_VECTOR (15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- previous, load, i, sel, o
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1100110110010000", sel => "111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0001110100001000", sel => "100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000101111110001", sel => "010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0111001010101001", sel => "111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0111001011101000", sel => "101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0101101011111001", sel => "101", o => "0101101011111001"),
        (previous => "0101101011111001", load => '0', i => "0100010001001000", sel => "101", o => "0101101011111001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011101010011010", sel => "110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101000100111100", sel => "000", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101000101110000", sel => "111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1010001101100111", sel => "100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1001000001100011", sel => "110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1100000101100110", sel => "010", o => "1100000101100110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1101110110011101", sel => "011", o => "1101110110011101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1101011110010010", sel => "111", o => "1101011110010010"),
        (previous => "0101101011111001", load => '0', i => "1010010011011111", sel => "101", o => "0101101011111001"),
        (previous => "0101101011111001", load => '1', i => "1001111011100100", sel => "101", o => "1001111011100100"),
        (previous => "1101110110011101", load => '1', i => "1100010011111010", sel => "011", o => "1100010011111010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0001100001010010", sel => "000", o => "0001100001010010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1110100001001001", sel => "110", o => "1110100001001001"),
        (previous => "0001100001010010", load => '1', i => "1100010001010110", sel => "000", o => "1100010001010110"),
        (previous => "1100000101100110", load => '0', i => "1111101100110100", sel => "010", o => "1100000101100110"),
        (previous => "1001111011100100", load => '0', i => "1100101111100111", sel => "101", o => "1001111011100100"),
        (previous => "1100010001010110", load => '1', i => "1001000000110010", sel => "000", o => "1001000000110010"),
        (previous => "1001111011100100", load => '1', i => "0001111001010001", sel => "101", o => "0001111001010001"),
        (previous => "1100000101100110", load => '0', i => "1010100101000110", sel => "010", o => "1100000101100110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000100101100011", sel => "001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1001000000110010", load => '0', i => "1010000011011111", sel => "000", o => "1001000000110010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0110001010010111", sel => "001", o => "0110001010010111"),
        (previous => "1110100001001001", load => '0', i => "1000110000101101", sel => "110", o => "1110100001001001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000001101000110", sel => "100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110001010010111", load => '1', i => "0001010101110000", sel => "001", o => "0001010101110000")
    );
    CONSTANT total_cycles : INTEGER := test_cases'LENGTH;
    FUNCTION slv_to_string (slv : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE str : STRING (slv'length DOWNTO 1) := (OTHERS => NUL);
    BEGIN
        FOR n IN slv'length DOWNTO 1 LOOP
            str(n) := STD_LOGIC'image(slv((n - 1)))(2);
        END LOOP;
        RETURN str;
    END FUNCTION;

BEGIN
    bench : my_ram8 PORT MAP(clk, load, i, sel, o_actual);

    PROCESS
    BEGIN
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
            i <= test_cases(n).i;
            load <= test_cases(n).load;
            sel <= test_cases(n).sel;

            WAIT FOR clk_period / 2;
            o_expected <= test_cases(n).o;
            WAIT FOR clk_period / 4;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "previous = " & slv_to_string(previous) &
                ". load = " & STD_LOGIC'image(load) &
                ". i = " & slv_to_string(i) &
                ". sel = " & slv_to_string(sel) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
            WAIT FOR clk_period / 4;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;