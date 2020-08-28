.PHONY : help alu all
help:
	@echo "Usage: make [COMPONENT, alu]"

alu:
	ghdl -a --std=08 --ieee=synopsys ../sources/new/alu_32_Bit.vhd
	ghdl -a --std=08 --ieee=synopsys ../testbenches/new/alu_testbench.vhd
	ghdl -e --std=08 --ieee=synopsys alu_testbench
	@echo Running Tests...
	ghdl -r --std=08 --ieee=synopsys alu_testbench || rm *.o *.cf alu_testbench
	rm *.o *.cf alu_testbench

clean:
	rm *.o *.cf

all: alu
	@echo "Testing all..."
	


