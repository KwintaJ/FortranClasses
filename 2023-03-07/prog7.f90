program p7
    implicit none
    character(len=16) :: a,b,c,d

    a="a kindly giant"
    b="a small man"
    c=b(:8)//"step"
    d="for a"//b(8:)
    b=" "//d(:4)//b(9:11)//a(3:6)
    a=a(:2)//a(10:15)//"leap"

    print *,a,b,c,d

    print *, "your first name"
    read *,a
    print *, "your last name"
    read *,b
    print *,a,b,"student"
    print *, trim(a), " ", trim(b), " student"
end program p7