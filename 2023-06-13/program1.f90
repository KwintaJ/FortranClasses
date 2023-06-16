program prog1
    implicit none
    real, parameter :: kwota_poczatkowa = 1000.00
    integer, parameter :: czas_lokaty = 30
    real, parameter :: oprocentowanie = 0.02
    integer :: rok
    real :: saldo

    saldo = kwota_poczatkowa
    do rok = 1, czas_lokaty
        saldo = saldo + (saldo * oprocentowanie)
    end do

    write(*, '(a, F0.2, a)') "Kwota koncowa lokaty bedzie wynosila ", saldo, " PLN."

    stop
end program prog1

