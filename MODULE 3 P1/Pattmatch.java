
public class Pattmatch {
	static void checkType(Object obj) {
        switch(obj) {
            case Integer i ->
                System.out.println("Integer Value: "+i);
            case String s ->
                System.out.println("String Value: "+s);
            case Double d ->
                System.out.println("Double Value: "+d);
            default ->
                System.out.println("Unknown Type");
        }
    }
    public static void main(String[] args) {
        checkType(10);
        checkType("Hello");
        checkType(5.6);
        checkType(true);
    }
}
