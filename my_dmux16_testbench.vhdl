LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux16_testbench IS
END my_dmux16_testbench;

ARCHITECTURE behavioral OF my_dmux16_testbench IS
    COMPONENT my_dmux16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL a_actual, b_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_dmux16 PORT MAP(i, sel, a_actual, b_actual);

    PROCESS
    BEGIN

        i <= (OTHERS => '0');
        sel <= '0';
        a_expected <= (OTHERS => '0');
        b_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        i <= (OTHERS => '0');
        sel <= '1';
        a_expected <= (OTHERS => '0');
        b_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        i <= (OTHERS => '1');
        sel <= '0';
        a_expected <= (OTHERS => '1');
        b_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        i <= (OTHERS => '1');
        sel <= '1';
        a_expected <= (OTHERS => '0');
        b_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        i <= "0110110011011001"; -- 0x6CD9
        sel <= '0';
        a_expected <= "0110110011011001"; -- 0x6CD9
        b_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "1100010001011110"; -- 0xC45E
        sel <= '1';
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1100010001011110"; -- 0xC45E
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "0010111110100010"; -- 0x2FA2
        sel <= '0';
        a_expected <= "0010111110100010"; -- 0x2FA2
        b_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "0010001010110101"; -- 0x22B5
        sel <= '1';
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0010001010110101"; -- 0x22B5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "0000001001010100"; -- 0x0254
        sel <= '0';
        a_expected <= "0000001001010100"; -- 0x0254
        b_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "1011110011111100"; -- 0xBCFC
        sel <= '1';
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1011110011111100"; -- 0xBCFC
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "0110010010001000"; -- 0x6488
        sel <= '0';
        a_expected <= "0110010010001000"; -- 0x6488
        b_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "1111011111011110"; -- 0xF7DE
        sel <= '1';
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1111011111011110"; -- 0xF7DE
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "0110111101001100"; -- 0x6F4C
        sel <= '0';
        a_expected <= "0110111101001100"; -- 0x6F4C
        b_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "1101000000110000"; -- 0xD030
        sel <= '1';
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "1101000000110000"; -- 0xD030
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;