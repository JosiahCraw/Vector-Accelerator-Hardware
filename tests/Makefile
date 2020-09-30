.PHONY : help alu vec_alu all

help:
	@echo "Usage: make [COMPONENT: alu, vec_alu]"

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

clean:
	rm *.o *.cf vec_alu_testbench alu_testbench || true

all: alu vec_alu
	@echo "Testing all..."


