import java.io.*;
public class Fileread {
	public static void main(String[] args)throws IOException {
		FileReader fr = new FileReader("file.txt");
		int ch;
		while((ch = fr.read())!=-1) {
			System.out.print((char)ch);
		}
		fr.close();
	}
}
