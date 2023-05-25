LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or8way_testbench IS
END my_or8way_testbench;

ARCHITECTURE behavioral OF my_or8way_testbench IS
    COMPONENT my_or8way
        PORT (
            i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;

BEGIN
    bench : my_or8way PORT MAP(i, o_actual);

    PROCESS
    BEGIN
        i <= (OTHERS => '0');
        o_expected <= '0';
        WAIT FOR 10 ns;

        i <= (OTHERS => '1');
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        i <= "11000110"; -- 0xC6
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "00110110"; -- 0x36
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "01011101"; -- 0x5D
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "10101001"; -- 0xA9
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "11110101"; -- 0xF5
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "11000011"; -- 0xC3
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "00000010"; -- 0x02
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "10100100"; -- 0xA4
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "11010000"; -- 0xD0
        o_expected <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "01001000"; -- 0x48
        o_expected <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;