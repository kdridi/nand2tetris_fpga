LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux4way16_testbench IS
END my_dmux4way16_testbench;

ARCHITECTURE behavioral OF my_dmux4way16_testbench IS
    COMPONENT my_dmux4way16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            a, b, c, d : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected, c_expected, d_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_dmux4way16 PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual);

    PROCESS
    BEGIN

        -- test avec des motifs de bits plus complexes 01
        i <= "1001111100101010"; -- 0x9F2A
        sel <= "00";
        a_expected <= "1001111100101010"; -- 0x9F2A
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "1100010000010010"; -- 0xC412
        sel <= "01";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1100010000010010"; -- 0xC412
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "1011001010110010"; -- 0xB2B2
        sel <= "10";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "1011001010110010"; -- 0xB2B2
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "0110111011111100"; -- 0x6EFC
        sel <= "11";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0110111011111100"; -- 0x6EFC
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "1100011110010010"; -- 0xC792
        sel <= "00";
        a_expected <= "1100011110010010"; -- 0xC792
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "0111100011111100"; -- 0x78FC
        sel <= "01";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0111100011111100"; -- 0x78FC
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "1100000101010001"; -- 0xC151
        sel <= "10";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "1100000101010001"; -- 0xC151
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "0100101000010001"; -- 0x4A11
        sel <= "11";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0100101000010001"; -- 0x4A11
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "0101000001011100"; -- 0x505C
        sel <= "00";
        a_expected <= "0101000001011100"; -- 0x505C
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "0100111010011101"; -- 0x4E9D
        sel <= "01";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0100111010011101"; -- 0x4E9D
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        i <= "1100110001010010"; -- 0xCC52
        sel <= "10";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "1100110001010010"; -- 0xCC52
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        i <= "1101000101111011"; -- 0xD17B
        sel <= "11";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "1101000101111011"; -- 0xD17B
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        i <= "1010110000010000"; -- 0xAC10
        sel <= "00";
        a_expected <= "1010110000010000"; -- 0xAC10
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        i <= "1000010001100001"; -- 0x8461
        sel <= "01";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1000010001100001"; -- 0x8461
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        i <= "0001001000110110"; -- 0x1236
        sel <= "10";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0001001000110110"; -- 0x1236
        d_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        i <= "1111111000100011"; -- 0xFE23
        sel <= "11";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "1111111000100011"; -- 0xFE23
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;