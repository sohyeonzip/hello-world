package Practice;

public class Exercise07_08 {
	public static void main(String[] args) {
		int person = 30;
		InputData inData = new InputData(person);
		
		for (int i = 0; i < person; i++) {
			String name;
			if (i < 9) name = "홍길0" + (i+1); // 번호 1번부터 시작
			else name = "홍길" + (i+1);
			
			int kor = (int)(Math.random() * 100);
			int eng = (int)(Math.random() * 100);
			int mat = (int)(Math.random() * 100);
			inData.setData(i, name, kor, eng, mat);
		}
		
		inData.printInfo();
		inData.printThirty();
		inData.summThirty();			
	}
}
