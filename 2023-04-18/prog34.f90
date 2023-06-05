program p34
    implicit none
    real :: a,b,c

    interface
        function mean(x,y)
            implicit none
            real, intent(in) :: x,y
            real :: mean
          ! mean = (x+y)/2         w interfejsie nie ma instrukcji wykonywalnych
          ! return
        end function
    end interface

    a=30 ; b=60 ; c=mean(a,b)
    write(*,*) "mean = ",c

    stop
end program

! funcja zewnetrzna moze zawierac instrukcje
! program wywolujacy funkcje zewnetrzna musi zawierac odpowiedni interfejs
function mean(x,y)
    implicit none
    real, intent(in) :: x,y
    real :: mean
    mean = (x+y)/2
    return
end function

