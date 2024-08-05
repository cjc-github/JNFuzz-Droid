#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

void swap(int *ap, int *bp)
{
    int temp = *ap;
    *ap = *bp;
    *bp = temp;
}

void bubbleSort()
{
    int arr[50] = {49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0};
    int size=50;
    int i,j;
    for(i = 0; i < size; i++)
    {
        for(j = 0; j < size-i-1; j++)
        {
            if(arr[j] > arr[j+1])
                swap(&arr[j], &arr[j+1]);
        }
    }
    for(i = 0; i < 50 ; i++)
    {
    	printf("%d",arr[i]);
        //LOGI("%d ",arr[i]);
    }
}

int main()
{
    bubbleSort();
}
