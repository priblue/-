/*영산대학교 컴퓨터공학과 
  10161420 주재현*/

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
	//char names[10][20] = {"Kim","lee","sin","jo","kim2","Chae","jin","bak","so","chol"};
	//char names[10][20] = {"apple","bag","console","drone","epic","false","console","holic","inner","join"};//2번 같은 문자 포함.
 	char names[10][20] = {"Winter","is","comming","Too","cold","to","run","computer","pubg","game"};//1번 두 글자 대문자인 경우.
	char tmp[20];//names 배열을 Sorting 할 때 사용.
	char tmp2[20];//names 를 복사한 배열인 names_temp 를 Sorting 할 때 사용.
	char names_tmp[10][20];//names 배열 복사.
	int i,j;
	
	printf("\n배열 초기화\n");
	for(j = 0; j < 10; j++){
		printf("%5s ",names[j]);
	}
	printf("\n");
	
 	for(i = 0; i < 10; i++){//names 배열을 names_tmp 배열로 복사.
 		for(j = 0; j < 20; j++){
 			names_tmp[i][j] = names[i][j];
 		}
 		strupr(names_tmp[i]);//복사된 names_tmp 배열에 있는 모든 문자들을 대문자로 변경. 각 요소에 전부 적용하기 위해 10번 반복해야 함. 
 	}
 	/*대문자로 변경된 names_tmp 배열을 기준으로 문자열을 비교하고 Bubble Sorting 한다. 
	  문자열 비교를 위한 strcmp 는 서로 다른 배열을 아스키 코드를 기준으로 비교하기 때문에
	  대문자와 소문자를 다른 문자로써 처리한다. 올바른 비교를 위해 전부 대문자나 소문자로 통일해 주었다.*/
	
	for(i = 0; i < 9; i++){//문자열 Bubble Sorting.
		for(j = 0; j < 9 - i; j++){
			if(strcmp(names_tmp[j],names_tmp[j + 1]) > 0){//인접한 두 문자열을 비교할때 strcmp 사용. 양수를 반환하면 첫번째 문자열이 더 큰 경우이다.
				strcpy(tmp,names[j]);                //문자열 임시 저장.
  				strcpy(names[j],names[j + 1]);       //두번째 문자열을 첫번째 자리로 옮김.
  				strcpy(names[j + 1],tmp);            //임시로 저장해둔 문자열을 두번쨰 자리로 옮김. 결과 : 두 문자열의 위치를 서로 바꿈.
  				
  				/*names 는 물론, names_tmp 에 있는 문자열도 동시에 Sorting 해 주어야 한다. 
				그래야 위 if 문 조건문이 배열을 제대로 검사할 수 있다. */
  				strcpy(tmp2,names_tmp[j]);
  				strcpy(names_tmp[j],names_tmp[j + 1]);
  				strcpy(names_tmp[j + 1],tmp2);
			}
		}
	}
	
	printf("\nSorted Result\n");
	for(j = 0; j < 10; j++){//Sorting 된 names 배열을 출력한다. 
		printf("%5s ",names[j]);
	}
	
	return 0;
}
