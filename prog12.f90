program p12
    implicit none
    
    ! zmienne sparametryzowane - np typu integer, ktory pomiesci liczby z zakresu
    ! od -10^(15) do 10^(15)

    integer,parameter :: range = selected_int_kind(15)
    integer(kind=range) :: suma, n
    print *,"range = ",range
    suma = 0_range
    n = 0_range
    
    do
        n=n+1
        if(n>1234567890) exit
        if(n==55) cycle ! cycle to odpowienik continue
        if(n.EQ.122) cycle ! .EQ. to to samo co ==
        if(n>=20.AND.n<=30) cycle
        if(n.GE.20.AND.n.LE.30) cycle ! GE to odpowiednik >=
                                      ! LE to odpowiednik <=
        suma=suma+n
    end do

    print *,"suma =",suma
    stop
end program p12

