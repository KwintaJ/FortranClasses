! funkcja jako argument

module Universal_Constants
    implicit none
    real, parameter :: pi = 3.1415926536
end module Universal_Constants

real function trig_fun_degrees(trig_fun, degrees, minutes, seconds)
    use Universal_Constants
    implicit none
    ! general trigonometry procedure for
    ! angles in degrees, minutes, seconds

    real, external :: trig_fun
    integer, intent(IN) :: degrees, minutes, seconds

    real :: angle

    ! conversion to radians
    angle = (degrees + minutes / 60.0 + seconds / 3600.0) * pi / 180.0

    trig_fun_degrees = trig_fun(angle)
end function trig_fun_degrees

program prog52
    implicit none
    real, intrinsic :: sin, cos, tan
    real, external :: trig_fun_degrees
    integer :: degs, mins, secs
    character :: answer

    do
        print *, "Please give an angle in degrees, minutes and seconds"
        print *, "without any fractional parts"
        print *, "Degrees: "
        read *, degs
        print *, "Minutes: "
        read *, mins
        print *, "Seconds: "
        read *, secs

        print *, "Its sine is: ", trig_fun_degrees(sin, degs, mins, secs)
        print *, "Its cosine is: ", trig_fun_degrees(cos, degs, mins, secs)
        print *, "Its tangent is: ", trig_fun_degrees(tan, degs, mins, secs)
    
        print *, "Another one? (Y/N)"
        read *, answer

        if(answer /= "Y" .AND. answer /= "y") exit
    end do

    stop
end program prog52

