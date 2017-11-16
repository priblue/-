#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	char names[10][20] = {"kim","lee","sin","jo","kim2","chae","jin","bak","so","chol"};
	int i,j = 0;
	char tmp[20];


	for(int c = 0; c < 10; c++){
		for(int d = 0; d < 20; d++){
			if(names[c][d] == "\n"){
				printf("z");
			}else{
				printf("%c",names[c][d]);
			}
			
		}
		printf("\n");
	}
	printf("\n배열 초기화\n");
	for(j = 0; j < 10; j++){
		printf("%5s",names[j]);
	}
	printf("\n");
	
	for(i = 0; i < 9; i++){
		for(j = 0; j < 9 - 1; j++){
			//문자배열 비교
		}
	}
	
	printf("\nSorted Result\n");
	for(j = 0; j < 10; j++){
		printf("%5s",names[j]);
	}
	printf("\n");
	
	return 0;
}
