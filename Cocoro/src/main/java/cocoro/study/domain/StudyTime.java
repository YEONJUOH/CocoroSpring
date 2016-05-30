package cocoro.study.domain;

import java.sql.Timestamp;

public class StudyTime {
	
	private int t_id; 
	private int s_id;
	private String t_day; // 제약조건 알파벳 3글자 , (sun, mon, tue, wed, thu, fri, sat)
	private Timestamp t_start;
	private Timestamp t_end;
	
}
