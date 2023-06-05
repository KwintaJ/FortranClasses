module zawiera_procedure_Norm
    implicit none
    public :: Norm
    contains
        subroutine Norm(v, total, flag)
            real, dimension(:), intent(IN) :: v
            real, intent(OUT) :: total
            logical, intent(OUT) :: flag

            total = sqrt(sum(v * v))

      ! SQRT - funkcja wbudowana pierwiastek kwadratowy
      
      ! SUM - funkcja wbudowana suma elementow macierzy
      ! moze dotyczyc calej macierzy, rzedow, kolumn, lub 
      ! wybranych elementow za pomoca macierzy logicznej mask

      ! v * v - podniesienie kazdego elementu macierzy do
      ! kwadratu (iloczyn skalarny daje funkcja PRODUCT)

            flag = (total >= 1.0E5)
            return
        end subroutine Norm
end module zawiera_procedure_Norm

program prog38
    use zawiera_procedure_Norm
    implicit none
    real, dimension(6), parameter :: &
    v = (/10.0, 200.0, 3000.0, 40000.0, 500000.0, 6000000.0/)
    real :: total
    logical :: flag

    write(unit = *, fmt = "( 'wartosci macierzy v: ', 6(E10.3, 5X) )") v
    ! reprezentacja liczby REAL cecha = czesc calkowita
    ! dlugosci 0; mantysa=czesc ulamkowa 3 cyfrowa

    write(unit = *, fmt = "( 'wartosci macierzy v: ', 6(E10.1, 5X) )") v
    ! reprezentacja liczby REAL cecha = czesc calkowita
    ! dlugosci 0; mantysa=czesc ulamkowa 1 cyfrowa

    write(unit = *, fmt = "( 'wartosci macierzy v: ', 6(ES10.2, 5X) )") v
    ! reprezentacja liczby REAL cecha = czesc calkowita
    ! dlugosci w zakresie 0-10; mantysa=czesc ulamkowa 2 cyfrowa

    write(unit = *, fmt = "( 'wartosci macierzy v: ', 6(EN12.4, 5X) )") v
    ! reprezentacja liczby REAL mnoznik potegi postaci 10**0,
    ! 10**3, 10**6, 10**9, ...; mantysa=czesc ulamkowa 4 cyfrowa
    ! cala liczba zajmuje 12 pol

    call Norm(v, total, flag)
    write(unit = *, fmt = 77) total, flag
    ! wydruk flag wedlug formatu etykietowanego liczba 77
77  format("total, flag = ", EN10.3, 2X, L3)
    ! L3 - 3 pola na wydruk wartosci logicznej T lub F

    goto 99999 ! skok bezwarunkowy do linii z etykieta 99999
               ! (najwieksza mozliwa etykieta)
        print *, "tego wydruku nie zobaczysz"
    99999 continue

    if(flag .EQV. .TRUE.) goto 99998 ! skok do linii 99998
        print *, "tego wydruku tez nie zobaczysz"
    99998 continue

    stop
end program

