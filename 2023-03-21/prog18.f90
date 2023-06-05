program p18
    implicit none
    integer :: a,b
    real :: c,d

    print *,"TYPE 123456789" ! wpisz na klawiaturze 123456789 i nacisnij ENTER
    read 101,a,b,c,d ! zmienne zostana wczytane wg formatu 101
    print 200,a,b,a-b,c,d,c-d ! zmienne zostana wypisane wg formatu 200

    !definicje formatow
    101 format(T6,I4,TL6,I4,TL6,F4.1,TL6,F4.2)
    200 format(5X,I4," minus",I5," is",I5,TR4,F6.2," minus",F6.2," is",F8.3)

      ! T6 - czytaj od znaku, ktory jest na 6 pozycji wzgledem poczatku linii
      ! TL6 - czytaj od znaku, ktory jest 6 pozycji w lewo wzgledem aktualnej pozycji
      ! TR4 - wyfrukuj konkretny element z listy wyjsciowej o 4 znaki w prawo od pozycji aktualnej

end program p18

