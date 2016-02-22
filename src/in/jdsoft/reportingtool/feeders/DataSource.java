package in.jdsoft.reportingtool.feeders;

import java.sql.Connection;

public interface DataSource {

	Connection getDataSourceConnection() throws Exception;
	void getTables() throws Exception;
	void getFields(String tablename);
}
