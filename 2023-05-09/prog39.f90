MODULE zawiera_procedure_Summit
    IMPLICIT NONE
    PUBLIC :: Summit
    CONTAINS
        SUBROUTINE Summit(array)
            REAL, INTENT(IN), DIMENSION(:,:) :: array
            WRITE (UNIT=*, FMT=*) "Row sums: ", SUM(array, dim=2)       ! wydruk sumy w wierszach macierzy
            WRITE (UNIT=*, FMT=*) "Column sums: ", SUM(array, dim=1)     ! wydruk sumy w kolumnach
            WRITE (UNIT=*, FMT=*) "Total: ", SUM(array)                 ! suma wszystkich elementow macierzy
            RETURN
        END SUBROUTINE Summit
END MODULE zawiera_procedure_Summit

PROGRAM prog39
    USE zawiera_procedure_Summit
    IMPLICIT NONE 
    
    REAL, ALLOCATABLE, DIMENSION(:,:) :: a
                                    ! deklaracja dwuwymiarowej macierzy "a" o niezdefiniowanym rozmiarze
    INTEGER :: n

    OPEN (UNIT = 1, FILE = "x.txt", STATUS = "OLD", ACTION ="READ", POSITION="REWIND")
    
    ! wczytanie danych z pliku "x.txt", ktory trzeba utworzyc edytorem "kwrite" w biezacej kartotece, np.
    ! 2
    ! 1. 3. 5. 7.
    ! lub
    ! 2
    ! 1 3 5 7
    !w tym wypadku liczby INTEGER 1 3 5 7 zostana automatycznie przekonwertowane do typu REAL 1. 3. 5. 7.
    
    READ (UNIT=1, FMT=*) n      ! wczytujemy rozmiar macierzy, tutaj wspolny da obu wymiarow
    ALLOCATE (a(n, n))          ! rezerwacja pamieci dla macierzy kwadratowej "a"
    READ (UNIT=1, FMT=*) a      ! wczytanie wartosci wszystkich elementow macierzy "a"
    CALL Summit(a) 
    STOP 
END PROGRAM prog39
