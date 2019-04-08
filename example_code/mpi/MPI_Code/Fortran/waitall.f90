PROGRAM WAITALL
USE mpi_f08
IMPLICIT NONE
INTEGER::rank,size,count
REAL::data(100), value(100)
INTEGER::i
TYPE(MPI_Request)::ireq(100)
CALL MPI_Init
CALL MPI_Comm_rank(MPI_COMM_WORLD,rank)
IF(rank==0)THEN
  DO i=1,100
    data(i)=1.0*i
    CALL MPI_Isend(data(i),1,MPI_REAL,1,i,MPI_COMM_WORLD,ireq(i))
  END DO
ELSEIF(rank==1)THEN
  DO i=1,100
    CALL MPI_Irecv(VALUE(I),1,MPI_REAL,0,I,MPI_COMM_WORLD,ireq(i))
  END DO
ENDIF
CALL MPI_WAITALL(100,ireq,MPI_STATUSES_IGNORE)
IF(rank==1)PRINT*,'value(100):',value(100)
CALL MPI_Finalize
END PROGRAM WAITALL