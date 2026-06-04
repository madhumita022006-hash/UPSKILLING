import java.util.Scanner;
public class Guessgame {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num = (int)(Math.random() * 100) + 1;
		while(true) {
			System.out.println("Guess The number:");
			int guess = sc.nextInt();
			if(guess > num) {
				System.out.println("Too high");
			}
			else if(guess < num) {
				System.out.println("Too low");
			}
			else {
				System.out.println("Awesome! your guess is correct");
				break;
			}
		}
	}

}
