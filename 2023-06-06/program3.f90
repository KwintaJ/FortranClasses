module operacje
    contains
        function samogloski(slowo, dlugosc)
            implicit none
            integer :: samogloski
            character(len = 100), intent(IN) :: slowo
            integer, intent(IN) :: dlugosc
            integer :: i

            samogloski = 0
            do i=1,dlugosc
                select case(slowo(i:i))
                    case("A")
                        samogloski = samogloski + 1
                    case("E")
                        samogloski = samogloski + 1
                    case("I")
                        samogloski = samogloski + 1
                    case("O")
                        samogloski = samogloski + 1
                    case("U")
                        samogloski = samogloski + 1
                    case("Y")
                        samogloski = samogloski + 1
                    case("a")
                        samogloski = samogloski + 1
                    case("e")
                        samogloski = samogloski + 1
                    case("i")
                        samogloski = samogloski + 1
                    case("o")
                        samogloski = samogloski + 1
                    case("u")
                        samogloski = samogloski + 1
                    case("y")
                        samogloski = samogloski + 1
                end select
            end do

            return
        end function samogloski
end module operacje

program prog3
    use operacje
    implicit none
    character(len = 100) :: slowo
    integer :: dlugosc, liczba_samoglosek

    open(unit=66,file="in3.txt",status="old",action="read",position="rewind")
    read(unit=66, fmt=*) slowo
    

    print *, "Wczytane slowo to '", trim(slowo), "'."
    print *,

    dlugosc = len(trim(slowo))
    print *, "Slowo ma dlugosc ", dlugosc, "znakow."
    
    liczba_samoglosek = samogloski(slowo, dlugosc)
    print *, "W slowie jest ", liczba_samoglosek, "samoglosek."
    
    stop
end program prog3

