//
//  main.c
//  mostFrequentCharacter
//
//  Created by legr on 02/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

#include <stdio.h>
#include <map>

char mostFrequentCharacter(char* str, int size){
    char ch;
    ch = 'a';
    return ch;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    char str[10] = "werwesdfae";
    char ch = mostFrequentCharacter(str, 10);
    printf("Legnth of string is %lu\n", sizeof(str));
    printf("Given string is %s\n", str);
    printf("Most Friquetn Character is %c\n", ch);
    return 0;
}
