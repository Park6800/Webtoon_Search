package DataClass;

public class CountData {
	private String ID;
	private String TITLE;
	private String LIKE;
	private int CLICK;
	private int COUNT;
	public String getID() {
		return ID;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String TITLE) {
		this.TITLE = TITLE;
	}
	public String getLIKE() {
		return LIKE;
	}
	public void setLIKE(String LIKE) {
		this.LIKE = LIKE;
	}
	public int getCLICK() {
		return CLICK;
	}
	public void setCLICK(int CLICK) {
		this.CLICK = CLICK;
	}
	
	private String DAY;
	private String GENRE;
	private String STORY_AUTHOR;
	private String ART_AUTHOR;
	private String COMPANY;
	private String URL;
	
	public String getDAY() {
		return DAY;
	}
	public void setDAY(String dAY) {
		DAY = dAY;
	}
	public String getGENRE() {
		return GENRE;
	}
	public void setGENRE(String gENRE) {
		GENRE = gENRE;
	}
	public String getSTORY_AUTHOR() {
		return STORY_AUTHOR;
	}
	public void setSTORY_AUTHOR(String sTORY_AUTHOR) {
		STORY_AUTHOR = sTORY_AUTHOR;
	}
	public String getART_AUTHOR() {
		return ART_AUTHOR;
	}
	public void setART_AUTHOR(String aRT_AUTHOR) {
		ART_AUTHOR = aRT_AUTHOR;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
}
