program p15
    implicit none
    real, dimension(2:10,-30:30,0:10) :: t,y,tplusy
    t=2.0 ! podstawienie wartosci do wszystkich elementow macierzy
    y=3.0
    tplusy=t+y ! operacja dodawania wszystkich wartosci;
               ! wszystkie macierze musza miec te same wymiary

    print *,tplusy
    stop
end program p15

