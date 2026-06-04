import java.util.*;
public class Arrlist {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the number of names you want to add:");
		int a = sc.nextInt();
		sc.nextLine();
		System.out.println("Enter the name/names:");
		for(int i=0;i<a;i++) {
			String name = sc.nextLine();
			list.add(name);
		}
		System.out.println("The names that are stored in list:");
		for(String name:list) {
			System.out.println(name);
		}
	}
}
