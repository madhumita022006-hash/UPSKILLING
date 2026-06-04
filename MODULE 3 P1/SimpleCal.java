import java.util.*;
public class SimpleCal {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter two numbers:");
		int a=sc.nextInt();
		int b=sc.nextInt();
		sc.nextLine();
		System.out.println("Choose an operation(ADD/SUB/MUL/DIV):");
		String c= sc.nextLine();
		if(c.equals("ADD")) {
			System.out.println(a+b);
		}else if(c.equals("SUB")) {
			System.out.println(a-b);
		}else if(c.equals("MUL")) {
			System.out.println(a*b);
		}else if(c.equals("DIV")) {
			System.out.println(a/b);
		}

	}

}
