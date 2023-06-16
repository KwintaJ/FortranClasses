! program liczacy calke sin(x) od 0 do pi metoda Monte Carlo

program p3
    implicit none
    integer, parameter :: rdp = selected_real_kind(15)
    integer, parameter :: idp = selected_int_kind(15)

    real(kind=rdp) :: xx, yy, calka
    real(kind=rdp), parameter :: pi = 3.14159265358979323846264338327950288_rdp
    integer(kind=idp) :: i, pod_funkcja
    integer, parameter ::max_do = 1000000_idp

    call init_random_seed()
    pod_funkcja = 0
    do i=1,max_do
        call random_number(xx)
        call random_number(yy)
        xx = xx * pi
        if(sin(xx) .GT. yy) pod_funkcja = pod_funkcja + 1
    end do

    calka=(real(pod_funkcja)/real(max_do))*pi
    write(*, '(A49,F0.8)') "Wyliczona wartosc calki sin(x) od 0 do pi wynosi ", calka
    stop

    contains
        subroutine init_random_seed()
            integer :: i,n,clock
            integer, dimension(:), allocatable :: seed

            call random_seed(size=n)
            print *,"size = ",n ! rozmiar wektora seed moze byc mniejszy
                                ! niz liczba generowanych liczb losowych 
                                ! w jednym wywołaniu

            allocate(seed(n))
            call system_clock(count=clock)
            print *,"clock = ",clock
            
            seed = clock + 37 * (/(i-1,i=1,n)/)
            call random_seed(put=seed)
            print *,"seed = ",seed

            deallocate(seed)
        end subroutine
end program

