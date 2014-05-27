!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++!
!                              Copyright (C) 2012                              !
!                   The Regents of the University of Michigan                  !
!              MPACT Development Group and Prof. Thomas J. Downar              !
!                             All rights reserved.                             !
!                                                                              !
! Copyright is reserved to the University of Michigan for purposes of          !
! controlled dissemination, commercialization through formal licensing, or     !
! other disposition. The University of Michigan nor any of their employees,    !
! makes any warranty, express or implied, or assumes any liability or          !
! responsibility for the accuracy, completeness, or usefulness of any          !
! information, apparatus, product, or process disclosed, or represents that    !
! its use would not infringe privately owned rights. Reference herein to any   !
! specific commercial products, process, or service by trade name, trademark,  !
! manufacturer, or otherwise, does not necessarily constitute or imply its     !
! endorsement, recommendation, or favoring by the University of Michigan.      !
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++!
PROGRAM testArrayUtils
#include "UnitTest.h"
  USE UnitTest
  USE IntrType
  USE ArrayUtils
  USE Sorting
  
  IMPLICIT NONE
  
  LOGICAL(SBK) :: bool
  REAL(SRK) :: tmprealarray(10)
  REAL(SRK),ALLOCATABLE :: tmpr(:)
  !INTEGER(SIK) :: tmpintarray(10)
  !INTEGER(SIK),ALLOCATABLE :: tmpi(:)
!
!Check the timer resolution
  CREATE_TEST('ArrayUtils')
!
  REGISTER_SUBTEST('1-D REALS',test1DReals)
  
  
  FINALIZE_TEST()
!
!===============================================================================
  CONTAINS
!
!-------------------------------------------------------------------------------
    SUBROUTINE test1DReals()
      !
      COMPONENT_TEST('getAbsolute 1-D Array')
      tmprealarray(1)=0.0_SRK !0.0
      tmprealarray(2)=2.0_SRK !2.0
      tmprealarray(3)=4.0_SRK !6.0
      tmprealarray(4)=4.0_SRK !10.0
      tmprealarray(5)=5.0_SRK !15.0
      tmprealarray(6)=5.0_SRK !20.0
      tmprealarray(7)=20.0_SRK !40.0
      tmprealarray(8)=20.0_SRK !60.0
      tmprealarray(9)=5.0_SRK  !65.0
      tmprealarray(10)=35.0_SRK !100.0
      CALL getAbsolute(tmprealarray,tmpr)
      bool=ALL(tmpr .APPROXEQA. (/0.0_SRK,2.0_SRK,6.0_SRK,10.0_SRK,15.0_SRK,20.0_SRK,40.0_SRK,60.0_SRK,65.0_SRK,100.0_SRK/))
      ASSERT(bool,'getAbsolute, no XI')
      CALL getAbsolute(tmprealarray(2:10),tmpr,XI=0.0_SRK)
      bool=ALL(tmpr .APPROXEQA. (/0.0_SRK,2.0_SRK,6.0_SRK,10.0_SRK,15.0_SRK,20.0_SRK,40.0_SRK,60.0_SRK,65.0_SRK,100.0_SRK/))
      ASSERT(bool,'getAbsolute, with XI')
      CALL getAbsolute(tmprealarray(2:10),tmpr,XI=-10.0_SRK)
      bool=ALL(tmpr .APPROXEQA. (/-10.0_SRK,-8.0_SRK,-4.0_SRK,0.0_SRK,5.0_SRK,10.0_SRK,30.0_SRK,50.0_SRK,55.0_SRK,90.0_SRK/))
      ASSERT(bool,'getAbsolute, with negative XI')
      !
      COMPONENT_TEST('getDelta 1-D Array')
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
      !CALL getDelta(tmprealarray,tmpr)
      !bool=ALL(tmpr .APPROXEQA. (/2.0_SRK,4.0_SRK,4.0_SRK,5.0_SRK,5.0_SRK,20.0_SRK,20.0_SRK,5.0_SRK,35.0_SRK/))
      !ASSERT(bool,'getDelta, no XI')
      !Is this the behavior we want?
      !CALL getDelta(tmprealarray(2:10),tmpr,XI=0.0_SRK)
      !bool=ALL(tmpr .APPROXEQA. (/4.0_SRK,4.0_SRK,5.0_SRK,5.0_SRK,20.0_SRK,20.0_SRK,5.0_SRK,35.0_SRK/))
      !ASSERT(bool,'getDelta, with XI')
      !CALL getDelta(tmprealarray(2:10),tmpr,XI=-10.0_SRK)
      !bool=ALL(tmpr .APPROXEQA. (/12.0_SRK,4.0_SRK,4.0_SRK,5.0_SRK,5.0_SRK,20.0_SRK,20.0_SRK,5.0_SRK,35.0_SRK/))
      !ASSERT(bool,'getDelta, with negative XI')
      !
      COMPONENT_TEST('findNUnique 1-D Array')
      tmprealarray(1)=1.0_SRK
      tmprealarray(2)=1.0_SRK
      tmprealarray(3)=1.0000000000000001_SRK
      tmprealarray(4)=1.0000000000100000_SRK
      tmprealarray(5)=2.0_SRK
      tmprealarray(6)=2.0_SRK
      tmprealarray(7)=2.0_SRK
      tmprealarray(8)=2.0_SRK
      tmprealarray(9)=2.0_SRK
      tmprealarray(10)=2.0_SRK
      bool=findNUnique(tmprealarray) == 3
      ASSERT(bool,'findNUnique == 3')
      tmprealarray(4)=1.000000000000100_SRK
      bool=findNUnique(tmprealarray,tol=EPSREAL) == 3
      ASSERT(bool,'findNUnique == 3,tol=EPSREAL')
      tmprealarray(4)=1.000000000001000_SRK
      bool=findNUnique(tmprealarray,tol=EPSREAL*10.0_SRK) == 3
      ASSERT(bool,'findNUnique == 3,tol=EPSREAL*10.0_SRK')
      tmprealarray(4)=1.000000000010000_SRK
      bool=findNUnique(tmprealarray,tol=EPSREAL*100.0_SRK) == 3
      ASSERT(bool,'findNUnique == 3,tol=EPSREAL*100.0_SRK')
      tmprealarray(4)=1.000000000100000_SRK
      bool=findNUnique(tmprealarray,tol=EPSREAL*1000.0_SRK) == 3
      ASSERT(bool,'findNUnique == 3,tol=EPSREAL*1000.0_SRK')
      bool=findNUnique(tmprealarray,tol=EPSREAL*10000.0_SRK) == 3
      ASSERT(bool,'findNUnique == 3,tol=EPSREAL*10000.0_SRK')
      
      !
      COMPONENT_TEST('findIndex 1-D Array')
      !Test with 0.0 specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findIndex(tmprealarray,-1.0_SRK) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,101.0_SRK) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,100.0_SRK) == -3,'On Mesh Boundary')
      ASSERT(findIndex(tmprealarray,1.0_SRK) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,3.0_SRK) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,8.0_SRK) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,12.0_SRK) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,18.0_SRK) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,30.0_SRK) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,50.0_SRK) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,62.0_SRK) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,70.0_SRK) == 9,'index == 9')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,0.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,0.0_SRK,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,100.0_SRK,INCL=2) == -2,'index == -2')
 
      !Test without 0.0 specified
      tmprealarray(1)=2.0_SRK
      tmprealarray(2)=6.0_SRK
      tmprealarray(3)=10.0_SRK
      tmprealarray(4)=15.0_SRK
      tmprealarray(5)=20.0_SRK
      tmprealarray(6)=40.0_SRK
      tmprealarray(7)=60.0_SRK
      tmprealarray(8)=65.0_SRK
      tmprealarray(9)=100.0_SRK
      tmprealarray(10)=110.0_SRK
  
      ASSERT(findIndex(tmprealarray,-1.0_SRK) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,111.0_SRK) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,110.0_SRK) == -3,'On Mesh Boundary')
      ASSERT(findIndex(tmprealarray,1.0_SRK) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,3.0_SRK) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,8.0_SRK) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,12.0_SRK) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,18.0_SRK) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,30.0_SRK) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,50.0_SRK) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,62.0_SRK) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,70.0_SRK) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,105.0_SRK) == 9,'index == 9')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,6.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,6.0_SRK,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,6.0_SRK,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,110.0_SRK,INCL=2) == -2,'index == -2')

      !Test with negative lower bound specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findIndex(tmprealarray,-11.0_SRK,XI=-10.0_SRK) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,101.0_SRK,XI=-10.0_SRK) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,100.0_SRK,XI=-10.0_SRK) == -3,'On Mesh Boundary')
      ASSERT(findIndex(tmprealarray,-1.0_SRK,XI=-10.0_SRK) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,1.0_SRK,XI=-10.0_SRK) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,3.0_SRK,XI=-10.0_SRK) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,8.0_SRK,XI=-10.0_SRK) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,12.0_SRK,XI=-10.0_SRK) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,18.0_SRK,XI=-10.0_SRK) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,30.0_SRK,XI=-10.0_SRK) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,50.0_SRK,XI=-10.0_SRK) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,62.0_SRK,XI=-10.0_SRK) == 9,'index == 9')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,-10.0_SRK,XI=-10.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,-10.0_SRK,XI=-10.0_SRK,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,-10.0_SRK,XI=-10.0_SRK,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=-10.0_SRK,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=-10.0_SRK,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=-10.0_SRK,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,100.0_SRK,XI=-10.0_SRK,INCL=2) == -2,'index == -2')

      !Test with 0.0 specified using DELTA
      tmprealarray(1)=0.0_SRK !0.0
      tmprealarray(2)=2.0_SRK !2.0
      tmprealarray(3)=4.0_SRK !6.0
      tmprealarray(4)=4.0_SRK !10.0
      tmprealarray(5)=5.0_SRK !15.0
      tmprealarray(6)=5.0_SRK !20.0
      tmprealarray(7)=20.0_SRK !40.0
      tmprealarray(8)=20.0_SRK !60.0
      tmprealarray(9)=5.0_SRK  !65.0
      tmprealarray(10)=35.0_SRK !100.0
  
      ASSERT(findIndex(tmprealarray,-1.0_SRK,DELTA=.TRUE.) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,101.0_SRK,DELTA=.TRUE.) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,1.0_SRK,DELTA=.TRUE.) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,3.0_SRK,DELTA=.TRUE.) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,8.0_SRK,DELTA=.TRUE.) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,12.0_SRK,DELTA=.TRUE.) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,18.0_SRK,DELTA=.TRUE.) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,30.0_SRK,DELTA=.TRUE.) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,50.0_SRK,DELTA=.TRUE.) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,62.0_SRK,DELTA=.TRUE.) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,70.0_SRK,DELTA=.TRUE.) == 9,'index == 9')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,2.0_SRK,DELTA=.TRUE.,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,DELTA=.TRUE.,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,100.0_SRK,DELTA=.TRUE.,INCL=2) == -2,'index == -2')

      !Test without 0.0 specified using DELTA
      tmprealarray(1)=2.0_SRK !2.0
      tmprealarray(2)=4.0_SRK !6.0
      tmprealarray(3)=4.0_SRK !10.0
      tmprealarray(4)=5.0_SRK !15.0
      tmprealarray(5)=5.0_SRK !20.0
      tmprealarray(6)=20.0_SRK !40.0
      tmprealarray(7)=20.0_SRK !60.0
      tmprealarray(8)=5.0_SRK  !65.0
      tmprealarray(9)=35.0_SRK !100.0
      tmprealarray(10)=10.0_SRK !110.0
  
      ASSERT(findIndex(tmprealarray,-1.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,111.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,1.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,3.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,8.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,12.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,18.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,30.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,50.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,62.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,70.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 9,'index == 9')
      ASSERT(findIndex(tmprealarray,105.0_SRK,XI=0.0_SRK,DELTA=.TRUE.) == 10,'index == 10')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,2.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,2.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,110.0_SRK,XI=0.0_SRK,DELTA=.TRUE.,INCL=2) == -2,'index == -2')
  
      !Test with negative lower bound specified using DELTA
      tmprealarray(1)=-10.0_SRK !-10.0
      tmprealarray(2)=10.0_SRK !0.0
      tmprealarray(3)=2.0_SRK !2.0
      tmprealarray(4)=4.0_SRK !6.0
      tmprealarray(5)=4.0_SRK !10.0
      tmprealarray(6)=5.0_SRK !15.0
      tmprealarray(7)=5.0_SRK !20.0
      tmprealarray(8)=20.0_SRK !40.0
      tmprealarray(9)=20.0_SRK !60.0
      tmprealarray(10)=5.0_SRK  !65.0
  
      ASSERT(findIndex(tmprealarray,-11.0_SRK,DELTA=.TRUE.) == -1,'Out of Lower Bounds')
      ASSERT(findIndex(tmprealarray,101.0_SRK,DELTA=.TRUE.) == -2,'Out of Upper Bounds')
      ASSERT(findIndex(tmprealarray,-1.0_SRK,DELTA=.TRUE.) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,1.0_SRK,DELTA=.TRUE.) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,3.0_SRK,DELTA=.TRUE.) == 3,'index == 3')
      ASSERT(findIndex(tmprealarray,8.0_SRK,DELTA=.TRUE.) == 4,'index == 4')
      ASSERT(findIndex(tmprealarray,12.0_SRK,DELTA=.TRUE.) == 5,'index == 5')
      ASSERT(findIndex(tmprealarray,18.0_SRK,DELTA=.TRUE.) == 6,'index == 6')
      ASSERT(findIndex(tmprealarray,30.0_SRK,DELTA=.TRUE.) == 7,'index == 7')
      ASSERT(findIndex(tmprealarray,50.0_SRK,DELTA=.TRUE.) == 8,'index == 8')
      ASSERT(findIndex(tmprealarray,62.0_SRK,DELTA=.TRUE.) == 9,'index == 9')
  
      !Check what happens on a mesh boundary.
      ASSERT(findIndex(tmprealarray,-10.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,-10.0_SRK,DELTA=.TRUE.,INCL=1) == -1,'index == -1')
      ASSERT(findIndex(tmprealarray,-10.0_SRK,DELTA=.TRUE.,INCL=2) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=0) == -3,'index == -3')
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=1) == 1,'index == 1')
      ASSERT(findIndex(tmprealarray,0.0_SRK,DELTA=.TRUE.,INCL=2) == 2,'index == 2')
      ASSERT(findIndex(tmprealarray,65.0_SRK,DELTA=.TRUE.,INCL=2) == -2,'index == -2')
!
!
      COMPONENT_TEST('findLowBound 1-D Array')
      !Test with 0.0 specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findLowBound(tmprealarray,-1.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findLowBound(tmprealarray,101.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findLowBound(tmprealarray,1.0_SRK) .APPROXEQ. 0.0_SRK,'Lower Bound == 0.0')
      ASSERT(findLowBound(tmprealarray,3.0_SRK) .APPROXEQ. 2.0_SRK,'Lower Bound == 2.0')
      ASSERT(findLowBound(tmprealarray,8.0_SRK) .APPROXEQ. 6.0_SRK,'Lower Bound == 6.0')
      ASSERT(findLowBound(tmprealarray,12.0_SRK) .APPROXEQ. 10.0_SRK,'Lower Bound == 10.0')
      ASSERT(findLowBound(tmprealarray,18.0_SRK) .APPROXEQ. 15.0_SRK,'Lower Bound == 15.0')
      ASSERT(findLowBound(tmprealarray,30.0_SRK) .APPROXEQ. 20.0_SRK,'Lower Bound == 20.0')
      ASSERT(findLowBound(tmprealarray,50.0_SRK) .APPROXEQ. 40.0_SRK,'Lower Bound == 40.0')
      ASSERT(findLowBound(tmprealarray,62.0_SRK) .APPROXEQ. 60.0_SRK,'Lower Bound == 60.0')
      ASSERT(findLowBound(tmprealarray,70.0_SRK) .APPROXEQ. 65.0_SRK,'Lower Bound == 65.0')
      !Check what happens on a mesh boundary.
  
      !Test without 0.0 specified
      tmprealarray(1)=2.0_SRK
      tmprealarray(2)=6.0_SRK
      tmprealarray(3)=10.0_SRK
      tmprealarray(4)=15.0_SRK
      tmprealarray(5)=20.0_SRK
      tmprealarray(6)=40.0_SRK
      tmprealarray(7)=60.0_SRK
      tmprealarray(8)=65.0_SRK
      tmprealarray(9)=100.0_SRK
      tmprealarray(10)=110.0_SRK
  
      ASSERT(findLowBound(tmprealarray,-1.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findLowBound(tmprealarray,111.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findLowBound(tmprealarray,1.0_SRK) .APPROXEQ. 0.0_SRK,'Lower Bound == 0.0')
      ASSERT(findLowBound(tmprealarray,3.0_SRK) .APPROXEQ. 2.0_SRK,'Lower Bound == 2.0')
      ASSERT(findLowBound(tmprealarray,8.0_SRK) .APPROXEQ. 6.0_SRK,'Lower Bound == 6.0')
      ASSERT(findLowBound(tmprealarray,12.0_SRK) .APPROXEQ. 10.0_SRK,'Lower Bound == 10.0')
      ASSERT(findLowBound(tmprealarray,18.0_SRK) .APPROXEQ. 15.0_SRK,'Lower Bound == 15.0')
      ASSERT(findLowBound(tmprealarray,30.0_SRK) .APPROXEQ. 20.0_SRK,'Lower Bound == 20.0')
      ASSERT(findLowBound(tmprealarray,50.0_SRK) .APPROXEQ. 40.0_SRK,'Lower Bound == 40.0')
      ASSERT(findLowBound(tmprealarray,62.0_SRK) .APPROXEQ. 60.0_SRK,'Lower Bound == 60.0')
      ASSERT(findLowBound(tmprealarray,70.0_SRK) .APPROXEQ. 65.0_SRK,'Lower Bound == 65.0')
  
      !Check what happens on a mesh boundary.
  
      !Test with negative lower bound specified
      tmprealarray(1)=-10.0_SRK
      tmprealarray(2)=0.0_SRK
      tmprealarray(3)=2.0_SRK
      tmprealarray(4)=6.0_SRK
      tmprealarray(5)=10.0_SRK
      tmprealarray(6)=15.0_SRK
      tmprealarray(7)=20.0_SRK
      tmprealarray(8)=40.0_SRK
      tmprealarray(9)=60.0_SRK
      tmprealarray(10)=65.0_SRK
  
      ASSERT(findLowBound(tmprealarray,-11.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findLowBound(tmprealarray,70.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findLowBound(tmprealarray,-1.0_SRK) .APPROXEQ. -10.0_SRK,'Lower Bound == -10.0')
      ASSERT(findLowBound(tmprealarray,1.0_SRK) .APPROXEQ. 0.0_SRK,'Lower Bound == 0.0')
      ASSERT(findLowBound(tmprealarray,3.0_SRK) .APPROXEQ. 2.0_SRK,'Lower Bound == 2.0')
      ASSERT(findLowBound(tmprealarray,8.0_SRK) .APPROXEQ. 6.0_SRK,'Lower Bound == 6.0')
      ASSERT(findLowBound(tmprealarray,12.0_SRK) .APPROXEQ. 10.0_SRK,'Lower Bound == 10.0')
      ASSERT(findLowBound(tmprealarray,18.0_SRK) .APPROXEQ. 15.0_SRK,'Lower Bound == 15.0')
      ASSERT(findLowBound(tmprealarray,30.0_SRK) .APPROXEQ. 20.0_SRK,'Lower Bound == 20.0')
      ASSERT(findLowBound(tmprealarray,50.0_SRK) .APPROXEQ. 40.0_SRK,'Lower Bound == 40.0')
      ASSERT(findLowBound(tmprealarray,62.0_SRK) .APPROXEQ. 60.0_SRK,'Lower Bound == 60.0')
      !Check what happens on a mesh boundary.
!
!
      COMPONENT_TEST('findUpBound 1-D Array')
      !Test with 0.0 specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findUpBound(tmprealarray,-1.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findUpBound(tmprealarray,101.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findUpBound(tmprealarray,1.0_SRK) .APPROXEQ. 2.0_SRK,'Upper Bound == 2.0')
      ASSERT(findUpBound(tmprealarray,3.0_SRK) .APPROXEQ. 6.0_SRK,'Upper Bound == 6.0')
      ASSERT(findUpBound(tmprealarray,8.0_SRK) .APPROXEQ. 10.0_SRK,'Upper Bound == 10.0')
      ASSERT(findUpBound(tmprealarray,12.0_SRK) .APPROXEQ. 15.0_SRK,'Upper Bound == 15.0')
      ASSERT(findUpBound(tmprealarray,18.0_SRK) .APPROXEQ. 20.0_SRK,'Upper Bound == 20.0')
      ASSERT(findUpBound(tmprealarray,30.0_SRK) .APPROXEQ. 40.0_SRK,'Upper Bound == 40.0')
      ASSERT(findUpBound(tmprealarray,50.0_SRK) .APPROXEQ. 60.0_SRK,'Upper Bound == 60.0')
      ASSERT(findUpBound(tmprealarray,62.0_SRK) .APPROXEQ. 65.0_SRK,'Upper Bound == 65.0')
      ASSERT(findUpBound(tmprealarray,70.0_SRK) .APPROXEQ. 100.0_SRK,'Upper Bound == 100.0')
      !Check what happens on a mesh boundary.
  
      !Test without 0.0 specified
      tmprealarray(1)=2.0_SRK
      tmprealarray(2)=6.0_SRK
      tmprealarray(3)=10.0_SRK
      tmprealarray(4)=15.0_SRK
      tmprealarray(5)=20.0_SRK
      tmprealarray(6)=40.0_SRK
      tmprealarray(7)=60.0_SRK
      tmprealarray(8)=65.0_SRK
      tmprealarray(9)=100.0_SRK
      tmprealarray(10)=110.0_SRK
  
      ASSERT(findUpBound(tmprealarray,-1.0_SRK,XI=0.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findUpBound(tmprealarray,111.0_SRK,XI=0.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findUpBound(tmprealarray,1.0_SRK,XI=0.0_SRK) .APPROXEQ. 2.0_SRK,'Upper Bound == 2.0')
      ASSERT(findUpBound(tmprealarray,3.0_SRK,XI=0.0_SRK) .APPROXEQ. 6.0_SRK,'Upper Bound == 6.0')
      ASSERT(findUpBound(tmprealarray,8.0_SRK,XI=0.0_SRK) .APPROXEQ. 10.0_SRK,'Upper Bound == 10.0')
      ASSERT(findUpBound(tmprealarray,12.0_SRK,XI=0.0_SRK) .APPROXEQ. 15.0_SRK,'Upper Bound == 15.0')
      ASSERT(findUpBound(tmprealarray,18.0_SRK,XI=0.0_SRK) .APPROXEQ. 20.0_SRK,'Upper Bound == 20.0')
      ASSERT(findUpBound(tmprealarray,30.0_SRK,XI=0.0_SRK) .APPROXEQ. 40.0_SRK,'Upper Bound == 40.0')
      ASSERT(findUpBound(tmprealarray,50.0_SRK,XI=0.0_SRK) .APPROXEQ. 60.0_SRK,'Upper Bound == 60.0')
      ASSERT(findUpBound(tmprealarray,62.0_SRK,XI=0.0_SRK) .APPROXEQ. 65.0_SRK,'Upper Bound == 65.0')
      ASSERT(findUpBound(tmprealarray,70.0_SRK,XI=0.0_SRK) .APPROXEQ. 100.0_SRK,'Upper Bound == 100.0')
      ASSERT(findUpBound(tmprealarray,101.0_SRK,XI=0.0_SRK) .APPROXEQ. 110.0_SRK,'Upper Bound == 110.0')
  
      !Check what happens on a mesh boundary.
  
      !Test with negative lower bound specified
      tmprealarray(1)=-10.0_SRK
      tmprealarray(2)=0.0_SRK
      tmprealarray(3)=2.0_SRK
      tmprealarray(4)=6.0_SRK
      tmprealarray(5)=10.0_SRK
      tmprealarray(6)=15.0_SRK
      tmprealarray(7)=20.0_SRK
      tmprealarray(8)=40.0_SRK
      tmprealarray(9)=60.0_SRK
      tmprealarray(10)=65.0_SRK
  
      ASSERT(findUpBound(tmprealarray,-11.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Lower Bounds')
      ASSERT(findUpBound(tmprealarray,70.0_SRK) .APPROXEQ. 0.0_SRK,'Out of Upper Bounds')
      ASSERT(findUpBound(tmprealarray,-1.0_SRK) .APPROXEQ. 0.0_SRK,'Upper Bound == 0.0')
      ASSERT(findUpBound(tmprealarray,1.0_SRK) .APPROXEQ. 2.0_SRK,'Upper Bound == 2.0')
      ASSERT(findUpBound(tmprealarray,3.0_SRK) .APPROXEQ. 6.0_SRK,'Upper Bound == 6.0')
      ASSERT(findUpBound(tmprealarray,8.0_SRK) .APPROXEQ. 10.0_SRK,'Upper Bound == 10.0')
      ASSERT(findUpBound(tmprealarray,12.0_SRK) .APPROXEQ. 15.0_SRK,'Upper Bound == 15.0')
      ASSERT(findUpBound(tmprealarray,18.0_SRK) .APPROXEQ. 20.0_SRK,'Upper Bound == 20.0')
      ASSERT(findUpBound(tmprealarray,30.0_SRK) .APPROXEQ. 40.0_SRK,'Upper Bound == 40.0')
      ASSERT(findUpBound(tmprealarray,50.0_SRK) .APPROXEQ. 60.0_SRK,'Upper Bound == 60.0')
      ASSERT(findUpBound(tmprealarray,62.0_SRK) .APPROXEQ. 65.0_SRK,'Upper Bound == 65.0')
      !Check what happens on a mesh boundary.
!
!
      COMPONENT_TEST('findEleHtAbove 1-D Array')
      !Test with 0.0 specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findEleHtAbove(tmprealarray,-1.0_SRK) .APPROXEQ. 1.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtAbove(tmprealarray,101.0_SRK) .APPROXEQ. -101.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtAbove(tmprealarray,1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtAbove == 1.0')
      ASSERT(findEleHtAbove(tmprealarray,3.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,8.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,12.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,18.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,30.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,50.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,62.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,70.0_SRK) .APPROXEQ. 30.0_SRK,'EleHtAbove == 30.0')
      !Check what happens on a mesh boundary.
  
      !Test without 0.0 specified
      tmprealarray(1)=2.0_SRK
      tmprealarray(2)=6.0_SRK
      tmprealarray(3)=10.0_SRK
      tmprealarray(4)=15.0_SRK
      tmprealarray(5)=20.0_SRK
      tmprealarray(6)=40.0_SRK
      tmprealarray(7)=60.0_SRK
      tmprealarray(8)=65.0_SRK
      tmprealarray(9)=100.0_SRK
      tmprealarray(10)=110.0_SRK
  
      ASSERT(findEleHtAbove(tmprealarray,-1.0_SRK,XI=0.0_SRK) .APPROXEQ. 1.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtAbove(tmprealarray,111.0_SRK,XI=0.0_SRK) .APPROXEQ. -111.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtAbove(tmprealarray,1.0_SRK,XI=0.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtAbove == 1.0')
      ASSERT(findEleHtAbove(tmprealarray,3.0_SRK,XI=0.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,8.0_SRK,XI=0.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,12.0_SRK,XI=0.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,18.0_SRK,XI=0.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,30.0_SRK,XI=0.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,50.0_SRK,XI=0.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,62.0_SRK,XI=0.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,70.0_SRK,XI=0.0_SRK) .APPROXEQ. 30.0_SRK,'EleHtAbove == 30.0')
      ASSERT(findEleHtAbove(tmprealarray,101.0_SRK,XI=0.0_SRK) .APPROXEQ. 9.0_SRK,'EleHtAbove == 9.0')
      !Check what happens on a mesh boundary.
  
      !Test with negative lower bound specified
      tmprealarray(1)=-10.0_SRK
      tmprealarray(2)=0.0_SRK
      tmprealarray(3)=2.0_SRK
      tmprealarray(4)=6.0_SRK
      tmprealarray(5)=10.0_SRK
      tmprealarray(6)=15.0_SRK
      tmprealarray(7)=20.0_SRK
      tmprealarray(8)=40.0_SRK
      tmprealarray(9)=60.0_SRK
      tmprealarray(10)=65.0_SRK
  
      ASSERT(findEleHtAbove(tmprealarray,-11.0_SRK) .APPROXEQ. 11.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtAbove(tmprealarray,70.0_SRK) .APPROXEQ. -70.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtAbove(tmprealarray,-1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtAbove == 1.0')
      ASSERT(findEleHtAbove(tmprealarray,1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtAbove == 1.0')
      ASSERT(findEleHtAbove(tmprealarray,3.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,8.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,12.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      ASSERT(findEleHtAbove(tmprealarray,18.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtAbove == 2.0')
      ASSERT(findEleHtAbove(tmprealarray,30.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,50.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtAbove == 10.0')
      ASSERT(findEleHtAbove(tmprealarray,62.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtAbove == 3.0')
      !Check what happens on a mesh boundary.
!
!
      COMPONENT_TEST('findEleHtBelow 1-D Array')
      !Test with 0.0 specified
      tmprealarray(1)=0.0_SRK
      tmprealarray(2)=2.0_SRK
      tmprealarray(3)=6.0_SRK
      tmprealarray(4)=10.0_SRK
      tmprealarray(5)=15.0_SRK
      tmprealarray(6)=20.0_SRK
      tmprealarray(7)=40.0_SRK
      tmprealarray(8)=60.0_SRK
      tmprealarray(9)=65.0_SRK
      tmprealarray(10)=100.0_SRK
  
      ASSERT(findEleHtBelow(tmprealarray,-1.0_SRK) .APPROXEQ. -1.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtBelow(tmprealarray,101.0_SRK) .APPROXEQ. 101.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtBelow(tmprealarray,1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,3.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,8.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,12.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,18.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtBelow == 3.0')
      ASSERT(findEleHtBelow(tmprealarray,30.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,50.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,62.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,70.0_SRK) .APPROXEQ. 5.0_SRK,'EleHtBelow == 5.0')
      !Check what happens on a mesh boundary.
  
      !Test without 0.0 specified
      tmprealarray(1)=2.0_SRK
      tmprealarray(2)=6.0_SRK
      tmprealarray(3)=10.0_SRK
      tmprealarray(4)=15.0_SRK
      tmprealarray(5)=20.0_SRK
      tmprealarray(6)=40.0_SRK
      tmprealarray(7)=60.0_SRK
      tmprealarray(8)=65.0_SRK
      tmprealarray(9)=100.0_SRK
      tmprealarray(10)=110.0_SRK
  
      ASSERT(findEleHtBelow(tmprealarray,-1.0_SRK) .APPROXEQ. -1.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtBelow(tmprealarray,111.0_SRK) .APPROXEQ. 111.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtBelow(tmprealarray,1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,3.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,8.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,12.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,18.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtBelow == 3.0')
      ASSERT(findEleHtBelow(tmprealarray,30.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,50.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,62.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,70.0_SRK) .APPROXEQ. 5.0_SRK,'EleHtBelow == 5.0')
      ASSERT(findEleHtBelow(tmprealarray,101.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      !Check what happens on a mesh boundary.
  
      !Test with negative lower bound specified
      tmprealarray(1)=-10.0_SRK
      tmprealarray(2)=0.0_SRK
      tmprealarray(3)=2.0_SRK
      tmprealarray(4)=6.0_SRK
      tmprealarray(5)=10.0_SRK
      tmprealarray(6)=15.0_SRK
      tmprealarray(7)=20.0_SRK
      tmprealarray(8)=40.0_SRK
      tmprealarray(9)=60.0_SRK
      tmprealarray(10)=65.0_SRK
  
      ASSERT(findEleHtBelow(tmprealarray,-11.0_SRK) .APPROXEQ. -11.0_SRK,'Out of Lower Bounds')
      ASSERT(findEleHtBelow(tmprealarray,70.0_SRK) .APPROXEQ. 70.0_SRK,'Out of Upper Bounds')
      ASSERT(findEleHtBelow(tmprealarray,-1.0_SRK) .APPROXEQ. 9.0_SRK,'EleHtBelow == 9.0')
      ASSERT(findEleHtBelow(tmprealarray,1.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,3.0_SRK) .APPROXEQ. 1.0_SRK,'EleHtBelow == 1.0')
      ASSERT(findEleHtBelow(tmprealarray,8.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,12.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      ASSERT(findEleHtBelow(tmprealarray,18.0_SRK) .APPROXEQ. 3.0_SRK,'EleHtBelow == 3.0')
      ASSERT(findEleHtBelow(tmprealarray,30.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,50.0_SRK) .APPROXEQ. 10.0_SRK,'EleHtBelow == 10.0')
      ASSERT(findEleHtBelow(tmprealarray,62.0_SRK) .APPROXEQ. 2.0_SRK,'EleHtBelow == 2.0')
      !Check what happens on a mesh boundary.
    ENDSUBROUTINE test1DReals
!
ENDPROGRAM testArrayUtils
