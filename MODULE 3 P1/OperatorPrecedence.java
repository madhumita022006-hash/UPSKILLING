
public class OperatorPrecedence {
	public static void main(String[] args) {
		int a = 10+5*2;
		int b = (10+5)*2;
		int c = (10/5)+3;
		int d = 10-5/2;
		System.out.println(a);   //20
        System.out.println(b);   //30
        System.out.println(c);
        System.out.println(d);
        
        //order
        //()
        //*,/,%
        //+,-
        //=
	}

}
