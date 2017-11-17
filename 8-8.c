#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	char names[10][20] = {"kim","lee","sin","jo","kim2","chae","jin","bak","so","chol"};
	int i,j = 0;
	char tmp[20];

	printf("==========names 배열의 구조==========\n\n");
	for(int c = 0; c < 10; c++){//Display "names" array with zero.
		for(int d = 0; d < 20; d++){
			if(names[c][d] == 0){
				printf("#");
			}else{
				printf("%c",names[c][d]);
			}
			
		}
		printf(" %d행\n",c);
	}
	
	printf("\n배열 초기화\n");
	for(j = 0; j < 10; j++){
		printf("%5s",names[j]);
	}
	printf("\n");

	for(i = 0; i < 9; i++){
		for(j = 0; j < 9 - i; j++){
			/*
			names 배열에서 서로 인접한 두 문자열을 strcmp 함수로 처리해서 
			양수가 나오는 경우는 names[j] 의 아스키 코드가 더 큰 경우이다.
			다시 말해서, 
			*/
			if(strcmp(names[j],names[j + 1]) > 0){
				//printf("위치 변경");
				//tmp[j] = names[j];
				//names[j] = names[j + 1];
				//names[j + 1] = tmp[j];
				strcpy(tmp,names[j]);
				strcpy(names[j],names[j + 1]);
				strcpy(names[j + 1],tmp);
			}
		}
	}
	//printf("%s",names[2]); 
	printf("\n정렬 완료\n");
	for(j = 0; j < 10; j++){
		printf("%5s",names[j]);
	}
	
}
