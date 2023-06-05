program p33
    implicit none
    integer, parameter :: rdp=selected_real_kind(15)
    integer, parameter :: idp=selected_int_kind(15)

    real(kind=rdp) :: xx,yy,rr,pi_moje,delta
    real(kind=rdp) :: pi=3.14159265358979323846264338327950288_rdp
    real :: x
    integer(kind=idp) :: i,wewnatrz
    integer, parameter ::max_do=1000000_idp

    call init_random_seed()
    wewnatrz=0
    do i=1,max_do
        call random_number(xx)
        call random_number(yy)
        rr=xx*xx+yy*yy ! nie xx**2+yy**2
        if(rr<=1.0_rdp) wewnatrz=wewnatrz+1
    end do

    pi_moje=real(wewnatrz)/real(max_do)*4.0_rdp
    delta=abs((pi-pi_moje)/pi)
    print *
    print *,"pi moje = ",pi_moje,"blad wzgledny = ",delta
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

