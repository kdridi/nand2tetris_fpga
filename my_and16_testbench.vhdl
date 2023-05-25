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

        -- test avec motifs alternants
        a <= "1010101010101010"; -- 0xAAAA
        b <= "0101010101010101"; -- 0x5555
        -- o = "0000000000000000" : 0x0000
        WAIT FOR 10 ns;

        -- test avec séquence de 0 et de 1
        a <= "0000111100001111"; -- 0x0F0F
        b <= "1111000011110000"; -- 0xF0F0
        -- o = "0000000000000000" : 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "1100101011001010"; -- 0xCACA
        b <= "1011010100110101"; -- 0xB535
        -- o = "1000000000000000" : 0x8000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1111001010110101"; -- 0xF2B5
        b <= "1000110111100110"; -- 0x8DE6
        -- o = "1000000010100100" : 0x80A4
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;