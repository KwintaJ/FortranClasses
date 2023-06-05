module zawiera_funkcje_rekursywna
    implicit none
    public :: Euclid

    contains
        ! greatest common divider
        recursive function Euclid(i1, i2) result(gcd)
            integer, intent(IN) :: i1, i2
            integer :: gcd
            integer :: remainder
            remainder = mod(i1, i2) ! modulo - reszta z dzielenia calkowitego

            if(remainder == 0) then
                gcd = i2
                return
            else
                ! wywolanie rekurencyjne
                gcd = Euclid(i2, remainder)
            end if

            write(*, fmt=897) i1, i2, remainder, gcd
            897 format('reszta z dzielenia liczby ',I6,2X,' przez liczbe ' &
                       ,I4,2X,' jest rowna ',I4,2X,' gcd = 'I4)
            return
        end function Euclid
end module zawiera_funkcje_rekursywna

program prog46
    use zawiera_funkcje_rekursywna
    implicit none
    integer :: p, q, gcdPQ

    print *, 'wprowadz liczbe naturalna p'
    read(unit = *, fmt = *) p

    print *, 'wprowadz liczbe naturalna q'
    read(unit = *, fmt = *) q

    gcdPQ = Euclid(p, q)
    print *
    print *, 'najwiekszy wspolny dzielnik ',p,' i ',q,' to ',gcdPQ

    stop
end program prog46

