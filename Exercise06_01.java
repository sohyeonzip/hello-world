package Practice;

import java.util.Scanner;

public class Exercise06_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] student = new int[5];
		Scanner scan = new Scanner(System.in);
		int sum = 0;
		double aver;
		for(int index = 0; index < student.length; index++)
		{
			System.out.print((index + 1) + "번 학생의 국어 점수: ");
			student[index] = scan.nextInt();
			sum += student[index];
		}
		aver = (sum/5.0);
		System.out.println("합계: " + sum);
		System.out.println("평균: " + aver);
	}

}
