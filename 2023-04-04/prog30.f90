program p30
    implicit none
    ! deklaracja roznych typow zmiennych wbudowanych, parametryzacja domyslna
    real :: a
    double precision :: b ; integer :: c
    logical :: d ; character :: e

    ! deklaracjha zmiennych rzeczywistych sparametryzowanych
    ! P = precision (number of meaning digits)
    ! R = range (minimum range of values)
    real(kind=selected_real_kind(P=6,R=30)) :: f
    real(kind=selected_real_kind(P=15,R=30)) :: g
    real(kind=selected_real_kind(P=15,R=1000)) :: h
    real(kind=selected_real_kind(P=18,R=1000)) :: i
    real(kind=selected_real_kind(P=18,R=2000)) :: j
    real(kind=selected_real_kind(P=18,R=4000)) :: k

    ! parametry knd moga byc rozne na roznych komputerach, ale gwarantuja 
    ! wymagana przez nas precyzje i zakres wartosci zmiennych
    print *,'type REAL              kind = ',kind(a)
    print *,'type DOUBLE PRECISION  kind = ',kind(b)
    print *,'type INTEGER           kind = ',kind(c)
    print *,'type LOGICAL           kind = ',kind(d)
    print *,'type CHARACTER         kind = ',kind(e)
    print *,'P = 6   R = 30         kind = ',kind(f)
    print *,'P = 15  R = 30         kind = ',kind(g)
    print *,'P = 15  R = 1000       kind = ',kind(h)
    print *,'P = 18  R = 1000       kind = ',kind(i)
    print *,'P = 18  R = 2000       kind = ',kind(j)
    print *,'P = 18  R = 4000       kind = ',kind(k)

    stop
end program p30

