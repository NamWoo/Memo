PROGRAM UNROLLING
IMPLICIT NONE
INTEGER,PARAMETER::N=10000000+3,ITERMAX=10
INTEGER::I,II,IT
INTEGER(KIND=8)::ST,ET,C_RATE
REAL(KIND=8)::DTIME
REAL(KIND=8),DIMENSION(N)::A,B
REAL(KIND=8)::C=12.5

CALL RANDOM_NUMBER(A)
CALL RANDOM_NUMBER(B)

CALL SYSTEM_CLOCK(ST,C_RATE)
DO IT=1,ITERMAX
  DO I=1,N
    A(I)=A(I)+B(I)*C
  END DO
END DO
CALL SYSTEM_CLOCK(ET)
DTIME=(ET-ST)/DBLE(C_RATE)
PRINT*,'Unrolling (No Opt):',DTIME

CALL SYSTEM_CLOCK(ST,C_RATE)

II=MOD(N,4)
DO IT=1,ITERMAX
  DO I=1,II
    A(I)=A(I)+B(I)*C
  END DO
  DO I=II+1,N,4
        A(I)=A(I)+B(I)*C
        A(I+1)=A(I+1)+B(I+1)*C
        A(I+2)=A(I+2)+B(I+2)*C
        A(I+3)=A(I+3)+B(I+3)*C
  END DO
END DO
CALL SYSTEM_CLOCK(ET)
DTIME=(ET-ST)/DBLE(C_RATE)
PRINT*,'Unrolling (Opt):',DTIME


END PROGRAM UNROLLING