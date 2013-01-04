program hello
	implicit none
!    integer, parameter :: pi = 3.14
!    print *, "Hell ", pi

!	integer :: i,j,k
!    i=5
!    j=8
!    k=i*j
!    write(*,*)i,j,k

	real :: x
    x=.2
    do while(x.lt..95)
      x=3.8*x*(1.-x)
      write(*,*)x
    enddo
end program hello