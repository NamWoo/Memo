* 일정 : 2019/03/05 - 2019/03/05 (하루)
* 장소 : 한국과학기술정보연구원(대전 카이스트)
* https://helpdesk.ksc.re.kr/
  * 관련 정보 확인

# Multiprocessing Training Course


```
[sedu10@login02 ~]$ module av

--------------------- /opt/cray/craype/default/modulefiles ------------------
craype-mic-knl     craype-network-opa craype-x86-skylake

---------------------------- /opt/cray/modulefiles --------------------------
cdt/17.10
cray-ccdb/3.0.3(default)
cray-cti/1.0.6(default)
cray-fftw/3.3.6.2(default)
cray-fftw_impi/3.3.6.2(default)
cray-impi/1.1.4(default)
cray-lgdb/3.0.7(default)
cray-libsci/17.09.1(default)
craype/2.5.13(default)
craypkg-gen/1.3.5
mvapich2_cce/2.2rc1.0.3_noslurm(default)
mvapich2_gnu/2.2rc1.0.3_noslurm
papi/5.5.1.3(default)
perftools/6.5.2(default)
perftools-base/6.5.2(default)
perftools-lite/6.5.2(default)
PrgEnv-cray/1.0.2(default)

--------------------- /apps/Modules/modulefiles/compilers -------------------
cce/8.6.3(default)    intel/17.0.5(default) intel/19.0.1
gcc/6.1.0             intel/18.0.1          pgi/18.10
gcc/7.2.0             intel/18.0.3

------------------------ /apps/Modules/modulefiles/mpi ----------------------
ime/mvapich-verbs/2.2.ddn1.4 impi/18.0.3
ime/openmpi/1.10.ddn1.0      impi/19.0.1
impi/17.0.5(default)         mvapich2/2.3
impi/18.0.1                  openmpi/3.1.0

---------------- /apps/Modules/modulefiles/libraries_using_mpi --------------
fftw_mpi/2.1.5             netcdf-hdf5-parallel/4.6.1
fftw_mpi/3.3.7             parallel-netcdf/1.10.0
hdf5-parallel/1.10.2       pio/2.3.1

--------------------- /apps/Modules/modulefiles/libraries -------------------
CDO/1.8.2    hdf5/1.10.2  ncl/6.5.0    ncview/2.1.7
hdf4/4.2.13  lapack/3.7.0 NCO/4.7.4    netcdf/4.6.1

--------------------- /apps/Modules/modulefiles/commercial ------------------
cfx/v145               fluent/v145            gaussian/g16.a03
cfx/v170               fluent/v170            gaussian/g16.a03.linda
cfx/v181               fluent/v181            lsdyna/mpp
cfx/v191               fluent/v191            lsdyna/smp

-------------------- /apps/Modules/modulefiles/applications -----------------
advisor/17.0.5       lammps/8Mar18        singularity/2.4.2
advisor/18.0.1       namd/2.12            singularity/2.5.1
advisor/18.0.3       PETSc/3.8.4          singularity/2.5.2
cmake/3.12.3         python/2.7.15        singularity/3.0.1
ferret/7.4.3         python/3.7           subversion/1.7.19
forge/18.1.2         qe/6.1               tensorflow/1.12.0
grads/2.2.0          qt/4.8.7             vtune/17.0.5
gromacs/2016.4       qt/5.9.6             vtune/18.0.1
gromacs/5.0.6        R/3.5.0              vtune/18.0.3
IGPROF/5.9.16        siesta/4.0.2
ImageMagick/7.0.8-20 siesta/4.1-b3

------------------------ /apps/Modules/modulefiles/test ---------------------
pgi/19.1

---------------------- /apps/Modules/modulefiles/crayadm --------------------
chklimit/1.0 htop/2.2.0

```

## OpenMP 컴파일 옵션

* intel: -qopenmp
* GNU: -fopenmp
* Cray: -h omp(default)


## 병렬처리

* wall-clock time 를 줄이기 위해 병렬프로세싱을! 
* 단일노드에서 못 풀던 것들을 해결하기 위한!
* GPU, CPU 자원을 최대한 활용해서 네트워크로 연결된 클라우드 컴퓨팅!
* GPU 클러스터 머신 켓을 활용한 교육이 있었는데 작년엔, 근데 올해는?
* 하이브리드2 프로그래밍에 할 것이다. OpenNCC, MPI 같이 하는 교육
* 무어의 법칙, 요즘엔 클럭 낮추고 코어 수 늘리는, 이제 더이상 클럭은 늘어나지 못한다. 물리적 한계.

## 프로세스와 쓰레드

* 프로세스는 실제 실행되고 있는 프로그램을 뜻한다.
* 코어가 10개면 프로세스10, 쓰레드10개 이렇게 사용한다.
* 문맥교환. 현재 프로세스 저장하고 다른 프로세서 올리고


```
[sedu10@login02 ~]$ top
top - 10:04:00 up 63 days, 16:37, 90 users,  load average: 0.22, 0.27, 0.25
Tasks: 872 total,   1 running, 812 sleeping,  59 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0
KiB Mem : 39487516+total, 32082588+free, 16001284 used, 58048012 buff/cache
KiB Swap: 16777212 total, 16491668 free,   285544 used. 36076102+avail Mem

   PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
275636 root      20   0 1377860 163108   1796 S   2.6  0.0 218:39.87 spagen+
120195 root      20   0  120160   4592   1972 S   1.3  0.0   0:00.54 ScvTra+
120774 sedu10    20   0  175128   3428   1900 R   1.3  0.0   0:00.15 top
 66993 root      20   0 1559648 261012  23748 S   0.7  0.1 409:20.14 klnage+
111430 root      20   0  120160   4196   1972 S   0.7  0.0   0:00.17 ScvTra+
120770 sedu50    20   0  175136   3372   1900 S   0.7  0.0   0:00.17 top
120773 q487lsh   20   0  165856   5224   2700 S   0.7  0.0   0:00.09 vim
    10 root      20   0       0      0      0 S   0.3  0.0 131:18.95 rcu_sc+
  2195 root      20   0 2921044 2.455g  11208 S   0.3  0.7 151:03.78 sssd_n+
 42988 root      20   0 3101588 506944  66980 S   0.3  0.1  11:11.47 cmd
120183 root      20   0  168400   6764   4704 S   0.3  0.0   0:00.14 sshd
122425 root      20   0  273840  21276   3700 S   0.3  0.0  12:39.90 ScvAge+
296910 x1680a02  20   0  148600   6708   2412 S   0.3  0.0   0:00.69 bash
309633 root      20   0       0      0      0 S   0.3  0.0   0:08.03 kworke+
     1 root      20   0  192528   5696   2524 S   0.0  0.0  23:38.06 systemd
     2 root      20   0       0      0      0 S   0.0  0.0   2:06.68 kthrea+
     3 root      20   0       0      0      0 S   0.0  0.0   0:26.77 ksofti+
     8 root      rt   0       0      0      0 S   0.0  0.0  14:44.60 migrat+
     9 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh
    11 root      rt   0       0      0      0 S   0.0  0.0   0:11.67 watchd+
    12 root      rt   0       0      0      0 S   0.0  0.0   0:35.30 watchd+
    13 root      rt   0       0      0      0 S   0.0  0.0   2:57.80 migrat+
    14 root      20   0       0      0      0 S   0.0  0.0   2:37.34 ksofti+
    16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworke+
    17 root      rt   0       0      0      0 S   0.0  0.0   0:29.11 watchd+
    18 root      rt   0       0      0      0 S   0.0  0.0   2:02.88 migrat+
    19 root      20   0       0      0      0 S   0.0  0.0   1:34.26 ksofti+
    21 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworke+
    22 root      rt   0       0      0      0 S   0.0  0.0   0:28.69 watchd+
    23 root      rt   0       0      0      0 S   0.0  0.0   1:32.73 migrat+
    24 root      20   0       0      0      0 S   0.0  0.0   1:24.18 ksofti+
    26 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworke+
    27 root      rt   0       0      0      0 S   0.0  0.0   0:31.49 watchd+
    28 root      rt   0       0      0      0 S   0.0  0.0   1:29.87 migrat+
    29 root      20   0       0      0      0 S   0.0  0.0   1:16.37 ksofti+

```

* 쓰레드
* 프로세스에서 실행의 개념만 분리
* 파워포인트로 예를 들면 실행하면 파워포인트 열리고 문서파일 열리고, 또 파워포인트를 실행하면 파워포인트가 열리고 다른 문서파일 열리고, 이 때 파워포인트를 프로세서, 각각의 문서가 쓰레드.


* 하나의 쓰레드를 갖는 3개의 프로세스

## 병렬성 유형

* 데이터 병렬성
* 각각의 테스크 또는 openmp 코드를 각각 분할해서 하는, 행렬곱, 덧셈 등. 

* 테스크 병렬성
* 서로 다른 테스크를 하는, 하나는 날짜, 하나는 뭐 다른 거.. 등등

**openMP가 훨씬 편하다. MPI는 코드 자체가 다 수정해야한다.**

```
!$OMP PARALLEL DO
...
!$OMP END PARALLEL DO
```


인풋파일 많을 때 쓰레드 요즘에 자원 좋으면 40개까지 있으니까 동시에 input 파일 읽게.
```fortran
PROGRAM main
...
CALL interpolate()
CALL compute_states()
CALL gen_random_params()
...
END PROGRAM main
```

```fortran
PROGRAM main
...
CALL interpolate()
CALL compute_states()
CALL gen_random_params()
...
END PROGRAM main
```

공유메모리에서는 openMP 를 많이 쓴다.

분산메모리에서는 MPI 

공유분산은 openMP와 MPI 혼합. 여기서는 openMP 만 가지고는 못한다. openMP는 하나의 컴퓨터, 노드라고 보면 된다. openMP는 하나의 노드에서만 사용할 수 있다. 확장성 제한. 누리온에 많은 자원을 사용하려면 openMP를 사용해야한다. 내 코드는 68개 노드만 쓸꺼면 openMP 코어밖에 못쓴다. 1000개의 코어는 사용할 수 없다. 보통 슈퍼컴퓨터 쓰려면 MPI 코딩은 필수. MPI 코딩은 복잡, 할일도 많다. !!?


* NUMA
보드하나에 cpu 여러개 있을 때, 각 cpu와 메모리와 달리 또 다른 cpu와 메모리에 접근하는 속도는 차이가 있다. 
넌유니폼

* UMA 시스템
cpu1개 코어 4개, 메모리.
각 코어에서 메모리에 접근하는 속도가 똑같다.
유티폼

스카이 레이크 20개짜리 코어 1개.
나이츠렌딩 코어 68개 1개. 코드런트 모드 논리적 4등분, 누마시스템.

나중에 최적화 할 때는 누마든 우마든 어떻게 사용할지, 어떤 식으로 시스템을 활용할 지. 





## 성능측정

### 병목지점 분석
병목지점을 찾고 그 부분을 병렬처리하는 것이 중요하다. 다른 곳 해봤자 성능이 그닥?

컴파일러 상용, 인텔 같은 컴파일러가 많이 빠르다. 

인텔 라이브러리, 인텔 수치, 인텔 컴파일러 이렇게 사용하면 훨씩 성능이득이 좋다.

여러가지 컴파일러로 확인

순차코드는 cpu time 하고 wallcolck time 시간이 거의 같다.

근데 병렬처리는 코어 10개 가지고 처리했다면 1시간 짜리가 6분만에 산술적으로 끝난다. 월클락이 6분.

씨피유는 10개썼으니까 토탈 10개. 그래서 월클락으로 봐야한다. 실제 돌은 시간을 봐야하니까.


## time 명령어
코드시간 측정 도구
time ./PI_sq.o

## 통신부하

작은 것을 여러 번 보내는 것 보다 큰 것 한 번에 보내는 것이 빠르다




## openMP 사용법

병렬코드 지시어 넣고 openMP

병렬코드 지시어 넣고 gpu에서 돌아가게 하는거 openACC

https://www.openmp.org/


openMP 는 지시어 삽입된 부분만, 그래서 점진적으로 가능, 디버깅 쉬워짐, 지시어 넣고 오케? 다음에 넣고 굳? 패쓰, 넣고 읭? 결과가 달라? 이렇게 가능.

동기화, 의존성이 없다는 가정하에.


## 병렬영역 지정과 작업분할


```fortran
INTEGER OMP_GET_THREAD_NUM
CALL OMP_SET_NUM_THREADS(4)

!$OMP PARALLEL DO
!$OMP DO

DO i = 1, n
	a(i) = b(i) +c(i)
ENDDO

[!$OMP DO]
!$OMP END PARALLEL DO
```


## pi 계산 실습

### 준비
압축풀고 옮기고

```linux
[sedu10@login01 ~]$ scp 150.183.150.11:/tmp/ParallelProgramming.tgz .
[sedu10@login01 ~]$ ls
job_examples  ParallelProgramming.tgz
[sedu10@login01 ~]$ tar -xzvf ParallelProgramming.tgz
ParallelProgramming/
ParallelProgramming/Lapack_ex.c
ParallelProgramming/.a.dat.swp
ParallelProgramming/Lapack_ex.f90
ParallelProgramming/PiPar.f90
ParallelProgramming/scalapack_ex.f90
ParallelProgramming/PiMPI.c
ParallelProgramming/PiSeq.f90
ParallelProgramming/b.dat
ParallelProgramming/PiSeq.c
ParallelProgramming/PiPar.c
ParallelProgramming/a.dat
ParallelProgramming/PiMPI.f90
ParallelProgramming/MakeInput.f90
ParallelProgramming/MatMul_Lib.f90
[sedu10@login01 ~]$ ls
job_examples  ParallelProgramming  ParallelProgramming.tgz
[sedu10@login01 ~]$ cd ParallelProgramming/
[sedu10@login01 ParallelProgramming]$ ls
a.dat        Lapack_ex.f90   PiMPI.c    PiPar.f90  scalapack_ex.f90
b.dat        MakeInput.f90   PiMPI.f90  PiSeq.c
Lapack_ex.c  MatMul_Lib.f90  PiPar.c    PiSeq.f90
[sedu10@login01 ParallelProgramming]$ vi PiMPI.f90
[sedu10@login01 ParallelProgramming]$ vi PiSeq.f90
```

### fortran 순차코드

```fortran
program main
implicit none
integer*8,parameter :: num_step = 500000000
integer*8           :: i
real(kind=8)        :: sum,step,pi,x
real(kind=4)        :: stime,etime
step = (1.0d0/dble(num_step))
sum  = 0.0d0
write(*,400)
call cpu_time(stime)  ! starting time

do i=1,num_step
  x   = (dble(i)-0.5d0)*step
  sum = sum + 4.d0/(1.d0+x*x)  ! F(x)
enddo
call cpu_time(etime)  !ending time
pi = step * sum
write(*,100) pi,dabs(dacos(-1.0d0)-pi)
write(*,300) etime-stime
write(*,400)
100  format(' PI = ', F17.15,' (Error =',E11.5,')')
300  format(' Elapsed Time = ',F8.3,' [sec] ')
400  format('-------------------------------------------')
stop
end program
```

실행

```linux
[sedu10@login01 ParallelProgramming]$ gfortran PiSeq.f90 -o ./PiSeq
[sedu10@login01 ParallelProgramming]$ ls
a.dat        Lapack_ex.f90   PiMPI.c    PiPar.f90  PiSeq.f90
b.dat        MakeInput.f90   PiMPI.f90  PiSeq      scalapack_ex.f90
Lapack_ex.c  MatMul_Lib.f90  PiPar.c    PiSeq.c
[sedu10@login01 ParallelProgramming]$ ./PiSeq
-------------------------------------------
 PI = 3.141592653589814 (Error =0.20872E-13)
 Elapsed Time =    6.543 [sec]
-------------------------------------------

[sedu10@login01 ParallelProgramming]$ time ./PiSeq
-------------------------------------------
 PI = 3.141592653589814 (Error =0.20872E-13)
 Elapsed Time =    6.550 [sec]
-------------------------------------------

real    0m6.591s
user    0m6.562s
sys     0m0.013s
```


### fortran 병렬코드


```fortran
program main
use omp_lib
implicit none
integer*8,parameter :: num_step = 500000000
integer*8           :: i
real(kind=8)        :: sum,step,pi,x
real(kind=4)        :: stime,etime
integer             :: tid, num_threads
step = (1.0d0/dble(num_step))
sum  = 0.0d0
write(*,400)
call cpu_time(stime)  ! starting time

!$OMP PARALLEL PRIVATE(tid,x)
   tid=OMP_GET_THREAD_NUM()
   num_threads=OMP_GET_NUM_THREADS()
   write(*,10) tid, num_threads
!$OMP DO REDUCTION(+:sum)
do i=1,num_step
  x   = (dble(i)-0.5d0)*step
  sum = sum + 4.d0/(1.d0+x*x)  ! F(x)
enddo
!$OMP END DO
!$OMP END PARALLEL
call cpu_time(etime)  !ending time
pi = step * sum
write(*,100) pi,dabs(dacos(-1.0d0)-pi)
write(*,300) etime-stime
write(*,400)
10   format(' My thread ID =',I3,', Total',I3,' threads are activated')
100  format(' PI = ', F17.15,' (Error =',E11.5,')')
300  format(' Elapsed Time = ',F8.3,' [sec] ')
400  format('-------------------------------------------')
stop
end program
```

실행

```
[sedu10@login01 ParallelProgramming]$ cds
[sedu10@login01 sedu10]$ qsub -I -V -l select=1:ncpus=8:ompthreads=8 -l walltime=01:00:00 -q debug
qsub: waiting for job 1960784.pbs to start
qsub: job 1960784.pbs ready

[sedu10@node8284 ParallelProgramming]$ gfortran PiSeq.f90 -o PiSeq.o
[sedu10@node8284 ParallelProgramming]$ time ./PiSeq.o
-------------------------------------------
 PI = 3.141592653589814 (Error =0.20872E-13)
 Elapsed Time =   38.062 [sec]
-------------------------------------------

real    0m38.076s
user    0m38.063s
sys     0m0.010s
[sedu10@node8284 ParallelProgramming]$ gfortran -fopenmp PiPar.f90 -o Pi
PiMPI.c    PiPar.c    PiSeq      PiSeq.f90
PiMPI.f90  PiPar.f90  PiSeq.c    PiSeq.o
[sedu10@node8284 ParallelProgramming]$ gfortran -fopenmp PiPar.f90 -o PiPar_for.x
[sedu10@node8284 ParallelProgramming]$ time ./PiPar_for.x
-------------------------------------------
 My thread ID =  5, Total  8 threads are activated
 My thread ID =  6, Total  8 threads are activated
 My thread ID =  1, Total  8 threads are activated
 My thread ID =  4, Total  8 threads are activated
 My thread ID =  7, Total  8 threads are activated
 My thread ID =  3, Total  8 threads are activated
 My thread ID =  0, Total  8 threads are activated
 My thread ID =  2, Total  8 threads are activated
 PI = 3.141592653589968 (Error =0.17497E-12)
 Elapsed Time =   37.408 [sec]
-------------------------------------------

real    0m4.694s
user    0m37.410s
sys     0m0.019s
[sedu10@node8284 ParallelProgramming]$ export OMP_NUM_THREADS=16
[sedu10@node8284 ParallelProgramming]$ gfortran -fopenmp PiPar.f90 -o PiPar_for.x
[sedu10@node8284 ParallelProgramming]$ time ./PiPar_for.x
-------------------------------------------
 My thread ID =  0, Total 16 threads are activated
 ...
 My thread ID =  1, Total 16 threads are activated
 PI = 3.141592653589879 (Error =0.85709E-13)
 Elapsed Time =   37.472 [sec]
-------------------------------------------

real    0m2.359s
user    0m37.485s
sys     0m0.012s
[sedu10@node8284 ParallelProgramming]$

[sedu10@node8284 ParallelProgramming]$ export OMP_NUM_THREADS=128
[sedu10@node8284 ParallelProgramming]$ time ./PiPar_for.x
-------------------------------------------
 My thread ID =  1, Total128 threads are activated
 ...
 My thread ID =127, Total128 threads are activated
 PI = 3.141592653589788 (Error =0.53291E-14)
 Elapsed Time =   37.672 [sec]
-------------------------------------------

real    0m0.775s
user    0m37.644s
sys     0m0.098s

[sedu10@node8284 ParallelProgramming]$ export OMP_NUM_THREADS=1024
[sedu10@node8284 ParallelProgramming]$ time ./PiPar_for.x
-------------------------------------------
 My thread ID = 60, Total*** threads are activated
 ...
 My thread ID =273, Total*** threads are activated
 PI = 3.141592653589792 (Error =0.13323E-14)
 Elapsed Time =   37.930 [sec]
-------------------------------------------

real    0m0.852s
user    0m37.670s
sys     0m0.497s
[sedu10@node8284 ParallelProgramming]$ export OMP_NUM_THREADS=512
[sedu10@node8284 ParallelProgramming]$ time ./PiPar_for.x
-------------------------------------------
 My thread ID =  1, Total512 threads are activated
 ...


 PI = 3.141592653589793 (Error =0.00000E+00)
 Elapsed Time =   37.790 [sec]
-------------------------------------------

real    0m0.770s
user    0m37.676s
sys     0m0.257s
```


## 메모리 패싱
독립된 메모리 공간 가진다. 데이터가 필요하면 불러오는, 하나의 프로세서가 값을 바꾸면 전달하고 받아서 메모리에 저장해야한다.

통신을 위한 함수일 뿐. 

openMP는 컴파일에서 알아서. MPI는 라이브러리라서, 누리온에서는 모듈만 로드.

포트란은 전부 서브루틴, 루틴값이 없다. call MPI_INI

## 커뮤니케이터

랭크번호를 알아야 통신이 가능하다.


```
[sedu10@login01 sedu10]$ module li
Currently Loaded Modulefiles:
  1) craype-network-opa   2) gcc/7.2.0            3) craype-mic-knl
[sedu10@login01 sedu10]$ module add openmpi/3.1.0
[sedu10@login01 sedu10]$ module li
Currently Loaded Modulefiles:
  1) craype-network-opa   3) craype-mic-knl
  2) gcc/7.2.0            4) openmpi/3.1.0
[sedu10@login01 sedu10]$
```

아까 qsub은

`qsub -I -V -l select=1:ncpus=8:ompthreads=8 -l walltime=01:00:00 -q debug`

이번에 qsub은

`qsub -I -V -l select=1:ncpus=8:mpiprocs=8:ompthreads=1 -l walltime=01:00:00 -q debug`

```
[sedu10@login01 sedu10]$ qsub -I -V -l select=1:ncpus=8:mpiprocs=8:ompthreads=1 -l walltime=01:00:00 -q debug
qsub: waiting for job 1961241.pbs to start
qsub: job 1961241.pbs ready
```


## fortran MPI 코드

```fortran
PROGRAM pi_cal
IMPLICIT NONE
INCLUDE 'mpif.h'
INTEGER ierr, nprocs, myrank,tag,j
INTEGER status(MPI_STATUS_SIZE)
INTEGER seed, tpoints, in_circle
DOUBLE PRECISION pi, x, y, r, recv, RAND

tpoints = 10000000

CALL MPI_INIT(ierr)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD,nprocs,ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD,myrank,ierr)
in_circle = 0
!seed=5
!CALL SRAND(seed*myrank)

DO j = myrank+1,tpoints,nprocs
   call random_number(x)
   call random_number(y)
   x=x-0.5
   y=y-0.5
   r = SQRT(x*x + y*y)
   IF (r<0.5d0) THEN
      in_circle = in_circle + 1
   ENDIF
ENDDO
pi = 4.0*in_circle/tpoints
IF(myrank /= 0) THEN
   CALL MPI_SEND(pi, 1, MPI_DOUBLE_PRECISION, 0, 1, &
        MPI_COMM_WORLD, ierr)
ENDIF

IF(myrank==0) THEN
   DO j = 1, nprocs-1
      CALL MPI_RECV(recv, 1, MPI_DOUBLE_PRECISION, j, 1, &
                    MPI_COMM_WORLD, status, ierr)
      pi = pi + recv
   ENDDO
```

```c

#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"
#include <math.h>
void main(int argc, char *argv[]){
  int j, nprocs, myrank,tag;
  MPI_Status status;
  int tpoints, in_circle;
  double pi, seed, x, y, r, recv;

  tpoints = 1000000;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD,&nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
  in_circle = 0;  seed=0.5;
  srand(seed*myrank);

  for(j=myrank; j<tpoints; j+=nprocs){
     x = (double)rand()/RAND_MAX - 0.5;
     y = (double)rand()/RAND_MAX - 0.5;
     r = sqrt(x*x + y*y);
     if (r<=0.5) in_circle = in_circle + 1;
  }
  pi = 4.0*in_circle/tpoints;

  if(myrank != 0)
     MPI_Send(&pi,1,MPI_DOUBLE,0,1,MPI_COMM_WORLD);

  if(myrank==0){
     for(j=1; j<=nprocs-1; j++){
         MPI_Recv(&recv, 1, MPI_DOUBLE, j, 1,
                    MPI_COMM_WORLD, &status);
         pi = pi + recv;
     }
     printf(" pi = %f\n", pi);
  }
  MPI_Finalize();
}
```


c 실행

```
[sedu10@node8282 ParallelProgramming]$ mpicc PiMPI.c -o PiMPI_c.x -lm
[sedu10@node8282 ParallelProgramming]$ time mpirun -np 8 ./PiMPI_c.x
 pi = 3.140808

real    0m1.204s
user    0m1.361s
sys     0m1.781s
```

실제는 이렇게 사용

`qsub -I -V -l select=100:ncpus=68:mpiprocs=68:ompthreads=1 -l walltime=01:00:00 -q debug`

한 청크에 10개


## 라이브러리

네트워크 가지고 연결, 제일 처음 컴파일러 mpi 설치하고 라팩, 블라스터, 다 설치한다. 거의 대부분 다 쓰기 때문에. 

벡터-벡터
벡터-행렬, 2중루프
행렬-행렬, 3중루프

http://netlib.org/

http://netlib.org/blas/

### LAPACK 

라팩은 덴스 메트릭스 행렬 요수의 값이 대부분 0이 아닌, 의미있는 값.

스파스 메트릭스, 대부분 0, 의미 있는 요소가 없는. cfd 같은.

EISPACK 고유벡터, 고유치 구하는거 죄다 모아놓은.


```fortran

Program LinearEquations
Implicit none
Real*4 A(3,3), b(3)
integer i, j, pivot(3), ok
A(1,1)=3.1;   A(1,2)=1.3
A(1,3)=-5.7;  A(2,1)=1.0
A(2,2)=-6.9;  A(2,3)=5.8
A(3,1)=3.4;   A(3,2)=7.2
A(3,3)=-8.8

b(1)=-1.3;  b(2)=-0.1;  b(3)=1.8

call SGESV(3, 1, A, 3, pivot, b, 3, ok)
do i=1, 3
   write(*,*) b(i)
end do
end
```

실행

```
[sedu10@node8286 ~]$ module add lapack/3.7.0
[sedu10@node8286 ~]$ pwd
/home01/sedu10
[sedu10@node8286 ~]$ module li
Currently Loaded Modulefiles:
  1) craype-network-opa   3) craype-mic-knl       5) lapack/3.7.0
  2) gcc/7.2.0            4) openmpi/3.1.0
[sedu10@node8286 ParallelProgramming]$ gfortran Lapack_ex.f90 -o Lapack_ex.x -L /apps/compiler/gcc/7.2.0/applib1/mic-knl/lapack/3.7.0 -llapack -lblas
[sedu10@node8286 ParallelProgramming]$ time ./Lapack_ex.x
   1.00000012
   1.00000000
   1.00000000

real    0m0.016s
user    0m0.002s
sys     0m0.012s
[sedu10@node8286 ParallelProgramming]$

```


보다 줄인거

```fortran
PROGRAM MATMUL_LIB
IMPLICIT NONE
!INTEGER,PARAMETER::N=2048*2
INTEGER,PARAMETER::N=512
INTEGER::I,J,K
INTEGER(KIND=8)::ST,ET,C_RATE
REAL(KIND=8)::DTIME
REAL(KIND=8),DIMENSION(N,N)::A,B,C
REAL(KIND=8)::C0,C1,C2,C3,TMP
REAL(KIND=8)::ALPHA=1.0D0, BETA=0.0D0

CALL RANDOM_NUMBER(A)
CALL RANDOM_NUMBER(B)
C=0.0

CALL SYSTEM_CLOCK(ST,C_RATE)
DO J=1,N
  DO I=1,N
    DO K=1,N
      C(I,J)=C(I,J)+A(I,K)*B(K,J)
    END DO
  END DO
END DO
CALL SYSTEM_CLOCK(ET)
DTIME=(ET-ST)/DBLE(C_RATE)
PRINT*,C(1,1)
PRINT*,'Original code(No Opt):',DTIME

C=0.0D0
CALL SYSTEM_CLOCK(ST,C_RATE)
CALL DGEMM('N','N',N,N,N,ALPHA,A,N,B,N,BETA,C,N)
CALL SYSTEM_CLOCK(ET)
DTIME=(ET-ST)/DBLE(C_RATE)
PRINT*,C(1,1)
PRINT*,'MKL(Opt):',DTIME
END PROGRAM MATMUL_LIB

```



```
[sedu10@node8286 ParallelProgramming]$ module add intel/18.0.3
[sedu10@node8286 ParallelProgramming]$ ls
a.dat          Lapack_ex.x     PiMPI_c.x  PiPar_for.x    PiSeq.f90
b.dat          MakeInput.f90   PiMPI.f90  PiPar_intel.x  PiSeq.o
Lapack_ex.c    MatMul_Lib.f90  PiPar.c    PiSeq          scalapack_ex.f90
Lapack_ex.f90  PiMPI.c         PiPar.f90  PiSeq.c
[sedu10@node8286 ParallelProgramming]$ ifort -qopenmp PiPar.f90
PiPar.f90(31): remark #8291: Recommended relationship between field width 'W' and the number of fractional digits 'D' in this edit descriptor is 'W>=D+7'.
100  format(' PI = ', F17.15,' (Error =',E11.5,')')
------------------------------------------^
[sedu10@node8286 ParallelProgramming]$ ls -lrth
total 1.7M
-rw-r--r-- 1 sedu10 in0163  596 Feb 26 16:05 PiSeq.c
-rw-r--r-- 1 sedu10 in0163  664 Feb 26 16:11 PiSeq.f90
-rw-r--r-- 1 sedu10 in0163  973 Feb 26 16:17 PiPar.f90
-rw-r--r-- 1 sedu10 in0163  703 Feb 26 16:19 PiPar.c
-rw-r--r-- 1 sedu10 in0163  942 Feb 26 18:38 PiMPI.c
-rw-r--r-- 1 sedu10 in0163  955 Feb 26 18:51 PiMPI.f90
-rw-r--r-- 1 sedu10 in0163  313 Feb 26 19:27 Lapack_ex.f90
-rw-r--r-- 1 sedu10 in0163  838 Feb 26 19:50 Lapack_ex.c
-rw-r--r-- 1 sedu10 in0163  245 Mar  5 04:22 MakeInput.f90
-rw-r--r-- 1 sedu10 in0163  273 Mar  5 04:23 b.dat
-rw-r--r-- 1 sedu10 in0163 4.3K Mar  5 04:23 a.dat
-rw-r--r-- 1 sedu10 in0163 2.6K Mar  5 04:39 scalapack_ex.f90
-rw-r--r-- 1 sedu10 in0163  730 Mar  5 04:49 MatMul_Lib.f90
-rwxr-xr-x 1 sedu10 in0163  13K Mar  5 14:15 PiSeq
-rwxr-xr-x 1 sedu10 in0163  13K Mar  5 14:30 PiSeq.o
-rwxr-xr-x 1 sedu10 in0163  13K Mar  5 14:46 PiPar_for.x
-rwxr-xr-x 1 sedu10 in0163 780K Mar  5 14:54 PiPar_intel.x
-rwxr-xr-x 1 sedu10 in0163  13K Mar  5 15:53 PiMPI_c.x
-rwxr-xr-x 1 sedu10 in0163  30K Mar  5 16:39 Lapack_ex.x
-rwxr-xr-x 1 sedu10 in0163 772K Mar  5 17:09 a.out
[sedu10@node8286 ParallelProgramming]$ ./a.out
-------------------------------------------
 My thread ID =  0, Total  1 threads are activated
 PI = 3.141592653590012 (Error =0.21894E-12)
 Elapsed Time =    5.693 [sec]
-------------------------------------------
[sedu10@node8286 ParallelProgramming]$



```



