package Practice;

import java.util.Scanner;

public class Exercise06_11 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int myNum[] = new int[6];
		int lottoNum[] = new int[7];
		boolean flag = true;
		
		while(flag) {
			System.out.println("로또 번호를 입력하세요");
			for (int i = 0; i < myNum.length; i++) { // 로또 신청
				myNum[i] = s.nextInt();
			}
			
			if (!(duplCheck(myNum, flag))) { // 중복 없는 경우에만 실행
				flag = false; 				 // 재반복하지 않도록 false
				generateNum(lottoNum);
				
				// 등수 출력
				System.out.println("추첨 결과 : " + ranking(myNum, lottoNum) + " 입니다.");
			}
			
		}
	}
	
	public static void generateNum(int[] lottoNum) {
		System.out.print("로또 당첨 번호 : ");
		for (int i = 0; i < lottoNum.length; i++) {
			lottoNum[i] = (int) (Math.random() * 1000 % 45 + 1);
			
			if (i == 6) System.out.print("보너스+");
			System.out.print(lottoNum[i] + " ");
		}
		System.out.println();
	}
	
	public static boolean duplCheck(int[] myNum, boolean flag) {
		for (int i = 0; i < myNum.length - 1; i++) { // 한 요소마다 중복 체크
			for (int j = i+1; j < myNum.length; j++) {
				if (myNum[i] > 45) {
					System.out.println("45이하 값으로 다시 적어주세요.");
					return true;
				}
				if (myNum[i] == myNum[j]) {
					System.out.println("중복 값은 입력할 수 없습니다. 다시 입력해주세요.");
					return true;
				}
			}
		}
		return false;
	}
	
	public static String ranking(int[] myNum, int[] lottoNum) {
		String[] rank = {"꽝", "꽝", "꽝", "5등", "4등", "3등", "1등", "2등"};
		int correct = 0, bonus = 0;
		for (int i = 0; i < myNum.length; i++) {
			for (int j = 0; j < lottoNum.length-1; j++) {
				if (myNum[i] == lottoNum[6]) bonus = 1;
				if (myNum[i] == lottoNum[j]) correct++;
			}
		}
		if (correct == 5) {
			if (bonus == 1) return rank[6];
		}
		return rank[correct];
	}

	
	
}
