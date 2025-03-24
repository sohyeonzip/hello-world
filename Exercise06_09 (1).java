package Practice;

public class Exercise06_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = "Ko2re4a0Po4ly4te2chn9ic3";
		char[] ch = new char[str.length()];
		String result = "";

		for(int i = 0 ; i < str.length(); i++)
		{
			ch[i] = str.charAt(i);
			if(ch[i] >= 'a' && ch[i] <= 'z' || ch[i] >= 'A' && ch[i] <= 'Z')
			{
				result += ch[i];
			}
		}
		System.out.println("result: " + result);
	}

}
