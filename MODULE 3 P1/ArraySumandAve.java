import java.util.*;
public class ArraySumandAve {
	public static void main(String[] args) {
		Scanner sc= new Scanner(System.in);
		System.out.println("Enter the number of elements you want:");
		int a =sc.nextInt();
		int sum=0;
		int[] arr=new int [a];
		System.out.println("Enter the elements:");
		for(int i=0;i<a;i++) {
			arr[i]=sc.nextInt();
		}
		for(int i=0;i<a;i++) {
			sum=sum+arr[i];
			System.out.println(arr[i]);
		}
		System.out.println(sum);
		System.out.println(sum/a);
	}

}
