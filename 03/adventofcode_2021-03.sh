#!/usr/bin/bash

name="adventofcode_2021-03_input_2.txt"
#number_of_bits=$(awk 'BEGIN {print length($0)}' name)
#number_of_bits=5 #$(awk 'BEGIN {print length($0)}' name)
sed -i "s/1/1,/g" adventofcode_2021-03_input_2.txt
sed -i "s/0/0,/g" adventofcode_2021-03_input_2.txt
#line_count=$(wc -l < "adventofcode_2021-03_test.txt")

awk '
BEGIN {FS=","
number_of_bits=12
gamma=0
epsilon=0
for (i=1;i<=number_of_bits;i++) {sum[i]=0;gamma_bin[i]=0}
}
{

    for (i=1;i<=number_of_bits;i++) {
        sum[i]+=$i
    }


}
END {
lines=1000
for (i=1;i<=number_of_bits;i++) { 
    printf("%i: %-5i\n",i,sum[i])
    if(sum[i]>=lines/2) {
        gamma_bin[i]=1
        epsilon_bin[i]=0
    }
    else {
        gamma_bin[i]=0
        epsilon_bin[i]=1
    }
gamma+=(gamma_bin[i])*2^(number_of_bits-i)
epsilon+=(epsilon_bin[i])*2^(number_of_bits-i)
}
printf("γ: %i,ε: %i,γε: %i",gamma,epsilon,gamma*epsilon)


}' ${name}

