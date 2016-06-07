package cocoro.users.persistance;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.User;
import org.apache.catalina.ant.SessionsTask;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cocoro.mapper.UsersMapper;
import cocoro.user.model.Comment;
import cocoro.user.model.Follow;
import cocoro.user.model.Likes;
import cocoro.user.model.Mento;
import cocoro.user.model.Message;
import cocoro.user.model.Users;
import cocoro.user.model.UsersAccount;

public class UsersActivityDao {
	private static UsersActivityDao dao = new UsersActivityDao();
	
	public static UsersActivityDao getInstance(){
		return dao;
	}
	
	//유저 인설트
		public int insertUsers(Users users){
			SqlSession session = getSqlSessionFactory().openSession();
			int re = 0;
			try{
				re = session.getMapper(UsersMapper.class).insertUsers(users);
				
				if(re > 0){
					session.commit();
				}else{
					session.rollback();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return re;
		}
	
	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "cocoro/mybatis-config.xml";
		InputStream input = null;
		try{
			input = Resources.getResourceAsStream(resource);
		}catch(Exception e){
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(input);
	}
	
	//로그인 
	public Users usersLogin(HashMap<String, String> login){
		SqlSession session = getSqlSessionFactory().openSession();
		Users users = null;
		try{
			users = session.getMapper(UsersMapper.class).usersLogin(login);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return users;
	}
	//로그인 할때마다 최신 시간으로 업데이트
	public int usersLoginTime(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersLoginTime(u_id);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//회원 정보가져오기
	public Users usersInfo(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		Users users = null;
		try{
			users = session.getMapper(UsersMapper.class).usersInfo(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return users;
	}
	//모든 회원정보 
	public List<Users> usersList(){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Users> list = null;
		try{
			list = session.getMapper(UsersMapper.class).usersList();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	//멘토 등록 
	public int usersMento(Mento Mento){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersMento(Mento);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//멘토 등록 여부 
	public Mento usersMentoCheck(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		Mento mento = null;
		try{
			mento = session.getMapper(UsersMapper.class).usersMentoCheck(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return mento;
	}
	//멘토 업데이트
	public int usersMentoUpdate(Mento mento){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersMentoUpdate(mento);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//멘토삭제
	public int usersMentoDelete(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersMentoDelete(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//모든 멘토리스트
	public List<Mento> usersMentoList(){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Mento> mentoList = null;
		try{
			mentoList = session.getMapper(UsersMapper.class).usersMentoList();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return mentoList;
	}

	//팔로우하고있는 목록
	public List<Users> usersFollowList(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Users> list = null;
		try{
			list = session.getMapper(UsersMapper.class).usersFollowList(u_id);
			System.out.println("dao에서"+u_id+" : "+list.size());
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	//팔로우 걸기
	public int usersFollow(HashMap<String, Integer> follow){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersFollow(follow);
			if(re > 0){
				System.out.println("팔로우 성공");
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//팔로우 해제
	public int usersUnFollow(HashMap<String,Integer> unFollow){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersUnFollow(unFollow);
			if(re >0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//팔로우 체크
	public Follow usersFollowCheck(HashMap<String, Integer> usersFollowCheck){
		SqlSession session = getSqlSessionFactory().openSession();
		Follow follow = null;
		try{
			follow = session.getMapper(UsersMapper.class).usersFollowCheck(usersFollowCheck);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return follow;
	}
	//마이페이지 수정 
	public int usersModify(Users users){
		SqlSession session = getSqlSessionFactory().openSession();
		
		System.out.println(users.toString());
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersModify(users);
			if(re > 0){
				session.commit();
				System.out.println("커밋 성공");
			}else{
				session.rollback();
				System.out.println("실패데쓰");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//계좌생성
	public int usersAccount(UsersAccount usersAccount){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersAccount(usersAccount);
			if(re > 0){
				System.out.println("계좌가 생성되었습니다.");
				session.commit();
			}else{
				System.out.println("계좌생성에 실패했습니다.");
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//회원 계좌 뽑아오기 
	public UsersAccount usersAccountInfo(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		UsersAccount usersAccount = null;
		try{
			usersAccount = session.getMapper(UsersMapper.class).usersAccountInfo(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return usersAccount;
	}
	//회원들 계좌번호 조회
	public List<UsersAccount> usersAccountNumber(){
		SqlSession session = getSqlSessionFactory().openSession();
		List<UsersAccount> list = null;
		try{
			list = session.getMapper(UsersMapper.class).usersAccountNumber();
			System.out.println("dao"+list.size());
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	//계좌 입금
	public int usersAccountPlus(UsersAccount usersAccount){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersAccountPlus(usersAccount);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
	return re;
	}
	//계좌 출금
	public int usersAccountMinus(UsersAccount usersAccount){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersAccountMinus(usersAccount);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
		return re;
	}
	//후기남기기
	public int usersAfter(Comment comment){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersAfter(comment);
			if(re >0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//후기 불러오기 
	public List<Comment> usersAfterInfo(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Comment> comment = null;
		try{
			comment = session.getMapper(UsersMapper.class).usersAfterInfo(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return comment;
	}
	//후기남긴애들 정보 불러오기
	public List<Users> usersAfterUsersInfo(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Users> commentUsers = null;
		try{
			commentUsers = session.getMapper(UsersMapper.class).usersAfterUsersInfo(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return commentUsers;
	}
	//좋아요하기
	public int usersLike(HashMap<String,Integer> usersLike){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersLike(usersLike);
			if( re > 0 ){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//좋아요 하고있는 회원들 불러오기
	public List<Likes> usersLikeNum(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Likes> list = null;
		try{
			list = session.getMapper(UsersMapper.class).usersLikeNum(u_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	//좋아요 할떄마다 업데이트
	public int usersLikeUpdate(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersLikeUpdate(u_id);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//좋아요 할때마다 - 업데이트 
	public int usersLikeMinusUpdate(int u_id){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersLikeMinusUpdate(u_id);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//좋아요 취소 
	public int usersUnLike(HashMap<String, Integer> usersUnLike){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).usersUnLike(usersUnLike);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//회원이랑 친구랑 좋아요 관계인가 체크 
	public Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck){
		SqlSession session = getSqlSessionFactory().openSession();
		Likes likes = null;
		try{
			likes = session.getMapper(UsersMapper.class).usersLikeCheck(usersLikeCheck);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return likes;
	}
	//자동완성
	public List<Users> autoSearch(String searchKey){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Users> list = null;
		try{
			list = session.getMapper(UsersMapper.class).autoSearch(searchKey);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	//중복체크 
	public Users joinSearch(String searchKey){
		SqlSession session = getSqlSessionFactory().openSession();
		Users users = null;
		try{
			users = session.getMapper(UsersMapper.class).joinSearch(searchKey);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return users;
	}
	//쪽지보내기 
	public int sendMessage(Message message){
		SqlSession session = getSqlSessionFactory().openSession();
		int re = 0;
		try{
			re = session.getMapper(UsersMapper.class).sendMessage(message);
			if(re > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return re;
	}
	//받은 쪽지 정보 
		public List<Message> receiveMessage(int message_o_id){
			SqlSession session = getSqlSessionFactory().openSession();
			List<Message> receiveMessage = null;
			try{
				receiveMessage = session.getMapper(UsersMapper.class).receiveMessage(message_o_id);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return receiveMessage;
		}
		//받은 메세지를 보낸사람의 정보
		public List<Users> receiveInfo(int message_o_id){
			SqlSession session = getSqlSessionFactory().openSession();
			List<Users> receiveInfo = null;
			try{
				receiveInfo = session.getMapper(UsersMapper.class).receiveInfo(message_o_id);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return receiveInfo;
		}
			//보낸 쪽지 정보 
				public List<Message> postMessage(int message_u_id){
					SqlSession session = getSqlSessionFactory().openSession();
					List<Message> postMessage = null;
					try{
						postMessage = session.getMapper(UsersMapper.class).postMessage(message_u_id);
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						session.close();
					}
					return postMessage;
				}
				//보낸 메세지를 받은 사람정보
				public List<Users> postInfo(int message_u_id){
					SqlSession session = getSqlSessionFactory().openSession();
					List<Users> postInfo = null;
					try{
						postInfo = session.getMapper(UsersMapper.class).postInfo(message_u_id);
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						session.close();
					}
					return postInfo;
				}
				//해당 메세지 삭제 
		public int delMessage(int message_id){
			SqlSession session = getSqlSessionFactory().openSession();
			int re =0;
			try {
				re = session.getMapper(UsersMapper.class).delMessage(message_id);
				if(re>0){
				session.commit();
				}else{
					session.rollback();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return re;
		}
				
				
				
				
				
				
				
				
				
				
				
}
