program prog1
    implicit none
    integer, dimension(1:15) :: liczby
    integer :: i

    open(unit=66,file="in1.txt",status="old",action="read",position="rewind")

    do i=1,15
        read(unit=66,fmt=*) liczby(i)
    end do

    print *, "Wczytano liczby z pliku in1.txt"
    print *, 
    print *,"Suma wszystkich liczb parzystych w pliku wynosi    ", sum(liczby,mod(liczby, 2).EQ.0)
    print *,"Suma wszystkich liczb nieparzystych w pliku wynosi ", sum(liczby,mod(liczby, 2).EQ.1)

    stop
end program prog1

