class MyThread1 extends Thread {
	public void run() {
        for(int i=1;i<=5;i++) {
            System.out.println("Thread 1 Running");
        }
    }
}
class MyThread2 extends Thread {
    public void run() {
        for(int i=1;i<=5;i++) {
            System.out.println("Thread 2 Running");
        }
    }
}
public class ThreadCre {
    public static void main(String[] args) {
        MyThread1 t1 = new MyThread1();
        MyThread2 t2 = new MyThread2();
        t1.start();
        t2.start();
    }
}
