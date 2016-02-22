package in.jdsoft.reportingtool.feeders;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;



public class MySQLDataSource implements DataSource {
	
	public String hostname;
	public int port;
	public String database;
	public String username;
	public String password;
	
	
	
	public MySQLDataSource(String hostname,int port,String database,String username,String password) {
		// TODO Auto-generated constructor stub
		this.hostname=hostname;
		this.port=port;
		this.database=database;
		this.username=username;
		this.password=password;
	}
	

	@Override
	public Connection getDataSourceConnection() throws Exception{
		// TODO Auto-generated method stub
		Connection conn=null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        
        String sURL ="jdbc:mysql://"+hostname+":"+port+"/"+database+"";
        
        conn = DriverManager.getConnection(sURL,username,password);
      return conn;
		
	}


	@Override
	public void getTables() throws Exception{
		ArrayList<String> tables=new ArrayList<>();
		Connection conn1=getDataSourceConnection();
		DatabaseMetaData metadata=conn1.getMetaData();
		ResultSet table=metadata.getTables(null,null,"%",null);
		int count=0;
		while(table.next()){
			tables.add(table.getString(3));
			System.out.println();
			count++;
		}
		System.out.println(count);
		
	}


	@Override
	public void getFields(String tablename) {
		// TODO Auto-generated method stub
		
	}

}
