package cocoro.mahout;
import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.client.*;

import cocoro.search.persistence.SearchDAO;
import cocoro.study.domain.StudyGroup;
import oracle.jdbc.pool.OracleDataSource;

public class MongoDB {

	
	
	
	
	public static void createSiliconnitride() throws UnknownHostException {
		BasicDBObject searchinfo = new BasicDBObject();
		
		Mongo mongo=null;
		DB db=null;	
		DBCollection table= null;
		
		mongo = new Mongo("localhost", 27017);
		db = mongo.getDB("mydb");
		table=db.getCollection("searchinfo");
		
		System.out.println("데이터베이스명 : " + mongo.getDatabaseNames());

		try {
			//oracle 호출부
			OracleDataSource datasource = new OracleDataSource();	
			datasource.setURL("jdbc:oracle:thin:@localhost:1521:XE");
			datasource.setUser("cocoroDB");
			datasource.setPassword("1234");
			String sql = "select * from searchinfo";

			Connection conn = datasource.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			table.drop();
			//mongodb에 값 입력
			
			int count = 0;
			while (rs.next()) {
				
				int u_id = Integer.parseInt(rs.getString("u_id"));
				int s_id = Integer.parseInt(rs.getString("s_id"));
				int s_hitcount = Integer.parseInt(rs.getString("s_hit"));
				
				searchinfo.put("user_id", u_id);
				searchinfo.put("item_id", s_id);
				searchinfo.put("preference", s_hitcount);
				
				table.insert(searchinfo);
				searchinfo.clear();
			}

			stmt.close();
			conn.close();
						
			DBCursor cursor = table.find(searchinfo);
			
			
			while (cursor.hasNext()) {
				DBObject result = cursor.next();
				System.out.println(result.get("user_id"));
				count++;
			}
			
			System.out.println("\n"+count);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static List<StudyGroup> recommend(int s_id) throws UnknownHostException, ParseException {
		System.out.println("하자");

		 List<StudyGroup> listS =new ArrayList<StudyGroup>();
		
		try {
			MongoDBDataModel dm = new MongoDBDataModel("localhost", 27017, "mydb", "searchinfo", false, false, null);
			System.out.println("connected to mongo ");
			
			ItemSimilarity sim = new LogLikelihoodSimilarity(dm);
			
			
			GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(dm, sim);
			
			for (LongPrimitiveIterator items = dm.getItemIDs(); items.hasNext();) {
				long itemId = items.nextLong();
				
				List<RecommendedItem> recommendations = recommender.mostSimilarItems(itemId, 4);
				for (RecommendedItem recommendation : recommendations) {
					System.out.println("itemid : "+itemId + ","+ 
										"getID :"+ recommendation.getItemID() + "," + recommendation.getValue());
				
				
				if(itemId==s_id){
					
					StudyGroup group = new StudyGroup();
					group.setS_id((int)recommendation.getItemID());
					listS.add(group);
				}
				
				
				
				}
			}
		} catch (TasteException e) {
			System.out.println("there was an Taste Exception.");
			e.printStackTrace();
		}
	
		
		
		return listS;
	}	

/*	public static void main(String args[]) throws IOException, ParseException {
		//createSiliconnitride();
		recommend();
	}*/

}