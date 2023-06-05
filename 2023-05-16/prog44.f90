program prog44
! square root by Newton's method
    implicit none
    integer, parameter :: real12 = selected_real_kind(12)
    real(kind = real12) :: X
    real(kind = real12) :: root = 1.0
    real(kind = real12), parameter :: tolerance = 1.0E-10_real12

    write(*, *) "enter a number"
    read(*, *) X

    X = abs(X)

    do while(abs(root ** 2 / X - 1.0) > tolerance)
        write(*, *) root
        root = 0.5 * (root + X / root)
    end do
    write(*, *) "square root of ", X, " is: ", root  

    stop
end program prog44

