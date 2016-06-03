package cocoro.search.domain;

public class Distance {
 
	
public static double calDistance(double lat1, double lon1, double lat2, double lon2){  
	    
	    double theta, dist;  
	    theta = lon1 - lon2;  
	    dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))   
	          * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));  
	    dist = Math.acos(dist);  
	    dist = rad2deg(dist);  
	      
	    dist = dist * 60 * 1.1515;   
	    dist = dist * 1.609344;    // �떒�쐞 mile �뿉�꽌 km 蹂��솚.  
	    dist = dist * 1000.0;      // �떒�쐞  km �뿉�꽌 m 濡� 蹂��솚  
	  
	    return dist;  
	}  
	  
	    // 二쇱뼱吏� �룄(degree) 媛믪쓣 �씪�뵒�뼵�쑝濡� 蹂��솚  
	private static double deg2rad(double deg){  
	    return (double)(deg * Math.PI / (double)180d);  
	}  
	  
	    // 二쇱뼱吏� �씪�뵒�뼵(radian) 媛믪쓣 �룄(degree) 媛믪쑝濡� 蹂��솚  
	private static double rad2deg(double rad){  
	    return (double)(rad * (double)180d / Math.PI);  
	} 
	
}
