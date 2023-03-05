program p3
    open(unit=66,file="data_1",status="old",action="write",position="append")
    write(unit=66,fmt=*) "Witaj"
    stop
end program p3