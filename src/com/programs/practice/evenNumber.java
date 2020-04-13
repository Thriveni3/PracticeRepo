package com.programs.practice;

import java.util.Scanner;

public class evenNumber {
	
 public static void main(String[] args) {
	 

	 Scanner num = new Scanner(System.in);
	 System.out.println("Enter the Number");
     int val = num.nextInt();
     System.out.println("Print the even numbers between 1 and " +val);     
      
	 for(int i=1; i<=val; i++)
	 { if (i % 2 == 0)
		  {System.out.println(+i);		 
		  }
	 }
	 
	 
 }
}
