package DataClass;

public class ReviewData {
	private int SEQ;
	private String USER_ID;
	private String TITLE;
	private String COMMENT_TITLE;
	private String COMMENT;
	private String DATA;
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getCOMMENT_TITLE() {
		return COMMENT_TITLE;
	}
	public void setCOMMENT_TITLE(String cOMMENT_TITLE) {
		COMMENT_TITLE = cOMMENT_TITLE;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
	public int getSEQ() {
		return SEQ;
	}
	public void setSEQ(int sEQ) {
		SEQ = sEQ;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getDATA() {
		return DATA;
	}
	public void setDATA(String dATA) {
		DATA = dATA;
	}
}
