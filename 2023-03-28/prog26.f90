program p26
    implicit none
    real :: minimal, maximal, il_skal
    integer, dimension(2,3) :: matrix_A
    logical, dimension(2,3) :: MASK ! ta macierz bedzie niejawne uzywana
                                    ! w funkcjach operujacych na matrix_A
                                    ! nie jest konieczna jej deklaracja
    integer, dimension(3,2) :: matrix_B
    integer, dimension(2,2) :: matrix_AB

    integer, dimension(3) :: vector_C
    integer, dimension(3) :: vector_D
    integer, dimension(6) :: vector_E

    integer, dimension(1:2) :: indeksy

    matrix_A(1,1) = 1 ; matrix_A(1,2) = 2 ; matrix_A(1,3) = 3  
    matrix_A(2,1) = 4 ; matrix_A(2,2) = 5 ; matrix_A(2,3) = 6

    maximal=maxval(matrix_A)      ! najwieksza wartosc calej macierzy
    indeksy = maxloc(matrix_A)    ! lokalizacja najwiekszej wartosci w macierzy
    print *,"max matrix_A(",indeksy(1),",",indeksy(2),") = ",maximal
    
    minimal=minval(matrix_A)      ! najmniejsza wartosc calej macierzy
    indeksy = minloc(matrix_A)    ! lokalizacja najmniejszej wartosci w macierzy
    print *,"min matrix_A(",indeksy(1),",",indeksy(2),") = ",minimal
    print *


    ! pakowanie
    ! vector_E=pack(matrix_A,MASK) - drugim argumentem jest MASK
    vector_E=pack(matrix_A,.true.) ! wpakuj do vector_E elementy matrix_A
                                   ! dla ktorych MASK ma wartosc prawda
    print *,vector_E
    print *

    vector_C=pack(matrix_A,matrix_A.LE.3) ! niejawna maska warunkowa
    vector_D=pack(matrix_A,matrix_A.GT.3)

    il_skal=dot_product(vector_C,vector_D)

    print *,"vector_C = ",vector_C 
    print *,"vector_D = ",vector_D 
    print *,"iloczyn skalarny wektorow C i D = ",il_skal 


    stop
end program p26
