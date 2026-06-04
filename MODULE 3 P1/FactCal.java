import java.util.*;	
	public class FactCal {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a non-negative value:");
		int n1 = sc.nextInt();
		int facto = 1; 
        for(int i=1;i<=n1;i++) {
        	facto = facto*i;
        }
        System.out.println(facto);
	}
}
