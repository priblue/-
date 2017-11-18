#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	char names[10][20] = {"Kim","lee","sin","jo","kim2","Chae","jin","bak","so","chol"};
	char tmp[20];//names Bubble sorting 
	char tmp2[20];
	int i,j = 0;
	
	char names_tmp[10][20];//names 배열 복사.

	for(int c = 0; c < 10; c++){
		for(int d = 0; d < 20; d++){
			if(names[c][d] == '0'){
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
	
 	for(int i = 0; i < 10; i++){
 		for(int j = 0; j < 20; j++){
 			names_tmp[i][j] = names[i][j];
 		}
 		strupr(names_tmp[i]);//복사된 배열을 모두 대문자로 변경.
 	}
 	printf("대문자로 변경\n");
 	for(int i = 0; i < 10; i++){
 		printf("%5s ",names_tmp[i]);
 	}
	
	
	for(i = 0; i < 9; i++){
		for(j = 0; j < 9 - i; j++){
			if(strcmp(names_tmp[j],names_tmp[j + 1]) > 0){
				strcpy(tmp2,names_tmp[j]);
  				strcpy(names_tmp[j],names_tmp[j + 1]);
  				strcpy(names_tmp[j + 1],tmp2);
  				
				strcpy(tmp,names[j]);
  				strcpy(names[j],names[j + 1]);
  				strcpy(names[j + 1],tmp);
			}
		}
	}
	
	printf("\nSorted Result\n");
	for(j = 0; j < 10; j++){
		printf("%5s",names[j]);
	}
	printf("\nsort tmp\n");
	
	for(j = 0; j < 10; j++){
		printf("%5s",names_tmp[j]);
	}
	printf("\n");
	
	return 0;
}
