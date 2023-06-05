MODULE funkcja_korzysta_z_procedury
    IMPLICIT NONE
    PUBLIC :: module_function, module_subroutine
    
    TYPE, PUBLIC :: new
        INTEGER :: j, k ! typ wlasny "new" sklada sie z dwoch liczb calkowitych
    END TYPE new
    
    ! initialize x with constructor:
    TYPE(new), PUBLIC :: x = new(1234, 5678)    ! przypisanie wartosci zmiennej "x" typu wlasnego "new"
                                                ! PUBLIC - zmienne z tym atrybutem sa dostepne 
                                                ! w zakresie bloku przywolujacego modul 
                                                ! PRIVATE- zmienne z tym atrybutem sa dostepne 
                                                ! tylko wewnatrz modulu, ktory je definiuje 
                                                
    CONTAINS
        FUNCTION module_function() RESULT(module_function_r)
            TYPE(new) :: module_function_r
            CALL internal_subroutine(module_function_r)
            RETURN
            
            CONTAINS
                SUBROUTINE internal_subroutine(u) ! internal subprogram
                    TYPE (new), INTENT(OUT) :: u
                    u = new(22, 11)
                    CALL module_subroutine( u % j, u % k)
                    RETURN
                END SUBROUTINE internal_subroutine
        END FUNCTION module_function
        
        SUBROUTINE module_subroutine (i1, i2) ! module subprogram
            INTEGER, INTENT (IN OUT) :: i1, i2
            INTEGER:: x
            x = i1
            i1 = i2
            i2 = x ! swap - zamiana pierwszego elementu z drugim w zmiennej typu wasnego "new"
            RETURN
        END SUBROUTINE module_subroutine
    
END MODULE funkcja_korzysta_z_procedury

PROGRAM prog41
    USE funkcja_korzysta_z_procedury
    IMPLICIT NONE
    INTEGER, PARAMETER :: value = 789
    TYPE(new) :: exter
    INTEGER :: inter ! start program prog42
    
    exter = module_function()
    PRINT *, "exter = ", exter
    
    inter = internal_function()
    PRINT *, "inter = ", inter
    
    CONTAINS
        FUNCTION internal_function() RESULT(internal_function_r)
            INTEGER :: internal_function_r ! start function interna function
            internal_function_r = value
                        ! to iest funkcia wewnetrzna programu
                        ! zwraca wvnik nie prez swoia nazwe "internal function"
                        ! ale prez zmenna "internal _function_r", 
                        ! ktora jest parametrem "RESULT"
                        
        END FUNCTION internal_function
END PROGRAM prog41
