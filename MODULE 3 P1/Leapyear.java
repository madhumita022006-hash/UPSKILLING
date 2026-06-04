import java.util.*;
public class Leapyear {
	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		System.out.print("Enter a year:");
		int year = s.nextInt();
		if(year % 4 == 0) {
		    if(year % 100 == 0) {
		        if(year % 400 == 0) {
		            System.out.println("Leap Year");
		        } else {
		            System.out.println("Not a Leap Year");
		        }
		    } else {
		        System.out.println("Leap Year");
		    }
		} else {
		    System.out.println("Not a Leap Year");
		}
	}
}

