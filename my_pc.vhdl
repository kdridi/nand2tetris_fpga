LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_pc IS
    PORT (
        clk : IN STD_LOGIC;
        load, inc, reset : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END my_pc;

ARCHITECTURE my_pc_architecture OF my_pc IS
    COMPONENT my_register
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_inc16
        PORT (
            a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            c : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL inc_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL inc_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL inc_carry : STD_LOGIC;

    SIGNAL inc_value : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL load_value : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reset_value : STD_LOGIC_VECTOR(15 DOWNTO 0);



BEGIN

    inc_gate : my_inc16 PORT MAP (inc_in, inc_out, inc_carry);
    inc_mux : my_mux16 PORT MAP (inc_in, inc_out, inc, inc_value);
    load_mux : my_mux16 PORT MAP (inc_value, i, load, load_value);
    zero_mux : my_mux16 PORT MAP (load_value, "0000000000000000", reset, reset_value);
    out_reg : my_register PORT MAP (clk, '1', reset_value, inc_in);
    o <= inc_in;

END my_pc_architecture;