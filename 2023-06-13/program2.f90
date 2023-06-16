module rekurencja
    contains
        recursive function suma_rekurencyjnie(n1, n2) result(s)
            implicit none
            integer(kind=8) :: s
            integer(kind=4), intent(IN) :: n1, n2
            integer :: suma_2

            if(n1 .EQ. n2) then
                s = n1 + n1
            else if(n1 .EQ. n2 - 1) then
                s = n1 + n2
            else
                s = suma_rekurencyjnie(n1, n2 - 1) + n2

            end if
        end function suma_rekurencyjnie
end module rekurencja

program prog2
    use rekurencja
    implicit none
    integer(kind=8) :: suma
    integer(kind=4) :: n1, n2, temp

    print *, "Podaj dwie liczby naturalne:"
    read(*, *) n1, n2

    if(n1 .GT. n2) then
        temp = n1
        n1 = n2
        n2 = temp
    end if
    suma = suma_rekurencyjnie(n1, n2)
    write(unit = *, fmt = '(A26,I0,A4,I0,A12,I0)') "Suma liczb naturalnych od ", n1, " do ", n2, " jest rowna ", suma
    
    stop
end program prog2

