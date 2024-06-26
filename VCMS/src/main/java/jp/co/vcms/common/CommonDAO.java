package jp.co.vcms.common;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class CommonDAO {

	private static SqlMapClient sqlMapper = initSqlMap();

	// SqlMapper μ΄κΈ°?
	private static SqlMapClient initSqlMap() {
		return getSqlMapClient("SqlMapConfig.xml");
		                             
	}

	// μ΄κΈ°?? sqlMapClient λ°ν
	public static SqlMapClient getSqlMapClient() {
		return sqlMapper;
	}

	// ?€?λ‘λ
	public static void reload() {
		sqlMapper = null;
		sqlMapper = initSqlMap();
	}

	public static SqlMapClient getSqlMapClient(String sqlMapConfig) {

		SqlMapClient sqlMapper = null;
		Reader reader = null;

		try {

			reader = Resources.getResourceAsReader(sqlMapConfig);
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);

		} catch (IOException e) {

		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {

				}
			}
		}
		return sqlMapper;
	}

	// count
	public static int count(String sqlId, Map paramMap) throws SQLException {
		return ((Integer) sqlMapper.queryForObject(sqlId, paramMap)).intValue();
	}

	// ?? ₯
	public static Object insert(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.insert(sqlId, dataMap);
	}

	// ?? 
	public static int update(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.update(sqlId, dataMap);
	}

	// ?­? 
	public static int delete(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.delete(sqlId, paramMap);
	}

	// ?­? 
	public static int delete(String sqlId, String str) throws SQLException {
		return sqlMapper.delete(sqlId, str);
	}

	// μ‘°ν
	public static Map select(String sqlId, Map paramMap) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, paramMap);
	}

	// μ‘°ν
	public static Map select(String sqlId, String str) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, str);
	}

	// μ‘°ν
	public static Object selectObject(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}

	// μ‘°ν ? λ³΄κ? ?? κ²½μ° size=0?Έ Listκ°μ²΄ λ°ν
	public static List selectList(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}


	// μ‘°ν
	public static Map selectMap(String sqlId, Map paramMap, String keyProperty) throws SQLException {
		return sqlMapper.queryForMap(sqlId, paramMap, keyProperty);
	}

	// ?Έ??­? ??
	public static void startTransaction() throws SQLException {
		sqlMapper.startTransaction();
	}

	// ?Έ??­? commit
	public static void commitTransaction() throws SQLException {
		sqlMapper.commitTransaction();
	}

	// ?Έ??­? μ’λ£
	public static void endTransaction() throws SQLException {
		sqlMapper.endTransaction();
	}

	// λ°°μΉ??
	public static void startBatch() throws SQLException {
		sqlMapper.startBatch();
	}

	// λ°°μΉ??
	public static int executeBatchBatch() throws SQLException {
		return sqlMapper.executeBatch();
	}

	// connection κ°μ²΄λ₯? λ°ν
	public static Connection getConnection() throws SQLException {
		return sqlMapper.getCurrentConnection();
	}

}
