program prog45
! this program uses the Newton method to
! find a square root of f(x) = exp(x) * ln(x) - x*x = 0
    implicit none
    integer :: istep
    real :: a, b, dl, dx, x0, x1
    real :: fx, dfx !external functions

    write(*, *) "Program will calculate square root of f(x) = exp(x) * ln(x) - x*x = 0"
    write(*, *) "With starting range (A, B) and with accuracy D"
    write(*, *) "Please enter A, B and D"
    read(*, *) a, b, dl

    dx = b - a
    x0 = (a + b) / 2.0
    istep = 0

    do while(abs(dx) .GT. dl)
        x1 = x0 - fx(x0) / dfx(x0)
        dx = x1 - x0
        x0 = x1
        istep = istep + 1
    end do
    write(6,"(I4, 2F16.8)")istep, x0, dx

    stop
end program prog45

function fx(x) result(f)
    implicit none
    real :: f
    real, intent(IN) :: x
    f = exp(x) * alog(x) - x * x
end function fx

function dfx(x) result(df)
    implicit none
    real :: df
    real, intent(IN) :: x
    df = exp(x) * (alog(x) + 1.0 / x) - 2.0 * x
end function dfx

