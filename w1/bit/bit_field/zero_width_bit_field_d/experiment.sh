#!/bin/bash
#===============================================================================
#
#          FILE:  experiment.sh
#
#         USAGE:  ./experiment.sh
#
#   DESCRIPTION:  run the zero width bit field experiment
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Stanley Yuan (), None
#       COMPANY:  None
#       VERSION:  1.0
#       CREATED:  2019-03-15 11:49:25 AM CST
#      REVISION:  ---
#===============================================================================

echo -n "Compliing..."
gcc -Wall -g -O0 ./zero_width_bit_field.c -o ./zero_width_bit_field_O_0
gcc -Wall -g -O1 ./zero_width_bit_field.c -o ./zero_width_bit_field_O_1
gcc -Wall -g -O2 ./zero_width_bit_field.c -o ./zero_width_bit_field_O_2
echo "finish!"

files=('./zero_width_bit_field_O_0' './zero_width_bit_field_O_1' './zero_width_bit_field_O_2')

for i in "${files[@]}"; do
	echo -n "disassembling $i... "
	objdump  -d -M intel $i > $i".asm"
	echo "finish!"

	rm $i"_output.txt"
	echo -n "run $i... "
	for j in {1..5}; do
		$i >> $i"_output.txt"
	done
	echo "done"
done
