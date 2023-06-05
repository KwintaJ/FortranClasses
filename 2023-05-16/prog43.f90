module zawiera_funkcje_search
    implicit none
    contains
        function search(list, key) result(search_r)
            character(len = *), dimension(:), intent(IN) :: list
            character(len = *), intent(IN) :: key
            integer, dimension(2) :: search_r
            integer :: middle, last

            last = size(list)
            search_r(1) = 0
            search_r(2) = last + 1

            do while(search_r(2) - search_r(1) > 1)
                middle = (search_r(1) + search_r(2)) / 2
                if(list(middle) == key) then
                    search_r = middle
                    exit
                else if(list(middle) > key) then
                    search_r(2) = middle
                else
                    search_r(1) = middle
                end if
            end do
            
            return
        end function search
end module zawiera_funkcje_search

program prog43
    use zawiera_funkcje_search
    implicit none
    integer, parameter :: array_size = 20, name_length = 20
    character(len = name_length), dimension(0: array_size + 1) :: data_array
                ! macierz 22-elementowa, kazdy element to 20-znakowy tekst
    character(len = name_length) :: x
    integer :: loop, eof
    integer, dimension(2) :: ans

    open(unit = 1, file = "words.txt", status = "old", action = "read", position = "rewind")
    
    do loop = 1, array_size
        read(unit = 1, fmt = *, iostat = eof) data_array(loop)
        if(eof < 0) then
            exit
        end if
    end do

    data_array(0) = ""
    data_array(loop) = "ZZZZZZZZZZZZZZZZZZZ"

    write(*,*) "wprowadz tekst do odszukania"
    read(unit = *, fmt = *) x
    ans=search(data_array(: loop-1), x)

    write(unit = *, fmt = *)"found after element = ", data_array(ans(1)-1)
    write(unit = *, fmt = *)"found in element = ", data_array(ans(2)-1)

    stop
end program prog43

