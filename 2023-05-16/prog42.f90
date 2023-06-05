program prog42
! simple sort with subroutine swap
    implicit none
    real :: a, b, c

    write(unit = *, fmt = *) "please enter three numbers to be sorted"
    read(unit = *, fmt = *) a, b, c
    write(unit = *, fmt = *) "thank you. you have entered: ", a, b, c

    if(a > b) call swap(a, b)
    if(a > c) call swap(a, c)
    if(b > c) call swap(b, c)
    
    write(unit = *, fmt = *) "the numbers in increasing order are: ", a, b, c    
    stop

    contains
        subroutine swap(x, y)
            real, intent(IN OUT) :: x, y
            real :: aux

            ! zamiana za pomoca zmiennej tymczasowej: aux <- x; x <- y; y <- aux
            aux = x
            x = y
            y = aux
            
            return
        end subroutine swap
end program prog42

