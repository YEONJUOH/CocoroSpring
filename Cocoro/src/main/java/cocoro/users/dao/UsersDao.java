package cocoro.users.dao;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cocoro.mapper.UsersMapper;
import cocoro.user.model.Users;

public class UsersDao {
	private static UsersDao dao = new UsersDao();
	
	public static UsersDao getInstance(){
		return dao;
	}
	
	//세션펙토리 생성
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
}
