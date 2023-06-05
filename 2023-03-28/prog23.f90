program p23
    implicit none
    integer, dimension(2:5,7:12,-5:4,7,2) :: macierz
    integer :: rozmiar, rozmiar1, rozmiar3, dolna_g, gorna_g

    macierz = 7

    rozmiar = size(macierz)         ! calkowity rozmiar macierzy
    rozmiar1 = size(macierz,1)      ! rozmiar macierzy w pierwszym wymiarze
    rozmiar3 = size(macierz,3)      ! rozmiar macierzy w trzecim wymiarze

    dolna_g = lbound(macierz,2)     ! dolna granica wskaznika w drugim wymiarze
    gorna_g = ubound(macierz,2)     ! gorna granica wskaznika w drugim wymiarze

    print *,"rozmiar = ",rozmiar,"rozmiar1 = ",rozmiar1,"rozmiar3 = ", &
    rozmiar3,"dolna granica = ",dolna_g,"gorna granica = ",gorna_g
    
    stop
end program p23
