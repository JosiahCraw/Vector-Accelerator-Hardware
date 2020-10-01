.PHONY : help alu vec_alu ram all

help:
	@echo "Usage: make [COMPONENT: all, alu, vec_alu, reg, vec_reg, ram, register_table]"

alu:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/alu_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/alu_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys alu_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys alu_testbench
	rm *.o *.cf alu_testbench

vec_alu:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/alu_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../sources/new/vec_alu.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/vec_alu_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys vec_alu_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys vec_alu_testbench
	rm *.o *.cf vec_alu_testbench

reg:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/reg_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/reg_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys reg_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys reg_testbench
	rm *.o *.cf reg_testbench

vec_reg:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/reg_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../sources/new/vec_reg.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/vec_reg_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys vec_reg_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys vec_reg_testbench
	rm *.o *.cf vec_reg_testbench

register_table:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/reg_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../sources/new/vec_reg.vhd
	ghdl -a --std=08 --ieee=synopsys ../sources/new/register_table.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/register_table_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys register_table_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys register_table_testbench
	rm *.o *.cf register_table_testbench

ram:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/ram.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/ram_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys ram_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys ram_testbench
	rm *.o *.cf ram_testbench


clean:
	rm *.o *.cf vec_alu_testbench alu_testbench ram_testbench vec_reg_testbench reg_testbench || true

all: alu vec_alu ram reg vec_reg
	@echo "Testing Complete!!"


