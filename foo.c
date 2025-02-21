#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
	int k, n, id;
	double x=0, z, d;

	if(argc < 2)
		n = 1;		//default value for number of process to create
	else
		n = atoi(argv[1]);

	if(n< 0 || n> 20)
		n = 2;

	if(argc < 3)
		d=1.0;
	else
		d = atoi(argv[2]);

	x = 0;
	id = 0;
	for( k =0; k< n;k++){
		id = fork();
		if(id < 0){
			printf(1, "%d failed in fork!\n", getpid() );
		}else if (id > 0){
			printf(1, "Parent %d creating child %d\n", getpid(), id);
			wait();
		}else{
			printf(1, "Child %d created\n",getpid() );
			for(z = 0; z < 8000000.0; z +=d){
				x = x + 3.14 * 89.64;	//computation to take CPU time
			}
			break;
		}
	}
	exit();
}
