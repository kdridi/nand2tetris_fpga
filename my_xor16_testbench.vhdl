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
BEGIN
    bench : my_xor16 PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "0100100101001110"; -- 0x494E
        b <= "1011100110111011"; -- 0xB9BB
        o_expected <= "1111000011110101"; -- 0xF0F5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1110110000101001"; -- 0xEC29
        b <= "0101011001010000"; -- 0x5650
        o_expected <= "1011101001111001"; -- 0xBA79
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1100101000110100"; -- 0xCA34
        b <= "1010000001010110"; -- 0xA056
        o_expected <= "0110101001100010"; -- 0x6A62
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0100101100101001"; -- 0x4B29
        b <= "0100100011010001"; -- 0x48D1
        o_expected <= "0000001111111000"; -- 0x03F8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1111101100100110"; -- 0xFB26
        b <= "0000100100101010"; -- 0x092A
        o_expected <= "1111001000001100"; -- 0xF20C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0011111011110111"; -- 0x3EF7
        b <= "0100011000000000"; -- 0x4600
        o_expected <= "0111100011110111"; -- 0x78F7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1110100011110110"; -- 0xE8F6
        b <= "1011110011110000"; -- 0xBCF0
        o_expected <= "0101010000000110"; -- 0x5406
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0001000111110000"; -- 0x11F0
        b <= "1101000010100010"; -- 0xD0A2
        o_expected <= "1100000101010010"; -- 0xC152
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1111111000110101"; -- 0xFE35
        b <= "0101001010111110"; -- 0x52BE
        o_expected <= "1010110010001011"; -- 0xAC8B
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "0100011110001110"; -- 0x478E
        b <= "1101111110111001"; -- 0xDFB9
        o_expected <= "1001100000110111"; -- 0x9837
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;