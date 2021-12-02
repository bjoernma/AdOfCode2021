BEGIN {
    num_increased=0
    num_decreased=0
    num_equal=0
} 

{
    zeile[FNR]=$1
}

 
END {
    print "FNR: " FNR
    for (i=1;i<=NR;i++){
        $2=zeile[i]-zeile[i-1]
        print "Δ="$2
        if ($2>0)
            num_increased++
        if ($2<0)
            num_decreased++
        if ($2=0)
            num_equal++
    }
    print "increased: " num_increased-1
    print "decreased: " num_decreased
    print "equal: " num_equal
    print "all: " num_increased+num_decreased+num_equal
} 

