#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	//char str[50] = "Multi Campus.";
	//char str[50] = "Hello World!";
	//char str[50] = "PLAYERUNKNOWN'S BATTLEGROUNDS";
	//char str[50] = "NAMUWIKI";//1)문자열이 모두 대문자인 경우. 
	//char str[50] = "nokia";//2)문자열이 모두 소문자인 경우. 
	char str[50] = "Save Money until you have 1000 dollar";
	char *ptr;//포인터 변수 선언.
	int i,j;
	
	printf("before : ");
	for(i = 0; i < 50; i++){  //문자열 출력.
		ptr = &str[i];        //배열의 각 요소들의 주소값을 포인터 변수에 담아 준다.
		printf("%c",*ptr);    //포인터 배열(ptr) 에 담긴 주소값을 참조하여 출력한다.
	}
	printf("\n\n");
	
	printf("after : ");
	for(j = 0; j < 50; j++){//str 배열의 모든 문자를 검사하고 처리해야 하므로 50번 반복한다.
		ptr = &str[j];//배열의 각 요소들의 주소값을 포인터 변수에 담아 준다.
		
		/*아스키 코드에서 대문자와 소문자와의 차이는 십진수로 32 이다.
		대문자 보다 소문자가 더 크므로 대문자일 경우 32를 더하고 
		소문자일 경우 32를 뺀 후 출력하면 대소문자를 반전 할 수 있다.*/
		
		if(*ptr >= 'A' && *ptr <= 'Z'){         //대문자일때 이때 *ptr 은 현재 ptr 포인터 변수에 있는 주소값을 참조한 것이다. 
		    printf("%c",*ptr + 32);
		    
		}else if(*ptr >= 'a' && *ptr <= 'z'){   //소문자일때. 
			printf("%c",*ptr - 32);
			
		}else if(*ptr >= '0' && *ptr <= '9'){   //숫자일떄. 
			printf("%c",*ptr);
			
		}else{                                  //기타 문자.
			printf("%c",*ptr);
		}
		
	}
	
	
	return 0;
}
