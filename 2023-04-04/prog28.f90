program p28
    implicit none
    character(len=6) :: a,b,c,d
    print *,'Type string: 123456789 and press Enter'
    read '(A8,T1,A4,T7,A6,T4,A)',a,b,c,d

    print '(5X,A8,5X,A4,5X,A,5X,A6)',a,b,c,d
    print '(5X,A,5X,A,5X,A,5X,A1)',a,b,c,d

    stop
end program p28

