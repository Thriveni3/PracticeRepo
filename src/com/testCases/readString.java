package com.testCases;
import java.util.Scanner;

public class readString {

	    public static void main (String[] args) {

	        String str = "";
	        System.out.println("Enter a string");
	        Scanner scanner = new Scanner(System.in);
	        String original = scanner.nextLine();
	        int stlength = original.length();
	        for(int i=stlength-1; i>=0; i--)
	        str = str + original.charAt(i);
	        System.out.println("reverse string  " + str);

	    }
	}
