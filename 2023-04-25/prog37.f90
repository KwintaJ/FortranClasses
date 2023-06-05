module zawiera_funkcje_Large
    implicit none
    public :: Large
    contains
        function Large(list, k) result(large_R)
            ! funkcja zwraca wynik przez parametr formalny large_R
            integer, intent(IN), dimension(:) :: list
            integer, intent(IN) :: k
            integer :: large_R

            !start funkcji Large
            if(any(list <= k)) then
                large_R = maxval(list, mask = (list <= k))
            else
                large_R = k
            end if
            return
        end function Large
end module zawiera_funkcje_Large

program prog37
    use zawiera_funkcje_Large
    implicit none
    integer :: n, k
    integer, allocatable, dimension(:) :: list

    do ! petla nieskonczona
        print *, 'podaj rozmiar macierzy "list"'
                    ! tekst mozna zaznaczac pojedynczym '
        read(unit = *, fmt = *) n

        if(n <= 0) then
            exit
        end if
        
        allocate(list(n))
        print *, "podaj wartosci n-elementowej macierzy &
                  oddzielajac je spacjami lub w nowej lini"
        read(unit = *, fmt = *) list

        print *, "podaj liczbe 'k'"
        read(unit = *, fmt = *) k

        print *, "najwiekszy element macierzy ""list"" sposrodd &
                  mniejszych od liczby ""k"" to "
                    ! powtarzajac cudzyslow "" mozna go wydrukowac
                    ! zamiast zamykac tekst
        write(unit = *, fmt = *) Large(list, k)
    end do

    stop
end program

