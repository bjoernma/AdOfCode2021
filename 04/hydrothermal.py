filename="04_input_test"
with open(filename,"r") as file:
    line = file.readlines()

xa=[]
ya=[]
xb=[]
yb=[]
field = []

xa = [int(line[cnt].split()[0].split(",")[0]) for cnt in range(0,len(line))]
xb = [int(line[cnt].split()[2].split(",")[0]) for cnt in range(0,len(line))]
ya = [int(line[cnt].split()[0].split(",")[1]) for cnt in range(0,len(line))]
yb = [int(line[cnt].split()[2].split(",")[1]) for cnt in range(0,len(line))]

max_field = max(max(xa),max(xb),max(ya),max(yb))+1
field = [[0 for i in range(0,max_field)] for j in range(0,max_field)]
for cnt in range(0,len(line)):
    if xa[cnt] == xb[cnt]: # horizontal
        if ya[cnt]>yb[cnt]: # range only works forward. swap if necessary
            temp=ya[cnt]
            ya[cnt]=yb[cnt]
            yb[cnt]=temp
            print("swapped. new: ya<yb. ya=",ya[cnt]," yb=",yb[cnt])
        for y_ind in range(ya[cnt],yb[cnt]+1):
            field[xa[cnt]][y_ind]+=1
        print("use",cnt,": ",xa[cnt]," ",ya[cnt]," ",xb[cnt]," ",yb[cnt])
    elif ya[cnt] == yb[cnt]: # vertical
        if xa[cnt]>xb[cnt]:
            temp=xa[cnt]
            xa[cnt]=xb[cnt]
            xb[cnt]=temp
            print("swapped. new: xa<xb. xa=",xa[cnt]," xb=",xb[cnt])
        for x_ind in range(xa[cnt],xb[cnt]+1):
            field[x_ind][ya[cnt]]+=1
        print("use",cnt,": ",xa[cnt]," ",ya[cnt]," ",xb[cnt]," ",yb[cnt])
#    for i in range(0,len(line)):
#        print(field[i])
#    print("---------")

fieldcnt=0
for xcnt in range(0,len(field)):
    for ycnt in range(0,len(field)):
        if field[xcnt][ycnt] > 1:
            fieldcnt+=1


print(fieldcnt)
#for i in range(0,len(line)):
#    print(field[i]) # better for plotting small chunks under each other.

