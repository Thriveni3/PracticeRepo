package com.programs.practice;

import java.util.Scanner;

public class Factorial {
	
	public static void main(String[] args) {
		
		int i, num;
		
		Scanner n = new Scanner(System.in);
		System.out.println("Enter the number");
		num = n.nextInt();
		int fact = num;
		
		for(i=(num-1); i>1; i--)
		{
			fact = fact* i;
		}
		
		System.out.println("Factorial of the number is:" +fact );
		
	}

}
