#!/usr/bin/python3

input_file=open("adventofcode_2021-02_input.txt","r")

posh=0
depth=0

for line in input_file:
    actual_line=line.split(" ")
    if actual_line[0]=="forward":
        posh+=int(actual_line[1])
    if actual_line[0]=="backward":
        posh-=int(actual_line[1])
    if actual_line[0]=="down":
        depth+=int(actual_line[1])
    if actual_line[0]=="up":
        depth-=int(actual_line[1])
input_file.close()

print("posh: ",posh)
print("depth: ",depth)

print("Product: posh*depth = ",posh*depth)


