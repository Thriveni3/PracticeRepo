package com.programs.practice;

import java.util.HashMap;

import java.util.Map;

public class HashMapEx {
	
  public static void main(String[] args) {

	HashMap<Integer, String> map = new HashMap<Integer, String>();

	map.put(100, "Mumbai");

	map.put(101, "Delhi");

	map.put(102, "Pune");

	// Add Element
map.put(103, "Surat");

	// Size of map
System.out.println(map.size());

	// clears hashmap , removes all element
map.clear();

	// Remove element from hashmap
	map.remove(100);

	// Checking if HashMap is empty
	System.out.println("Is HashMap is empty: " + map.isEmpty());

	for (Map.Entry m : map.entrySet()) {

	System.out.println(m.getKey() + " " + m.getValue()); 
	
	}

}        
}