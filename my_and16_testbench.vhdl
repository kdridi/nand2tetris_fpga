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

    SIGNAL a, b, o : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_and16 PORT MAP(a, b, o);

    PROCESS
    BEGIN
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "1000101110000010"; -- 0x8B82
        b <= "1011100101101110"; -- 0xB96E
        -- o = "1000100100000010" : 0x8902
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1101110000010000"; -- 0xDC10
        b <= "0011010010101001"; -- 0x34A9
        -- o = "0001010000000000" : 0x1400
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1101111001011011"; -- 0xDE5B
        b <= "0101110100000110"; -- 0x5D06
        -- o = "0101110000000010" : 0x5C02
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "1110101001000101"; -- 0xEA45
        b <= "0110100000010001"; -- 0x6811
        -- o = "0110100000000001" : 0x6801
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0101110111110010"; -- 0x5DF2
        b <= "1110101110000111"; -- 0xEB87
        -- o = "0100100110000010" : 0x4982
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1100000000111110"; -- 0xC03E
        b <= "1111011111000110"; -- 0xF7C6
        -- o = "1100000000000110" : 0xC006
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1100010110000000"; -- 0xC580
        b <= "0110001000101011"; -- 0x622B
        -- o = "0100000000000000" : 0x4000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "1001111011101001"; -- 0x9EE9
        b <= "1001000101011010"; -- 0x915A
        -- o = "1001000001001000" : 0x9048
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0110001011101100"; -- 0x62EC
        b <= "1011111001100111"; -- 0xBE67
        -- o = "0010001001100100" : 0x2264
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1010011000011100"; -- 0xA61C
        b <= "0010011010011000"; -- 0x2698
        -- o = "0010011000011000" : 0x2618
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;