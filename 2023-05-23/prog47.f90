module J11M
    implicit none
    public :: Calc

    contains
        subroutine Calc(Z, Answer)
            real, intent(IN), dimension(:) :: Z
            real, intent(OUT) :: Answer

            Answer = sum(Z ** 2)
            return
        end subroutine Calc
end module J11M

program prog47
    use J11M
    implicit none

    character(len=79) :: Buffer
    real, dimension(13) :: Z
    real :: Answer
    integer :: N, EoF

    open(unit = 1, file = "prog47.txt", status = "old", &
         action = "read", position = "rewind")

    N = 0
    do
        N = N + 1
        read(unit = 1, fmt = "(a79)", iostat = EoF) Buffer

        if(EoF /= 0) then
            exit
        
        else if(Buffer(1:1) == "C") then
            write(unit = *, fmt = *) Buffer(2:) ! external output
        
        else if(Buffer(1:1) == " ") then
            ! internal data transfer
            read(unit = Buffer, fmt = "(TR1,13 F6.3)") Z
            
            call Calc(Z, Answer)
            write(unit = *, fmt = *) Answer
        else
            write(unit = *, fmt = *) 'Column 1 is not blank or C at record ',N
        end if
    end do

    stop
end program prog47

