package cocoro.search.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class Search {

	private String searchCtg;
	private String searchWord;
	private String keyWords;

	private String mentorFilter;
	private String com_filter;

	private String locCheck;

	private double lat;
	private double lng;

	private String timeCheck;
	private String startTime;
	private String endTime;
    private int startT;
    private int endT;
	
	
	private String levelCheck;
	private int level;

	private String tutorCheck;

	
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
		this.searchWord = searchWord;
		this.keyWords = tokeyWords(searchWord);

	}

	public String tokeyWords(String searchWord) {
		String str = searchWord.replace(" ", "");
		char[] arr = str.toCharArray();
		String resultStr = "%";
		for (int i = 0; i < arr.length; i++) {
			resultStr += arr[i] + "%";
		}

		return resultStr;
	}

	public String getMentorFilter() {
		return mentorFilter;
	}

	public void setMentorFilter(String mentorFilter) {
		this.mentorFilter = mentorFilter;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {

		int sTime = 0;

		if (startTime != null) {
			String ap = "";
			int mint = 0;
			int hour = 0;
			String startT = startTime.replace("12", "0");

			if (startT.length() == 7) {
				// 10:10am
				ap = startT.substring(5);
				mint = Integer.parseInt(startT.substring(3, 5));
				hour = Integer.parseInt(startT.substring(0, 2));

			} else if (startT.length() == 6) {
				// 8:40pm
				ap = startT.substring(4);
				mint = Integer.parseInt(startT.substring(2, 4));
				hour = Integer.parseInt(startT.substring(0, 1));

			}

			if (ap.equals("am")) {
				sTime = 60 * hour + mint;
			} else if (ap.equals("pm")) {

				sTime = 12 * 60 + 60 * hour + mint;
			}

		}

		this.startT = sTime;
		this.startTime =startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime){
		 System.out.println("I'm here");
		int eTime = 0;

		if (endTime != null) {
			String ap = "";
			int mint = 0;
			int hour = 0;
			String endT = endTime.replace("12", "0");

			if (endT.length() == 7) {
				// 10:10am
				ap = endT.substring(5);
				mint = Integer.parseInt(endT.substring(3, 5));
				hour = Integer.parseInt(endT.substring(0, 2));

			} else if (endT.length() == 6) {
				// 8:40pm
				ap = endT.substring(4);
				mint = Integer.parseInt(endT.substring(2, 4));
				hour = Integer.parseInt(endT.substring(0, 1));

			}

			if (ap.equals("am")) {
				eTime = 60 * hour + mint;
			} else if (ap.equals("pm")) {

				eTime = 12 * 60 + 60 * hour + mint;
			}

		}

		this.endT = eTime;
		this.endTime = endTime;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getTutorCheck() {
		return tutorCheck;
	}

	public void setTutorCheck(String tutorCheck) {
	      
		this.tutorCheck = tutorCheck;

	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public String getLocCheck() {
		return locCheck;
	}

	public void setLocCheck(String locCheck) {
		this.locCheck = locCheck;

	}

	public String getTimeCheck() {
		return timeCheck;
	}

	public void setTimeCheck(String timeCheck) {
		this.timeCheck = timeCheck;

	}

	public String getLevelCheck() {
		return levelCheck;
	}

	public void setLevelCheck(String levelCheck) {
		this.levelCheck = levelCheck;

	}
	
	
	

	public int getStartT() {
		return startT;
	}

	public int getEndT() {
		return endT;
	}
	
	

	public String getCom_filter() {
		return com_filter;
	}

	public void setCom_filter(String com_filter) {
		this.com_filter = com_filter;
	}

	@Override
	public String toString() {
		return "Search [searchCtg=" + searchCtg + ", searchWord=" + searchWord
				+ ", keyWords=" + keyWords + ", mentorFilter=" + mentorFilter
				+ ", com_filter=" + com_filter + ", locCheck=" + locCheck
				+ ", lat=" + lat + ", lng=" + lng + ", timeCheck=" + timeCheck
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", startT=" + startT + ", endT=" + endT + ", levelCheck="
				+ levelCheck + ", level=" + level + ", tutorCheck="
				+ tutorCheck + "]";
	}


}
