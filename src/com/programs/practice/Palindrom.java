package com.programs.practice;

import java.util.Scanner;

public class Palindrom {
	
	public static void main(String[] args) {
		
		
		Scanner num = new Scanner(System.in);
		
		System.out.println("Enter the number");
		int num1 = num.nextInt();
		
		int temp, r, sum = 0;
		
		temp = num1;
		
		while(num1>0) {
			
			r = num1 % 10;
			sum = (sum * 10) + r;
			num1 = num1/10;
			
		}
		
		if (sum == temp)
			
			System.out.println("Number is palindrome: " +sum);
		
		else
			
			System.out.println("Number is not palindrome" +temp);
		
	}

}
