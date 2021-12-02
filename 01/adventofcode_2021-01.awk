BEGIN { # init stuff
    num_increased=0
    num_decreased=0
    num_equal=0
    num_sum_increased=0
    num_sum_decreased=0
    num_sum_equal=0
} 

{ # write arrays for each line (=zeile), and put a 0 in each field to init the sumzeile-array (for the floating sum part B later on..)
    zeile[FNR]=$1
    sumzeile[FNR]=0
}

 
END {
    print "FNR: " FNR
    for (i=3;i<=FNR-1;i++){
        $2=zeile[i]-zeile[i-1]
        if ($2>0)
            num_increased++
        if ($2<0)
            num_decreased++
        if ($2==0)
            num_equal++
        
#        Floating sum part B
        for (j=0;j<3;j++){
            sumzeile[i]+=zeile[i-j]
        }
        if (sumzeile[i]-sumzeile[i-1]>0)
            num_sum_increased++
        if (sumzeile[i]-sumzeile[i-1]<0)
            num_sum_decreased++
        if (sumzeile[i]-sumzeile[i-1]==0)
            num_sum_equal++
        
        printf("value: %-5s / Δ(partA)= %-3s / Σ(partB)=%-8s\n",zeile[i],$2,sumzeile[i])
    }
    print "\nResults: "
    printf("Part A: increased=%-5s / decreased=%-5s / equal=%-5s / total: %-5s\n",num_increased-1,num_decreased,num_equal,num_increased+num_decreased+num_equal)
    printf("Part B: increased=%-5s / decreased=%-5s / equal=%-5s / total: %-5s\n",num_sum_increased,num_sum_decreased,num_sum_equal,num_sum_increased+num_sum_decreased+num_sum_equal)
} 

