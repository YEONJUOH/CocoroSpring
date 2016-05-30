package cocoro.study.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class StudyGroup implements Serializable {

   private int s_id;
   private String s_name;
   private String s_intro;
   private int s_leader_id;
   
   private String s_fix_member; // 스터디원 모집을 종료 yes or no (T면 yes, F면 no)
   private String s_start;
   private String s_end;

   private String s_attend_check; // T or F
   private int s_abil_check; // 0 
   private double s_location_x;
   private double s_location_y;
   private String s_online; // T or F
   private String s_offline; // T or F
   private String s_mento_check; // T or F
   private String s_kind_check; // T or F (스터디의 종류 선택, 폐쇄 or개방. 폐쇄면 T)
   private String s_time_check; // T or F
   private int s_deposit; // 0 이상이면 디파짓기능 사용, -1은 사용안함
   private String s_last_act;
   private String s_tag; // 스터디의 관심사
   private int s_recent_hit;
   private int s_total_hit;
   private String s_history;
   
   
   //추가 및 수정 사항
   private double s_avg_abil;
   private String s_address;
   private int s_t_start;
   private int s_t_end;
   private String s_max_member; // 스터디 참여가능 인원수
   
   
   
   public StudyGroup() {
      super();
   }

//   SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy-MM-dd"); 
   
   private List<String> attr=new ArrayList<String>();//가지고 있는 속성을 리스트로 표현한 변수 

   public int getS_id() {
      return s_id;
   }

   public void setS_id(int s_id) {
      this.s_id = s_id;
   }

   public String getS_name() {
      return s_name;
   }

   public void setS_name(String s_name) {
      this.s_name = s_name;
   }

   public String getS_intro() {
      return s_intro;
   }

   public void setS_intro(String s_intro) {
      this.s_intro = s_intro;
   }

   public int getS_leader_id() {
      return s_leader_id;
   }

   public void setS_leader_id(int s_leader_id) {
      this.s_leader_id = s_leader_id;
   }

   

   public String getS_fix_member() {
      return s_fix_member;
   }

   public void setS_fix_member(String s_fix_member) {
      this.s_fix_member = s_fix_member;
   }

   public String getS_start() {
      return s_start;
   }

   public void setS_start(String s_start) {
    String str = s_start.substring(0,10);
      this.s_start = str;
   }

   public String getS_end() {
   
      return s_end;
   }
   



   public void setS_end(String s_end) {
      String str = s_end.substring(0,10);
      this.s_end = str;
   }

   public String getS_attend_check() {
      return s_attend_check;
      
   }

    

   public int getS_t_start() {
      return s_t_start;
   }

   public void setS_t_start(int s_t_start) {
      this.s_t_start = s_t_start;
   }

   public int getS_t_end(){
      return s_t_end;
   }

   public void setS_t_end(int s_t_end) {
      this.s_t_end = s_t_end;
   }

   public String getS_max_member() {
      return s_max_member;
   }

   public void setS_max_member(String s_max_member) {
      this.s_max_member= s_max_member;
      if(s_max_member!=null)
      attr.add("모집인원:"+s_max_member);
   }

   public void setS_attend_check(String s_attend_check) {
      this.s_attend_check = s_attend_check;
      if(s_attend_check.equals("T"))
      attr.add("출석");
   }

   public int getS_abil_check() {
      return s_abil_check;
   }

   public void setS_abil_check(int s_abil_check) {
      this.s_abil_check = s_abil_check;
      if(s_abil_check>0)
      attr.add("실력");
   }

   public double getS_location_x() {
      return s_location_x;
   }

   public void setS_location_x(double s_location_x) {
      this.s_location_x = s_location_x;
     if(s_location_x!=0)
      attr.add("거리");
   }

   public double getS_location_y() {
      return s_location_y;
   }

   public void setS_location_y(double s_location_y) {
      this.s_location_y = s_location_y;
   }

   public String getS_online() {
      return s_online;
   }

   public void setS_online(String s_online) {
      this.s_online = s_online;
      if(s_online.equals("T"))
      attr.add("online");
   }

   public String getS_offline() {
      return s_offline;
   }

   public void setS_offline(String s_offline) {
      this.s_offline = s_offline;
      if(s_offline.equals("T"))
      attr.add("offline");
   }

   public String getS_mento_check() {
      return s_mento_check;
   }

   public void setS_mento_check(String s_mento_check) {
      this.s_mento_check = s_mento_check;
      if(s_mento_check.equals("T"))
      attr.add("튜터링");
   }

   public String getS_kind_check() {
      return s_kind_check;
   }

   public void setS_kind_check(String s_kind_check) {
      this.s_kind_check = s_kind_check;
      
   }

   public String getS_time_check() {
      return s_time_check;
      
   }

   public void setS_time_check(String s_time_check) {
      this.s_time_check = s_time_check;
      if(s_time_check.equals("T"))
      attr.add("시간");
   }

   public int getS_deposit() {
      return s_deposit;
   }

   public void setS_deposit(int s_deposit) {
      this.s_deposit = s_deposit;
      if(s_deposit>-1)
      attr.add("예치금");
   }

   public String getS_last_act() {
      return s_last_act;
   }

   public void setS_last_act(String s_last_act) {
      this.s_last_act = s_last_act;
   }

   public String getS_tag() {
      return s_tag;
   }

   public void setS_tag(String s_tag) {
      this.s_tag = s_tag;
   }

   public int getS_recent_hit() {
      return s_recent_hit;
   }

   public void setS_recent_hit(int s_recent_hit) {
      this.s_recent_hit = s_recent_hit;
   }

   public int getS_total_hit() {
      return s_total_hit;
   }

   public void setS_total_hit(int s_total_hit) {
      this.s_total_hit = s_total_hit;
   }

   public String getS_history() {
      return s_history;
   }

   public void setS_history(String s_history) {
      this.s_history = s_history;
   }
   

   public List<String> getAttr() {
      return attr;
   }

   public void setAttr(List<String> attr) {
      this.attr = attr;
   }
   
   

   public double getS_avg_abil() {
      return s_avg_abil;
   }

   public void setS_avg_abil(double s_avg_abil) {
      this.s_avg_abil = s_avg_abil;
   }
   
   

   public String getS_address() {
      return s_address;
   }

   public void setS_address(String s_address) {
      this.s_address = s_address;
   }

   @Override
   public String toString() {
      return "StudyGroup [s_id=" + s_id + ", s_name=" + s_name + ", s_intro="
            + s_intro + ", s_leader_id=" + s_leader_id + ", s_fix_member="
            + s_fix_member + ", s_start=" + s_start + ", s_end=" + s_end
            + ", s_attend_check=" + s_attend_check + ", s_abil_check="
            + s_abil_check + ", s_location_x=" + s_location_x
            + ", s_location_y=" + s_location_y + ", s_online=" + s_online
            + ", s_offline=" + s_offline + ", s_mento_check="
            + s_mento_check + ", s_kind_check=" + s_kind_check
            + ", s_time_check=" + s_time_check + ", s_deposit=" + s_deposit
            + ", s_last_act=" + s_last_act + ", s_tag=" + s_tag
            + ", s_recent_hit=" + s_recent_hit + ", s_total_hit="
            + s_total_hit + ", s_history=" + s_history + ", s_avg_abil="
            + s_avg_abil + ", s_address=" + s_address + ", s_t_start="
            + s_t_start + ", s_t_end=" + s_t_end + ", s_max_member="
            + s_max_member + ", sdfCurrent=" +  ", attr="
            + attr + "]";
   }

   


}