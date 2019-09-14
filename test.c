#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

char buf[512];

void CPUbound() {
  int j = 21, i = 1, k = 0;
  while(i<2000) {
    k = 0;
    while(k < 100000){
      j += k;
      k++;
    }
	k = 0;
    while(k < 100000){
      j -= k;
      k++;
    }
    i++;
  }
  printf(1, "%d\n", j);
}

void PartialIObound() { // Doees the same work as CPUBound, just some additional bocking calls
  int j = 53;
  int i = 1;
  int k = 0;
  for (; i < 20000; ++i) {
    k = 0;
    for(; k < 10000; k++)
      j += k;

    k = 0;
    for(; k < 10000; k++)
      j -= k;
    if(i%1000==0 && i < 2000)
      sleep(10);
  }
  printf(1, "%d\n", j);
}

void IObound() {
  int i = 1,n;
  for (; i < 1000; ++i) {
    sleep(1);
     int fd = open("proc.c", 0);
     while((n = read(fd, buf, sizeof(buf))) > 0);
  }
}

//invoking cpuBound process
void newprocess(int prio) {
  int f = fork();
  if (f < 0) {
    printf(1, "%d parent, ERROR in FORK:%d\n", getpid(), f);
  }

  if (f == 0) { // Child
    setprio(prio);
    printf(1, "%d with priority: %d\n", getpid(), getprio());
    int begin = uptime();
    CPUbound();
    printf(1, "%d began at %d, difference time of %d\n", getpid(), begin, uptime() - begin);
    exit();
  }
}

//invoking partial cpu and IOBound process
void new_partial_ioprocess(int prio) {
  int f = fork();
  if (f < 0) {
    printf(1, "%d parent, ERROR in FORK:%d\n", getpid(), f);
  }

  if (f == 0) { // Child
    setprio(prio);
    printf(1, "%d with priority: %d\n", getpid(), getprio());
    int begin = uptime();
    PartialIObound();
    printf(1, "%d began at %d, difference time of %d\n", getpid(), begin, uptime() - begin);
    exit();
  }
}

//invoking IOBound process
void new_ioprocess(int prio) {
  int f = fork();
  if (f < 0) {
    printf(1, "%d parent, ERROR in FORK:%d\n", getpid(), f);
  }

  if (f == 0) { // Child
    setprio(prio);
    printf(1, "%d with priority: %d\n", getpid(), getprio());
    int begin = uptime();
    IObound();
    printf(1, "%d began at %d, difference time of %d\n", getpid(), begin, uptime() - begin);
    exit();
  }
}

void testcase1() {
  newprocess(1);
  newprocess(2);
  while(wait()!=-1);
  return;
}

void testcase2() {
  newprocess(2);
  newprocess(4);
  newprocess(8);
  while(wait()!=-1);
  return;
}

void testcase3() {
  newprocess(2);
  new_partial_ioprocess(2);
  while(wait()!=-1);
  return;
}

void testcase4() {
  new_ioprocess(1);
  new_ioprocess(2);
  while(wait()!=-1);
  return;
}

int
main(int argc, char *argv[])
{
  printf(1, "\nStarted testmyscheduler(%d) at %d\n\n\n", getpid(), uptime());
  setprio(10);
  printf(1, "\n\nRunning testcase 1 (2 cpu bound processes)\n", getpid());
  testcase1();
  printf(1, "\n\nRunning testcase 2 (3 cpu bound processes)\n", getpid());
  testcase2();
  printf(1, "\n\nRunning testcase 3 (1 cpu bound, 1 partially IO bound)\n", getpid());
  testcase3();
  printf(1, "\n\nRunning testcase 4 (2 io bound processes)\n", getpid());
  testcase4();
  exit();
}
