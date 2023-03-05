program p4
    implicit none
    real :: a,b
    integer :: c

    open(unit=66,file="data_in",status="old",action="read",position="rewind")
    read(unit=66,fmt=*) a,b,c
    write(unit=*, fmt="(A8, F6.3, T40, A5, ES12.4, A6, I8)") &
    "a rowne", a, "b rowne", b, "c=", c

    stop    
end program p4