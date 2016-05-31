package t.o.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class randomno {
	public static String foodno(){     
        String a[] = new String[6]; 
        String ranno = "FOOD";
        Random random = new Random();   
        boolean checkno = true;
        
	    while(checkno){
	    	int size = 0;
	    	for(int j=0;j<a.length;j++){
	        	a[j] = random.nextInt(10)+"";
	        }
	        for(int q=0;q<a.length;q++){
	        	ranno = ranno+a[q];
	        }
	        String sql = "select * from t_o_Food where o_foodNo = '"+ranno+"'";
	        size = DBfood.getrs(sql);
	        if(size>0){
				System.out.println("一样继续");
			}
	       	if(size==0){
	       		System.out.println("不一样");
	        	break;
	        }
	    }
        return ranno;
    }  
	public static String orderno(){     
        String a[] = new String[5]; 
        String ranno = "ORDER";
        Random random = new Random();   
        boolean checkno = true;
        
	    while(checkno){
	    	int size = 0;
	    	for(int j=0;j<a.length;j++){
	        	a[j] = random.nextInt(10)+"";
	        }
	        for(int q=0;q<a.length;q++){
	        	ranno = ranno+a[q];
	        }
	        String sql = "select * from t_o_Order where o_orderNo = '"+ranno+"'";
	        size = DBorder.getrs(sql);
	        if(size>0){
				System.out.println("一样继续");
			}
	       	if(size==0){
	       		System.out.println("不一样");
	        	break;
	        }
	    }
        return ranno;
    }  
	public static String comno(){     
        String a[] = new String[7]; 
        String ranno = "COM";
        Random random = new Random();   
        boolean checkno = true;
        
	    while(checkno){
	    	int size = 0;
	    	for(int j=0;j<a.length;j++){
	        	a[j] = random.nextInt(10)+"";
	        }
	        for(int q=0;q<a.length;q++){
	        	ranno = ranno+a[q];
	        }
	        String sql = "select * from t_o_Com where o_cNo = '"+ranno+"'";
	        size = DBcomposition.getrs(sql);
	        if(size>0){
				System.out.println("一样继续");
			}
	       	if(size==0){
	       		System.out.println("不一样");
	        	break;
	        }
	    }
        return ranno;
    }  
}
