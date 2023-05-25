LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or16_testbench IS
END my_or16_testbench;

ARCHITECTURE behavioral OF my_or16_testbench IS
    COMPONENT my_or16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, o : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_or16 PORT MAP(a, b, o);

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
        a <= "0110110010110001"; -- 0x6CB1
        b <= "1010010000101001"; -- 0xA429
        -- o = "1110110010111001" : 0xECB9
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0111111101100001"; -- 0x7F61
        b <= "0011010101011100"; -- 0x355C
        -- o = "0111111101111101" : 0x7F7D
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "0101110100110000"; -- 0x5D30
        b <= "1111001111111000"; -- 0xF3F8
        -- o = "1111111111111000" : 0xFFF8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0001110001100000"; -- 0x1C60
        b <= "1010100101010110"; -- 0xA956
        -- o = "1011110101110110" : 0xBD76
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0110001111011111"; -- 0x63DF
        b <= "0100101100000011"; -- 0x4B03
        -- o = "0110101111011111" : 0x6BDF
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1001011110100100"; -- 0x97A4
        b <= "1011010100100010"; -- 0xB522
        -- o = "1011011110100110" : 0xB7A6
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0010101100011101"; -- 0x2B1D
        b <= "1110011011001100"; -- 0xE6CC
        -- o = "1110111111011101" : 0xEFDD
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "1001011001101111"; -- 0x966F
        b <= "0100000101010011"; -- 0x4153
        -- o = "1101011101111111" : 0xD77F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1011001101100110"; -- 0xB366
        b <= "1101110100101010"; -- 0xDD2A
        -- o = "1111111101101110" : 0xFF6E
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1110100010000011"; -- 0xE883
        b <= "1000000001101001"; -- 0x8069
        -- o = "1110100011101011" : 0xE8EB
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;