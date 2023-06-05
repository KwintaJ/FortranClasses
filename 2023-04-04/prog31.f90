program p31
    implicit none
    integer, parameter :: rdp=selected_real_kind(15)
        ! domyslnie pierwszy argument funkcji SELECTED_REAL_KIND to P

    real(kind=rdp) :: x,xx
    integer :: i

    do i=1,5
        ! generacja liczb pseudolosowych z zakresu (0,1)
        call random_number(x) 
        call random_number(xx)
        print *,x,xx
    end do

    call init_random_seed() ! ziarno generatora sprzezone z zegarem komputera
    do i=1,5
        ! generacja liczb pseudolosowych z zakresu (0,1)
        call random_number(x) 
        call random_number(xx)
        print *,x,xx
    end do

    contains ! otwarcie bloku, w ktorym definiujemy funkcje i procedury wewnetrzne
        subroutine init_random_seed()
            integer :: i,n,clock
            integer, dimension(:), allocatable :: seed ! deklaracja macierzy, ktorej rozmiar 
                                                    ! jest nieokreslony - bedzie on podany
                                                    ! przez deklaracje ALLOCATE(seed(n))

            call random_seed(size=n)
            print *,'size = ',n
            allocate(seed(n))

            call random_seed(get=seed)
            print *,'seed = ',seed

            call system_clock(count=clock)
            print *,'clock = ',clock

            seed = clock + 37 * (/(i-1,i=1,n)/) ! inicjalizacja poczatkowa na podstawie odczytu zegara
            call random_seed(put = seed) ! przekazanie wartosci z wektora
            print *,'seed = ',seed

            deallocate(seed) ! zwolnienie pamieci zarezerwowanej dla wektora seed
        end subroutine

end program p31

