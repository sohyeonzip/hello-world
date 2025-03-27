package Practice;

public class Exercise07_07 {
	public static void main(String[] args) {
		// 이 값을 주는 만큼 저장소 생성
		int person = 10;
		
		// 생성자의 숫자를 준 만큼 배열 생성
		InputData inData = new InputData(person);
		
		// 입력데이터 생성
		for (int i = 0; i < person; i++) {
			String name = "홍길" + i;
			int kor = (int)(Math.random() * 100);
			int eng = (int)(Math.random() * 100);
			int mat = (int)(Math.random() * 100);
			inData.setData(i, name, kor, eng, mat);
		}
		
		for(int i = 0; i < person; i++) {
			System.out.println("번호: " + i +" 이름: " + inData.name[i] + " 국어: " + inData.kor[i] + " 영어: " + inData.eng[i] 
							 + " 수학: " + inData.mat[i] + " 총점: " + inData.sum[i] +" 평균: " +inData.avg[i]);
		}
	}
}
