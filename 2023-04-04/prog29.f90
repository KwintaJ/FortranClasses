program p29
    implicit none
    type :: point ! (x, y)
        real :: x,y
    end type point

    type :: line ! Ax + By + C = 0
        real :: a,b,c
    end type line
    
    type(point) :: p1,p2
    type(line) :: p1_to_p2

    write (*,*) 'Please enter x1 and y1'; read (*,*) p1
    write (*,*) 'Please enter x2 and y2'; read (*,*) p2
    
    p1_to_p2%a=p2%y-p1%y
    p1_to_p2%b=p1%x-p2%x
    p1_to_p2%c=p1%y*p2%x-p2%y*p1%x

    write (*,*) 'Ax + By + C = 0'
    write (*,*) 'a = ', p1_to_p2%a
    write (*,*) 'b = ', p1_to_p2%b
    write (*,*) 'c = ', p1_to_p2%c

    stop
end program p29

