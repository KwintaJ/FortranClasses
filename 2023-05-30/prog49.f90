! poszukiwanie liczb pierwszych - sito erastotenesa
program prog49
    implicit none
    integer, allocatable, dimension(:) :: matrix
    integer :: rozmiar, ptr, j

    print *, "Podaj gorna granice przeszukiwanego zakresu"
    read *, rozmiar
    print *, "Poszukiwanie liczb pierwszych w zakresie od 0 do ", rozmiar

    allocate(matrix(rozmiar))
    matrix = 1
    ptr = 2

    do
        if(ptr > rozmiar) exit

        if(matrix(ptr) == 1) then
            j = ptr
            do
                j = j + ptr
                if(j > rozmiar) exit
                matrix(j) = 0
            end do
        end if
        ptr = ptr + 1
    end do
    
    print *, "Liczby pierwsze:"
    do j = 2, rozmiar
        if(matrix(j) == 1) print *, j
    end do
    
    stop
end program prog49

