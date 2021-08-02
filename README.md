# MIPS_grader
When you enter the marks then program will give a grade according to the marks.

This is an application code to get grades according to the marks. This is MIPS processer code.
The equialent high-level code(C++) is like this,

#include <iostream.h>
int main(){
  int marks;
  char grade = 'D';
  cout<<"Enter your marks: ";
  cin>>marks;
  if(marks >= 70)
    grade = 'A';
   else if(marks >= 60)
    grade = 'B';
   else if(marks >= 50)
    grade = 'C';
   cout<<"\nYour grade is "<<grade;
   return 0;
}



