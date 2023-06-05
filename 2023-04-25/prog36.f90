module nasze_zmienne ! modul moze byc uzywany przez rozne bloki
    implicit none
    real :: rank, x, y
end module nasze_zmienne

program prog36
    use nasze_zmienne 

    interface
        subroutine root()
            use nasze_zmienne
        end subroutine root
    end interface

    x = 104857; rank = 20
    call root()
    write(*, *) "20-th root of ", x, " equals ", y

    stop
end program

subroutine root() ! funkcja bezargumentowa
    use nasze_zmienne

    ! parametry wejsciowe x i rank oraz wynik y sa przekazywane przez modul
    ! elementy modulu sa globalne
    y = exp(log(x) / rank)
    return

end subroutine root
