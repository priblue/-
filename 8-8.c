#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	//char names[10][20] = {"Kim","lee","sin","jo","kim2","Chae","jin","bak","so","chol"};
	//char names[10][20] = {"apple","bag","console","drone","epic","false","console","holic","inner","join"};//2번 같은 문자 포함.
 	char names[10][20] = {"Winter","is","comming","Too","cold","to","run","computer","pubg","game"};//1번 두 글자 대문자인 경우.
	char tmp[20];//names 배열을 Sorting 할 때 사용.
	char tmp2[20];//names 를 복사한 배열인 names_temp 를 Sorting 할 때 사용.
	char names_tmp[10][20];//names 배열 복사.
	
	printf("\n배열 초기화\n");
	for(int j = 0; j < 10; j++){
		printf("%5s ",names[j]);
	}
	printf("\n");
	
 	for(int i = 0; i < 10; i++){//names 배열을 names_tmp 배열로 복사.
 		for(int j = 0; j < 20; j++){
 			names_tmp[i][j] = names[i][j];
 		}
 		strupr(names_tmp[i]);//복사된 names_tmp 배열에 있는 모든 문자들을 대문자로 변경.
 	}
	
	for(int i = 0; i < 9; i++){//문자열 Bubble Sorting.
		for(int j = 0; j < 9 - i; j++){
			/*대문자로 변경된 names_tmp 배열을 기준으로 문자열 비교. 
			strcmp 는 서로 다른 배열을 아스키 코드를 기준으로 비교하기 때문에
			대문자와 소문자를 다른 문자로 처리한다.
			대소문자에 의한 아스키 코드 차이 없애기 위해 일괄 변경.*/
			if(strcmp(names_tmp[j],names_tmp[j + 1]) > 0){
				strcpy(tmp,names[j]);
  				strcpy(names[j],names[j + 1]);
  				strcpy(names[j + 1],tmp);
  				/*names 는 물론, names_tmp 에 있는 문자열도 동시에 Sorting 해 주어야 한다. 
				그래야 위 if 문 조건문이 배열을 제대로 검사할 수 있다. */
  				strcpy(tmp2,names_tmp[j]);
  				strcpy(names_tmp[j],names_tmp[j + 1]);
  				strcpy(names_tmp[j + 1],tmp2);
			}
		}
	}
	
	printf("\nSorted Result\n");
	for(int j = 0; j < 10; j++){//Sorting 된 names 배열을 출력한다. 
		printf("%5s ",names[j]);
	}
	
	return 0;
}
