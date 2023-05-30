LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_bit16_testbench IS
END my_bit16_testbench;

ARCHITECTURE behavioral OF my_bit16_testbench IS
    COMPONENT my_bit16
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL load : STD_LOGIC;
    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 ns;

    TYPE test_case IS RECORD
        load : STD_LOGIC;
        i : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- i, load o
        (load => '0', i => "1000001100101001", o => "UUUUUUUUUUUUUUUU"),
        (load => '0', i => "0100011011000011", o => "UUUUUUUUUUUUUUUU"),
        (load => '0', i => "1110001110011100", o => "UUUUUUUUUUUUUUUU"),
        (load => '0', i => "1100111001011011", o => "UUUUUUUUUUUUUUUU"),
        (load => '1', i => "1001101100001111", o => "1001101100001111"),
        (load => '1', i => "1101111011101100", o => "1101111011101100"),
        (load => '0', i => "0111100101111011", o => "1101111011101100"),
        (load => '1', i => "0111110000001011", o => "0111110000001011"),
        (load => '0', i => "1011010011110010", o => "0111110000001011"),
        (load => '0', i => "0110001010101111", o => "0111110000001011"),
        (load => '1', i => "0001101010101100", o => "0001101010101100"),
        (load => '0', i => "0100000111011011", o => "0001101010101100"),
        (load => '0', i => "0010010000010001", o => "0001101010101100"),
        (load => '0', i => "1001110011110010", o => "0001101010101100"),
        (load => '1', i => "0111011010010001", o => "0111011010010001"),
        (load => '1', i => "0011001100011111", o => "0011001100011111")
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
    bench : my_bit16 PORT MAP(clk, load, i, o_actual);

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
            load <= test_cases(n).load;

            WAIT FOR 3 * clk_period / 4;

            o_expected <= test_cases(n).o;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "load = " & STD_LOGIC'image(load) &
                ". i = " & slv_to_string(i) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;

            WAIT FOR 1 * clk_period / 4;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;