import java.util.Scanner;
public class Palindromechecker {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a string");
		String str = sc.nextLine().toLowerCase();
		String rev = "";
		for(int i=str.length()-1;i>=0;i--) {
			rev = rev+str.charAt(i);
		}
		if(str.equals(rev)) {
			System.out.println("Palindrome");
		}
		else {
			System.out.println("Not a plaindrome");
		}
	}
}
