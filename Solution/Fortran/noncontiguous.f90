SUBROUTINE FUNC(A,N)
INTEGER::I,INC=1
REAL::A(N)
DO I=1,N,INC
  A(I)=A(I)*2.0
END DO
END SUBROUTINE FUNC

SUBROUTINE FUNC1(A,N)
INTEGER::I,INC=2
REAL::A(N)
DO I=1,N,INC
  A(I)=A(I)*2.0
END DO
END SUBROUTINE FUNC1


