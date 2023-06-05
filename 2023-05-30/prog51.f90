! definnicja wlasnego operatora dodawania wektorow,
! przeladowanie operatora +

module wektor
    implicit none
    type vector
        double precision :: x, y, z
    end type vector

    type(vector), parameter :: i_ = vector(1.0, 0.0, 0.0)
    type(vector), parameter :: j_ = vector(0.0, 1.0, 0.0)
    type(vector), parameter :: k_ = vector(0.0, 0.0, 1.0)

    interface operator(+)
        module procedure suma
    end interface

    interface operator(.dodaj.)
        module procedure suma
    end interface

    contains
        type(vector) function suma(v1, v2)
            implicit none
            type(vector), intent(IN) :: v1, v2
            suma%x = v1%x + v2%x
            suma%y = v1%y + v2%y
            suma%z = v1%z + v2%z
            return
        end function suma

        subroutine results(head, v)
            implicit none
            character*(*), intent(IN) :: head
            type(vector), intent(IN) :: v
            write(6, '(1X,A15,3F8.3)') head, v%x, v%y, v%z
        end subroutine results
end module wektor

program prog51
    use wektor
    implicit none
    
    type(vector) :: v1 = vector(1.0, 2.0, 3.0)
    type(vector) :: v2 = vector(1.0, 4.0, 9.0)
    type(vector) :: v3 = vector(-1.0, -1.0, -1.0)

    call results('V1 = ', v1)
    call results('V2 = ', v2)
    call results('V3 = ', v3)

    v3 = suma(v1, v2)
    call results('V1 + V2 = ', v3)
    v3 = v1.dodaj.i_
    call results('V1 + [1,0,0] = ', v3)
    v3 = v1 + j_
    call results('V1 + [0,1,0] = ', v3)

    stop
end program prog51

