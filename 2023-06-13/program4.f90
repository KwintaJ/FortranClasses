module funkcja
    contains
        real function f(x)
            implicit none
            real, intent(IN) :: x
            f = (x*x*x) - (3*x*x) - (4*x) + 12
        end function f
end module funkcja

program prog4
    use funkcja
    implicit none
    real :: x1, x2
    integer :: i
    
    x1 = -3.0
    x2 = -2.999
    do i = 1, 7000
        if(f(x1) .GE. 0 .AND. f(x2) .LE. 0) then
            write(*, '(A27,F0.3)') "Znaleziono miejsce zerowe: ", (x1 + x2) / 2
        else if(f(x1) .LE. 0 .AND. f(x2) .GE. 0) then
            write(*, '(A27,F0.3)') "Znaleziono miejsce zerowe: ", (x1 + x2) / 2
        end if

        x1 = x1 + 0.001
        x2 = x2 + 0.001
    end do

    stop
end program prog4

