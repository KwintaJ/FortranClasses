MODULE moje_procedury_i_funkcje
    IMPLICIT NONE
    PUBLIC :: Input, Temp_C, Output
    CONTAINS
        SUBROUTINE Input(f_temp)
            REAL, INTENT(OUT) :: f_temp
            
            WRITE(UNIT=*, FMT=*) "Please enter the Fahrenheit temperature: "
            READ (UNIT=*, FMT=*) f_temp
            RETURN; 
        END SUBROUTINE Input
            
        FUNCTION Temp_C(f_temp) RESULT (temp_C_r)
            ! wynik dzialania funkcji nie jest zwracany prez jej nazwe "Temp_C", ale prez parametr "temp_c_r"
            REAL, INTENT(IN) :: f_temp
            REAL :: temp_c_r
            REAL, PARAMETER:: t_scale = 1.8, offset = 32.0
            ! wartosci zadeklarowanych jako PARAMETER nie mozna juz zmieniac, zmiana implikuje ERROR
            temp_C_r = (f_temp - offset) / t_scale
            ! konwersja temperatury w stopniach Fahrenheit'a (USA) a temperature w skali Celsjusza (EU)
            RETURN
        END FUNCTION Temp_C
        
        SUBROUTINE Output (f_temp, temp_C_r)
            REAL, INTENT (IN) :: f_temp, temp_c_r
            
            WRITE(UNIT=*, FMT=*) f_temp, "degrees Fahrenheit", temp_c_r, "degrees Celsius"
            WRITE(UNIT=*, FMT=*) INT(f_temp), "degrees Fahrenheit", INT(temp_C_r), "degrees Celsius"
            
            ! funkcia wbudowana "INT" konwertue liczbe REAL a INTEGER - obcina czesc ulamkowa
            WRITE(UNIT=*, FMT=*) NINT(f_temp), "degrees Fahrenheit", NINT (temp_c_r), "degrees Celsius"
            ! funkcja wbudowana "NINT" (Nearest INTeger)konwertuje liczbe REAL na INTEGER prez zaokraglenie do
            ! najblizszej liczby INTEGER, sprobuj np. z temperatura 78 stopni Fahrenheita
            
            RETURN 
        END SUBROUTINE Output
END MODULE moje_procedury_i_funkcje

PROGRAM prog40
    USE moje_procedury_i_funkcje
    IMPLICIT NONE
    
    REAL :: fahr
    
    CALL Input(fahr) !wywolanie procedury "Input", jej definicja jest udostepniona przez "USE ! nazwa modulu"
    CALL Output(fahr, Temp_C(fahr)) ! wywolanie procedury "Output", drugim argumentem 
                                    ! aktualnym jest wartosec zwracana prez funkcje "Temp_C"
                                    ! parametrami procedur moga byc funkcje!!!
    STOP
END PROGRAM prog40
