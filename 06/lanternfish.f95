program main
! comment
implicit none
integer::length=0,cnt=0,i=-1,n_day=0,n_fish=0
integer,dimension(1)::temp=0
character(len=900)::inputfield='3,5,7,9'
integer,dimension(100000000)::outputfield=0 ! 0 must be undefined. If value would be 0, it has to be ähm 8
character(len=1000)::str=''
!open(unit=2,file='06_input_test',status='old',position='rewind',action='read')
!i=1
!read(2,*)field ! liest genau 1 Zeile
!close(2)
!inputfield='3,4,3,1,2' ! put input here (this line: test input, results in 5934 after 80 days)
!inputfield='4,3,4,5,2,1,1,5,5,3,3,1,5,1,4,2,2,3,1,5,1,4,1,2,3,4,1,4,1,5,2,1,1,3,3,5,1,1,1,1,4,5,1,2,1,2,1,1,1,5,3,3,1,1,1,1,2,4,2,1,2,3,2,5,3,5,3,1,5,4,5,4,4,4,1,1,2,1,3,1,1,4,2,1,2,1,2,5,4,2,4,2,2,4,2,2,5,1,2,1,2,1,4,4,4,3,2,1,2,4,3,5,1,1,3,4,2,3,3,5,3,1,4,1,1,1,1,2,3,2,1,1,5,5,1,5,2,1,4,4,4,3,2,2,1,2,1,5,1,4,4,1,1,4,1,4,2,4,3,1,4,1,4,2,1,5,1,1,1,3,2,4,1,1,4,1,4,3,1,5,3,3,3,4,1,1,3,1,3,4,1,4,5,1,4,1,2,2,1,3,3,5,3,2,5,1,1,5,1,5,1,4,4,3,1,5,5,2,2,4,1,1,2,1,2,1,4,3,5,5,2,3,4,1,4,2,4,4,1,4,1,1,4,2,4,1,2,1,1,1,1,1,1,3,1,3,3,1,1,1,1,3,2,3,5,4,2,4,3,1,5,3,1,1,1,2,1,4,4,5,1,5,1,1,1,2,2,4,1,4,5,2,4,5,2,2,2,5,4,4' ! complete version
inputfield='4,3,4,5,2,1,1,5,5,3,3,1,5,1,4,2,2,3,1,5,1,4,1,2,3,4,1,4,1,5,2,1,1,3,3,5,1,1,1,1,4,5,1,2,1,2,1'
n_fish=5
print *, inputfield
length=len(inputfield)-1
write(*,*)'length: '
write(*,*)length
cnt=1
!read(str,*)num
do
    str=inputfield(2*cnt-1:2*cnt-1)
    write(*,*)str
    read(str,'(i100000.100000)')i
!    outputfield(cnt:cnt)=read(inputfield(cnt:cnt),*)outputfield(cnt:cnt)
    outputfield(cnt:cnt)=i
!    print *,i
!    print *,outputfield(cnt:cnt)
!    print *,'----'
    if(cnt>=length-1) exit
    cnt=cnt+1
end do
write(*,'(I2)')outputfield

cnt=n_fish ! digit
write(*,*)'Data read into outputfield. Now propagating'
do
    do
!        print *,'new do'    
!        print *,outputfield
!        print '(I1)',outputfield(cnt:cnt)
!        print *,outputfield(5:5)
        temp = outputfield(cnt:cnt)
        print *,'a'
        if(temp(1)==1) then
 !           write(*,*)'case temp 1'
            outputfield(cnt:cnt)=9
        else if(temp(1)==9) then
  !          write(*,*)'case temp 9'
            outputfield(cnt:cnt)=6
            outputfield(n_fish+1:n_fish+1)=8
            n_fish=n_fish+1
        else
!            write(*,*)'else-case'
            outputfield(cnt:cnt)=outputfield(cnt:cnt)-1
        end if
!        print '(I1)',outputfield(cnt:cnt)
        
!        if(cnt>=10) then
!            k=1
!            do
!                temp = outputfield(k:k)
!                if(temp(1)==10) outputfield(k:k)=8
!                k=k+1
!                if(k>=10) exit
!            end do
!            exit
!        end if
        cnt=cnt-1
        if (cnt<0) exit
    end do
!    print *,n_day
!    print *,outputfield
!    print *,'new cycle'
    n_day=n_day+1
    if(n_day>=80) exit !  Hier Abbruchbedingung: Nach wie vielen Tagen?
    cnt=n_fish
end do

print *,''
print *,''
print *,''
print *,''
print *,"ENDE: "
!write(*,'(I2)')outputfield
write(*,*)'n: '
write(*,*)n_fish
!allocate(field(10))
!deallocate(field)
end program

