package xamp;

public class checkLogic {

	public String execute(dayOfWeek name) {
		String ten = name.getName();
		if (ten.contains("曜日")) {
            name.setName(ten);
            return "success";
        } else {
            return "エール。もう一回入力してください。";
        }
	}
}
