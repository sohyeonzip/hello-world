package Practice;

import java.util.Scanner;

public class Exercise06_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] student = new int[5][3];
		Scanner scan = new Scanner(System.in);
		int sum = 0;
		double aver;
		for(int index = 0; index < student.length; index++)
		{
			System.out.print((index + 1) + "번 학생의 국어 점수:");
			student[index][0] = scan.nextInt();
			System.out.print((index + 1) + "번 학생의 영어 점수:");
			student[index][1] = scan.nextInt();
			System.out.print((index + 1) + "번 학생의 수학 점수:");
			student[index][2] = scan.nextInt();
			System.out.println();
		}
		for(int index = 0; index < student.length; index++)
		{
			sum = 0;
			aver = 0.0;
			for(int subject = 0; subject < student[index].length; subject++)
			{
				sum += student[index][subject];
				aver = (double)sum / (double)student[index].length;				
			}
			System.out.print((index + 1) + "번 학생의 총점: " + sum + ", ");
			System.out.print((index + 1) + "번 학생의 평균: ");
			System.out.format("%05f\n",aver);
		}		
	}

}
