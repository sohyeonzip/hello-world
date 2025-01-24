package Practice;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Exercise05_08 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int itemCount = 3; //항목이 몇 개인지
		int price = 0;

		titlePrint(); //영수증 맨 위 타이틀 인쇄
		timeStamp(); //출력시간 인쇄
		headerPrint(); //헤더(상품명, 단가, 수량, 금액) 인쇄
		
		for(int i = 0; i < itemCount; i++) {
			price += itemPrint(i);
		}
		
		totalPrint(price); //합계 세액 등을 인쇄
	}

	public static void titlePrint() {
		// TODO Auto-generated method stub
		System.out.println("\t\t\"국민가게, 다이소\"");
		System.out.println("(주)아성다이소_분당서현점");
		System.out.println("전화: 031-702-6016");
		System.out.println("본사: 서울 강남구 남부순환로 2748 (도곡동)");
		System.out.println("대표: 박정부, 신효섭 213-81-52063");
		System.out.println("매장: 경기도 성남시 분당구 분당로 53번길 11(서현동)");
		System.out.println("==============================================");
		System.out.println("\t    소비자중심경영(CCM) 인증기업");
		System.out.println("\t  ISO 9001 품질경영시스템 인증기업");
		System.out.println("==============================================");
		System.out.println("\t   교환/환불 14일(3월12일)이내,");
		System.out.println("     (전자)영수증, 결제카드 지참 후 구입매장에서 가능");
		System.out.println("\t  포장/가격 택 훼손시 교환/환불 불가");
		System.out.println("\t   체크카드 취소 시 최대 7일 소요");
		System.out.println("==============================================");
	}
	
	public static void timeStamp() {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss"));
		System.out.println("[POS 1058231]\t\t" + formatedNow);
		System.out.println("==============================================");
	}
	
	public static void headerPrint() {
		// TODO Auto-generated method stub
		System.out.println("상품명\t\t\t단가     수량        금액");
		System.out.println("==============================================");
	}
	
	public static int itemPrint(int i) {
		// TODO Auto-generated method stub
		String item_name1 = "퓨어에어 비말차단용마스크(최고급형)";
		String item_code1 = "1031615";
		int item_price1 = 3000;
		int item_amount1 = 1;
		
		String item_name2 = "슬라이드식명찰(가로형)(100호)";
		String item_code2 = "11008152";
		int item_price2 = 1000;
		int item_amount2 = 1;
		
		String item_name3 = "매직흡착 인테리어후크(알류미늄타입)";
		String item_code3 = "1020800";
		int item_price3 = 1000;
		int item_amount3 = 1;
		
		String[] item_name = {item_name1, item_name2, item_name3};
		String[] item_code = {item_code1, item_code2, item_code3};
		int[] item_price = {item_price1, item_price2, item_price3};
		int[] item_amount = {item_amount1, item_amount2, item_amount3};
		
		int sum = 0;
		sum += (item_price[i] * item_amount[i]);
		
		DecimalFormat df = new DecimalFormat("###,###");
		System.out.println(item_name[i] + ("\t"	+ df.format(item_price[i]) + "    " + item_amount[i] + "      " + df.format(item_price[i] * item_amount[i])));
		System.out.println("[" + item_code[i] + "]");

		return sum;
	}
	
	public static void totalPrint(int price) {
		// TODO Auto-generated method stub
		DecimalFormat df = new DecimalFormat("###,###");
		System.out.println("\t\t과세합계\t\t\t" + df.format(price * 0.9));
		System.out.println("\t\t 부과세\t\t\t  " + df.format(price * 0.1));
		System.out.println("----------------------------------------------");
		System.out.println("판매합계\t\t\t\t\t" + df.format(price));
	}

}
