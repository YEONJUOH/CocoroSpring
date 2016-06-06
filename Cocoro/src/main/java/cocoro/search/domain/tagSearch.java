package cocoro.search.domain;

public class tagSearch {

	private String searchCtg;
	private String searchWord;
	private int start;
	private int end;
	
	public tagSearch(String searchCtg, String searchWord, int start, int end) {
		super();
		this.searchCtg = searchCtg;
		setSearchWord(searchWord);
		this.start = start;
		this.end = end;
	}
	
	public String getSearchCtg() {
		return searchCtg;
	}
	public void setSearchCtg(String searchCtg) {
		this.searchCtg = searchCtg;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		String str  = "%"+searchWord +"%";
		this.searchWord = str;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
}
