module rownanie_kwadratowe
    contains
        subroutine pierwiastki(liczba, a, b, c, x1, x2)
            implicit none
            real, intent(IN) :: a, b, c
            real, intent(OUT) :: x1, x2
            integer, intent(OUT) :: liczba
            real :: Delta

            Delta = (b * b) - (4 * a * c)
            if(Delta .LT. 0) then
                liczba = 0
            else if(Delta .EQ. 0) then
                liczba = 1
                x1 = (0 - b) / 2 / a
            else
                Delta = sqrt(Delta)
                liczba = 2
                x1 = (0 - b - Delta) / (2 * a)
                x2 = (0 - b + Delta) / (2 * a)
            end if
        end subroutine pierwiastki
end module rownanie_kwadratowe

program prog2
    use rownanie_kwadratowe
    implicit none
    real :: a, b, c, x1, x2
    integer :: liczba_pierwiastkow

    print *, "Podaj wspolczynniki a, b, c rownania kwadratowego ax^2 + bx + c = 0"
    read(*, *) a, b, c
    print *, 

    call pierwiastki(liczba_pierwiastkow, a, b, c, x1, x2)

    if(liczba_pierwiastkow .EQ. 0) then
        print *, "Podane rownanie nie ma pierwiastkow"
    else if(liczba_pierwiastkow .EQ. 1) then
        print *, "Podane rownanie ma jeden pierwiastek: ", x1
    else
        print *, "Podane rownanie ma pierwiastki: ", x1, ", ", x2
    end if

    stop
end program prog2

