LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux16_testbench IS
END my_mux16_testbench;

ARCHITECTURE behavioral OF my_mux16_testbench IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_mux16 PORT MAP(a, b, sel, o_actual);

    PROCESS
    BEGIN

        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        sel <= '0';
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        sel <= '0';
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        sel <= '0';
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        sel <= '0';
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        sel <= '1';
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        sel <= '1';
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        sel <= '1';
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "0100100100100000"; -- 0x4920
        b <= "0100000000111110"; -- 0x403E
        sel <= '0';
        o_expected <= "0100100100100000"; -- 0x4920
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0101101101000100"; -- 0x5B44
        b <= "0011000100111001"; -- 0x3139
        sel <= '1';
        o_expected <= "0011000100111001"; -- 0x3139
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "0001010111110111"; -- 0x15F7
        b <= "1111110101010010"; -- 0xFD52
        sel <= '0';
        o_expected <= "0001010111110111"; -- 0x15F7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "1101001001010001"; -- 0xD251
        b <= "1100100101000101"; -- 0xC945
        sel <= '1';
        o_expected <= "1100100101000101"; -- 0xC945
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1001010010101001"; -- 0x94A9
        b <= "1111010100110010"; -- 0xF532
        sel <= '0';
        o_expected <= "1001010010101001"; -- 0x94A9
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1100010010011011"; -- 0xC49B
        b <= "1000000010010111"; -- 0x8097
        sel <= '1';
        o_expected <= "1000000010010111"; -- 0x8097
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1000010110111010"; -- 0x85BA
        b <= "1000101100001101"; -- 0x8B0D
        sel <= '0';
        o_expected <= "1000010110111010"; -- 0x85BA
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0111010110000001"; -- 0x7581
        b <= "0011100010000001"; -- 0x3881
        sel <= '1';
        o_expected <= "0011100010000001"; -- 0x3881
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0010101011110110"; -- 0x2AF6
        b <= "0011100111101000"; -- 0x39E8
        sel <= '0';
        o_expected <= "0010101011110110"; -- 0x2AF6
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1100111100100110"; -- 0xCF26
        b <= "1110111010101100"; -- 0xEEAC
        sel <= '1';
        o_expected <= "1110111010101100"; -- 0xEEAC
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;