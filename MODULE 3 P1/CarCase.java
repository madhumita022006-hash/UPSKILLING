class Car {
    String make;
    String model;
    int year;
	void displayDetails() {
		System.out.println("Make: "+make);
		System.out.println("Model: "+model);
		System.out.println("Year: "+year);
	}
}
public class CarCase {
	public static void main(String[] args) {
		Car c=new Car();
		c.make = "Hundai";
		c.model = "Creta";
		c.year = 2026;
		
		c.displayDetails();
	}
}

