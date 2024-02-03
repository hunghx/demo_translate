package xamp;

public class Answer {
    private String dapAn;
    private boolean isTrue;

    public Answer() {
    }

    public Answer(String dapAn, boolean isTrue) {
        this.dapAn = dapAn;
        this.isTrue = isTrue;
    }
    public String getDapAn() {
        return dapAn;
    }
    public void setDapAn(String dapAn) {
        this.dapAn = dapAn;
    }
    public boolean isTrue() {
        return isTrue;
    }
    public void setTrue(boolean isTrue) {
        this.isTrue = isTrue;
    }


}