import java.util.*;
public class Calculator {
	public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	System.out.print("Enter you marks out of 100:");
	int a = sc.nextInt();
	System.out.print("You Grade is : ");
	if(a>=90 && a <=100) {
		System.out.print("A");
	}else if(a>=80 && a<=89) {
		System.out.print("B");
	}else if(a>=70 && a<=79) {
		System.out.print("C");
	}else if(a>=60 && a<=69) {
		System.out.print("D");
	}else {
		System.out.print("F");
	}

	}
}
