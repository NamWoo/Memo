PROGRAM MAIN
IMPLICIT NONE
INCLUDE 'mpif.h'
INTEGER::nRank, nProcs, nNameLen,ierr
CHARACTER(LEN=10)::procName
INTEGER::myar(5,5)
CALL MPI_INIT(ierr)
CALL SYSTEM('hostname')
CALL MPI_FINALIZE(ierr)
END PROGRAM MAIN
