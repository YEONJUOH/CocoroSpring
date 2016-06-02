package cocoro.users.persistance;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.users.domain.Comment;
import cocoro.users.domain.LoginVo;
import cocoro.users.domain.Users;

//Respositroy 스프링에서 Dao를 인식할 수 있도록 해준다.
@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Inject
	private SqlSession sqlsession;

	//맵퍼 네임스페이스
	private static final String namespace = "cocoro.mapper.UsersMapper";
	
	//인설트
	@Override
	public void insertUsers(Users users) {
		sqlsession.insert(namespace +".insertUsers",users);
	}
	//유저리스트
	@Override
	public List<Users> usersList() throws Exception {
		return sqlsession.selectList(namespace +".usersList");
	}
	//유저수정
	@Override
	public void usersModify(Users users) throws Exception {
		sqlsession.update(namespace +".usersModify",users);
	}
	//유저삭제
	@Override
	public void delUsers(Integer u_id) throws Exception {
		sqlsession.delete(namespace +".delUsers",u_id);
	}
	//유저정보
	@Override
	public Users usersInfo(Integer u_id) throws Exception {
		return sqlsession.selectOne(namespace +".usersInfo",u_id);
	}
	//유저 로그인
	@Override
	public Users usersLogin(HashMap<String, String> login) throws Exception {
		return sqlsession.selectOne(namespace +".usersLogin",login);		
	}
	//팔로우하기
	@Override
	public void usersFollow(HashMap<String, Integer> follow) throws Exception {
		sqlsession.insert(namespace +".usersFollow" , follow);
	}
	//후기작성
	@Override
	public void usersAfter(Comment comment) throws Exception {
		sqlsession.insert(namespace +".usersAfter", comment);
	}
	//해당회원의 후기불러오기
	@Override
	public List<Comment> usersAfterInfo(Integer u_id) throws Exception {
		return sqlsession.selectList(namespace + ".usersAfterInfo",u_id);
	}
	
}
