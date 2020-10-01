library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller is
    generic (
        INSTRUCTION_WIDTH : integer := 24;
        VECTOR_WIDTH      : integer := 1024;
        MEM_ADDR_WIDTH    : integer := 8
        N_INT_REG         : integer := 16;
        N_VEC_REG         : integer := 16)
    Port ( 
        instr_ram_in   : in STD_LOGIC_VECTOR(INSTRUCTION_WIDTH-1 downto 0);
        instr_ram_wr   : out STD_LOGIC;
        instr_ram_addr : out STD_LOGIC_VECTOR
        vec_ram_in     : in STD_LOGIC_VECTOR(VECTOR_WIDTH-1 downto 0);
        vec_ram_out    : out STD_LOGIC_VECTOR(VECTOR_WIDTH-1 downto 0);
        vec_ram_addr   : out STD_LOGIC_VECTOR(MEM_ADDR_WIDTH-1 downto 0);
        vec_ram_wr     : out STD_LOGIC;
        reg_addr       : out STD_LOGIC_VECTOR(N_INT_REG+N_VEC_REG-1 downto 0);
        reg_d          : out STD_LOGIC_VECTOR(31 downto 0);
        reg_q          : in STD_LOGIC_VECTOR(31 downto 0);
        reg_wr         : out STD_LOGIC;
        vec_alu_opcode : out STD_LOGIC_VECTOR(7 downto 0);
        vec_alu_a      : out STD_LOGIC_VECTOR(VECTOR_WIDTH-1 downto 0);
        vec_alu_b      : out STD_LOGIC_VECTOR(VECTOR_WIDTH-1 downto 0);
        vec_alu_res    : in STD_LOGIC_VECTOR(VECTOR_WIDTH-1 downto 0);
        vec_alu_flags  : in STD_LOGIC_VECTOR(3 downto 0);
        int_alu_opcode : out STD_LOGIC_VECTOR(7 downto 0);
        int_alu_a      : out STD_LOGIC_VECTOR(31 downto 0);
        int_alu_b      : out STD_LOGIC_VECTOR(31 downto 0);
        int_alu_res    : in STD_LOGIC_VECTOR(31 downto 0);
        int_alu_flags  : in STD_LOGIC_VECTOR(3 downto 0);
        clk            : in STD_LOGIC;
        rst            : in STD_LOGIC);
end controller;

architecture Behavioral of controller is
begin

signal iv_reg : std_logic_vector(VECTOR_WIDTH-1 downto 0); -- Interim Vector Register
signal i_reg  : std_logic_vector(INSTRUCTION_WIDTH-1 downto 0); -- Instruction Register
signal prog_cnt : integer range 0 to (2**MEM_ADDR_WIDTH)-1;

type state_t is (FETCH, DECODE, EXECUTE);
signal state : state_t := FETCH;

type mem_instr_t is (VLD, VST, VLI, VSI, VMI, LDR, STR, LFV, STV, MOV);

type alu_instr_t is (VEC, INT);

type branch_instr_t is (VJMZ, VJNZ, JMP, JNZ, JMZ);

function do_branch(
            branch_instr : std_logic_vector(7 downto 0);
            alu_flags    : std_logic_vector(3 downto 0)
        )
    return std_logic is
    variable do_jump : std_logic := '0';
    begin
        if branch_instr = "11000000" and vec_alu_flags(0) = '1' then
            do_jump := '1'; -- VJMZ
        elsif branch_instr = "11000001" and vec_alu_flags(0) = '0' then
            do_jump := '1'; -- VJNZ
        elsif branch_instr = "11100000" then
            do_jump := '1'; -- JMP
        elsif branch_instr = "11100001" and int_alu_flags(0) = '0' then
            do_jump := '1'; -- JNZ
        elsif branch_instr = "11100010" and int_alu_flags(0) = '1' then
            do_jump := '1'; -- JMZ
        else
        do_jump := '0'; -- Do not branch
        end if;
        return do_jump;
end do_branch;


process (clk, rst)
begin
    instr_ram_addr <= to_unsigned(prog_cnt, instr_ram_addr'length);
    if rst = '1' then
        state <= FETCH;
        prog_cnt <= 0;
        instr_ram_wr <= '0';
        vec_ram_wr <= '0';
    elsif rising_edge(clk) then
        case (state) is
            when FETCH =>
                i_reg <= instr_ram_in;
                if i_reg = X"000000" then
                    prog_cnt <= prog_cnt + 1;
                    state <= FETCH;
                else
                    state <= DECODE;
                end if;
            when DECODE =>
                case i_reg(INSTRUCTION_WIDTH-1 downto INSTRUCTION_WIDTH-3) is
                    when "01" =>
                        
                    when "10" =>
                        
                    when "11" =>
                        if do_jump(i_reg(INSTRUCTION_WIDTH-1 downto INSTRUCTION_WIDTH-8)) then
                            pc <= i_reg(15 downto 8);
                        end if;
                        state <= FETCH;
                    when others =>
                        state <= FETCH;
            when EXECUTE =>
                state <= FETCH;
            when OTHERS =>
                state <= FETCH;
    end if;
end process;

end Behavioral;