import java.util.*;
public class TryCatchCase {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the first value");
		int a = sc.nextInt();
		System.out.println("Enter the second value");
		int b = sc.nextInt();
		try {
			System.out.print(a/b);
		}
		catch(ArithmeticException e) {
			System.out.print(e);
		}

	}

}
