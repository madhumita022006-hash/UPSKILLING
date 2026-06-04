import java.util.*;
public class Hashmap {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		HashMap<Integer, String> map = new HashMap<>();
		System.out.println("Enter the number of entries");
		int n = sc.nextInt();
		for(int i = 0 ; i< n;i++) {
			System.out.println("Enter the ID for students:");
			int id = sc.nextInt();
			sc.nextLine();
			System.out.println("Enter Student name:");
			String name = sc.nextLine();
	        map.put(id,name);
		}
		System.out.println("Enter ID to search:");
		int sID = sc.nextInt();
		System.out.println("Student Name:"+ map.get(sID));
	}
}
