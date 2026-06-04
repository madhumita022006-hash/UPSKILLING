import java.util.*;
import java.io.*;
public class Fliew {
	public static void main(String[] args)throws IOException {
		Scanner sc= new Scanner(System.in);
		System.out.println("Enter the details that you want store :");
		String a = sc.nextLine();
		FileWriter fw = new FileWriter("file.txt");
		fw.write(a);
		fw.close();
		System.out.println("The data has been stored successfully!");
	}

}
