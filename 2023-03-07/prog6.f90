program p6
    implicit none

    character(len=10) :: date
    character(len=2) :: month

    write(unit=*,fmt=*) "napisz date w formacie YYYY-MM-DD"
    read(unit=*,fmt=*) date

    month=date(6:7)
    write(unit=*,fmt="(A10)") month
    
    select case(month)
    case("03":"05")
        write(unit=*,fmt=*) "wiosna"
    case("06","07","08")
        write(unit=*,fmt=*) "lato"
    case default
        write(unit=*,fmt=*) "ani wiosna, ani lato"
    end select
    stop
end program p6