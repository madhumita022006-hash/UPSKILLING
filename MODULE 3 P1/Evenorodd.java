import java.util.*;
public class Evenorodd {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("Enter a value:");
		int a= s.nextInt();
		if(a%2==0) {
			System.out.println("The entered value is even");
		}
		else {
			System.out.println("The entered value is odd");
		}

	}
}
