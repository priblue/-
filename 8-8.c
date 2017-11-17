#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	char names[10][20] = {"kim","lee","sin","jo","kim2","chae","jin","bak","so","chol"};
	//char names[10][20] = {"apple","bag","console","drone","epic","false","console","holic","inner","join"};//2번 같은 문자 포함. 
	//char names[10][20] = {"Winter","is","comming","Too","cold","to","run","computer","pubg","game"};//1번 두 글자 대문자인 경우. 
	 
	int i,j = 0;
	char tmp[20];


	printf("==========names 배열의 구조==========\n\n");
	for(int c = 0; c < 10; c++){//Display "names" array with null to '#'
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
	for(int j = 0; j < 10; j++){
		printf("%5s ",names[j]);
	}
	printf("\n");
	
	char names_tmp[10][20];//names 배열 복사.
			for(int i = 0; i < 10; i++){
				for(int j = 0; j < 20; j++){
					names_tmp[i][j] = names[i][j];
				}
				strlwr(names_tmp[i]);//복사된 배열을 모두 대문자로 변경.
			}
			printf("대문자로 변경\n");
			for(int i = 0; i < 10; i++){
				printf("%5s ",names_tmp[i]);
			}
			

	for(int i = 0; i < 9; i++){
		for(int j = 0; j < 9 - i; j++){
			/*
			names 배열에서 서로 인접한 두 문자열을 strcmp 함수로 처리해서
			양수가 나오는 경우는 names[j] 의 아스키 코드가 더 큰 경우이다.
			다시 말해서, 65 132
			*/
			if(strcmp(names_tmp[j], names_tmp[j + 1]) > 0){
				strcpy(tmp,names[j]);
				strcpy(names[j],names[j + 1]);
				strcpy(names[j + 1],tmp);
			}
			
		}
	}
	printf("\n정렬 완료\n");
	for(int j = 0; j < 10; j++){
		printf("%5s ",names[j]);
	}
	
}
