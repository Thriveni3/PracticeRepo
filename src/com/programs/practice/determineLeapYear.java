package com.programs.practice;

import java.util.Scanner;

public class determineLeapYear {
	
	public static void main(String[] args) {
		
		
		Scanner year = new Scanner(System.in);
		System.out.println("Enter the Year: ");
		int y = year.nextInt();
	    
	    if ((y%400 == 0) || ((y%4 == 0) && (y%100 !=0)))
	    		{ System.out.println(+y +  "is leap year"); }
	    
	    else
	    	
	    	{System.out.println(+y  + "is not a leap year");}
	    		
	}

}
