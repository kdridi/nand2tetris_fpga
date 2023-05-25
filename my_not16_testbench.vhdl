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
BEGIN
    bench : my_not16 PORT MAP(i, o_actual);

    PROCESS
    BEGIN
        i <= (OTHERS => '0');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        i <= (OTHERS => '1');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        i <= "1011010111010011"; -- 0xB5D3
        o_expected <= "0100101000101100"; -- 0x4A2C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "0000111011010010"; -- 0x0ED2
        o_expected <= "1111000100101101"; -- 0xF12D
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "1001111110010101"; -- 0x9F95
        o_expected <= "0110000001101010"; -- 0x606A
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "1111100100111110"; -- 0xF93E
        o_expected <= "0000011011000001"; -- 0x06C1
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "1111100100011100"; -- 0xF91C
        o_expected <= "0000011011100011"; -- 0x06E3
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "0101001011000011"; -- 0x52C3
        o_expected <= "1010110100111100"; -- 0xAD3C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "0101010011001111"; -- 0x54CF
        o_expected <= "1010101100110000"; -- 0xAB30
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "0111111100000100"; -- 0x7F04
        o_expected <= "1000000011111011"; -- 0x80FB
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "1010100110000101"; -- 0xA985
        o_expected <= "0101011001111010"; -- 0x567A
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "1000001111110000"; -- 0x83F0
        o_expected <= "0111110000001111"; -- 0x7C0F
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;