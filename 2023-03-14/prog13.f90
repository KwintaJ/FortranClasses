program p13
    implicit none
    
    integer,parameter :: st=8
    integer :: r,s
    logical,dimension(10,10) :: k1,k2 ! deklaracja macierzy 10x10 zawierajacej
                                      ! wartosci logiczne (bool)

    logical,dimension(11:20,11:20) :: m ! ta macierz tez jest 10x10, ale jej
                                        ! wartosci sa numerowane
                                        ! od 11 do 20 a nie od 1 do 10

    complex,dimension(1:10, 2+st) :: z,c ! macierz zespolona

    character(len=10),dimension(1:3) :: napisy ! trzywymiarowy wektor 
                                               ! dziesiecioznakowych napisow

    do r=1,10
        do s=1,10
            if(r==s) then
                k1(r,s)=.TRUE. ! wstaw wartosc prawdziwa na miejsce r,s
            else
                k1(r,s)=.FALSE.
            end if
        end do
    end do

    k2=k1
    m=k2

    print *,m
    print *

    do s=11,20
        print *,(m(s,r),r=11,20,1)
    end do

    stop
end program p13

