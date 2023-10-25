#include<stdio.h>
#include<unistd.h>
#include <time.h>
int main()
{
    while(1)
    {
        time_t currentTime;
        char *timeString;

        time(&currentTime);
        timeString = ctime(&currentTime);

        printf(timeString);
        printf("\n");          
        fflush(stdout);
        sleep(1);
    }
}