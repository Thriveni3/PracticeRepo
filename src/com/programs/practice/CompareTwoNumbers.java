package com.programs.practice;

import java.util.Scanner;
import java.util.*;

public class CompareTwoNumbers { 
	
	public static void main(String[] args) {
		
		Scanner nu = new Scanner(System.in);	
		
		System.out.println("Enter the Number 1:");	
		int n1 = nu.nextInt();
		
		System.out.println("Enter the Number 2:");
		int n2 = nu.nextInt();
		
		if (n1>n2)
			
		{	System.out.println("Number 1 is greater" +n2); }
		else if (n2>n1)
			
		{	System.out.println("Number 2 is greater" +n1); }
		
		else
			
			System.out.println("Numbers are equal");
		
	}

}
