
class Animal{
	void makeSound() {
		System.out.println("Animal makes sound");
	}
}class Dog extends Animal{
	void makeSound() {
		System.out.println("Bark");
	}
}



public class AnimalCase {
	public static void main(String[] args) {
		Animal obj1 = new Animal();
		obj1.makeSound();
		Dog obj2=new Dog();
		obj2.makeSound();

	}

}
