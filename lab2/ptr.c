#include <stdio.h>

int zero[4] = {0, 0, 0, 0};
int one[4] = {1, 0, 0, 0};

void copy_BCD(int *x, int *s)
{
    // func_cpBCD:
    x = s;
    // int i=0;
    // for1: *x = *s;
    //     x++;s++;i++;
    //     if(i<4) goto for1;    
    
};

void square_digit(int *dd, int d)
{
    //go to func_copy BCD with dd and zero stored zero is a ptr to memory
    copy_BCD(dd, zero);
    
    (*dd) = d*d;
    
    
    int*dd1 = dd +1;
    w1: (*dd)-=10;
        (*dd1)++;//or *(dd + 1)++;
    if((*dd)>9) goto w1;
    
};

void add_BCD(int *x, int *y, int *z)
{
    int c = 0;
    int i = 0;
    for2addBCD:(*x) = (*y) + (*z) +c;
                c = 0;
                if( !((*x)>9) ) goto incPtr; //have it has not to execute in assebly
                (*x) -= 10 ;
                c = 1;
    incPtr :    x++;y++;z++;i++;
                if(i<4) goto for2addBCD;

};
void sum_square(int *s, int *x)
{
    int dd[4];
    //how to do above thing in assembly
    
    //go to func_copy BCD with dd and zero stored zero is a ptr to memory
    copy_BCD(s, zero);

    int i=0;
    forSumSquare: square_digit(dd,*x);
                add_BCD( s , s, dd);//copy values in reg andd then
                x++;i++;
        if(i<4) goto forSumSquare;

};
int check_gt_1(int *x)
{
    //how to do this in assembly
    // logical or of *x , *(++x) , *(++x) ?signed of unsigned comparison ?
    return ((x[1] | x[2] | x[3]) > 0);
};
int check_happy(int x)
{
    // how to return this in assembly code ?
    return (x == 1 || x == 7);
};