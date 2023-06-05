module parametry_opcjonalne
    implicit none
    public :: Options
    
    contains
        subroutine Options(str1, str2)
            character(len = *), intent(IN), optional :: str1, str2
            integer :: l1, l2

            write(unit = *, fmt = *) "============================&
            ======================================================="

            if(present(str1)) then
                l1 = len(str1)
                write(unit = *, fmt = *) "1: ", str1  
            else
                l1 = -1
            end if

            if(present(str2)) then
                l2 = len(str2)
                write(unit = *, fmt = *) "2: ", str2  
            else
                l2 = -1
            end if

            
            write(unit = *, fmt = *) "Lengths: ", l1, ", ",l2  

            return
        end subroutine Options
end module parametry_opcjonalne

program prog48
    use parametry_opcjonalne
    implicit none

    call Options()
    call Options("pierwszy", "drugi")
    call Options("tylko_jeden") ! domyslnie str1="tylko_jeden"
    call Options(str1 = "111111") ! mozna wskazac explicite
    call Options(str2 = "222222") 
    call Options(str2 = "pierwszy", str1 = "drugi") ! lub zamienic kolejnosc

    stop
end program prog48

