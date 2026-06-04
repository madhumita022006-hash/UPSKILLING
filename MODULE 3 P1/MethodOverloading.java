class A{
	int add(int a,int b) {
		return a+b;
	}
	double add(double a, double b) {
		return a+b;
	}
	int add(int a, int b,int c) {
		return a+b+c;
	}
}
public class MethodOverloading {
	public static void main(String[] args) {
		A obj = new A();
		System.out.println(obj.add(12.5,7.3));
        System.out.println(obj.add(34,17));
        System.out.println(obj.add(13,45,67));
	}
}
