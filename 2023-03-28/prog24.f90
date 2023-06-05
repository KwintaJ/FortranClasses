program p24
    implicit none
    integer :: i,j
    real :: mala,duza,cala,mnoze1,mnoze2
    integer, parameter :: miesiac=12,rok=5
    integer, dimension(miesiac, rok) :: forsa

    ! macierz "forsa" otrzymuje wartosci:
    !   funkcja real(i) zmienia typ integer zmiennej i na real
    !   funkcja sin() oblicza sinus
    !   funkcja abs() zwraca wartosc bezwzgledna 
    !   funkcja int() zamienia argument na liczbe calkowita
    !   ** to potegowanie
    do i=1,miesiac
        do j=1,rok
            forsa(i,j)=int(abs(sin(real(i)))*j)*(-1)**i
        end do
    end do

    print *,forsa

    !sekektywna edycja macierzy
    where(forsa.LE.0) forsa=-forsa
    where(forsa.EQ.0) forsa=1

    mala=sum(forsa,forsa.LT.3)
    duza=sum(forsa,forsa.GE.3)
    cala=sum(forsa)

    print *,"mala = ",mala,"duza = ",duza,"cala = ",cala

    print *,forsa

    mnoze1=product(forsa)
    mnoze2=product(forsa,mask=forsa.GE.3)

    print *
    print *,"mnoze1 = ",mnoze1,"mnoze2 = ",mnoze2

    ! rownowazny zapis operatorow logicznych
    !   .LT. (Less Then)             <
    !   .LE. (Less or Equal)         <=
    !   .EQ. (Equal)                 ==
    !   .NE. (Not Equal)             /=
    !   .GE. (Greater or Equal)      >=
    !   .GT. (Greater Then)          >
    
    stop
end program p24
