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

	// SqlMapper ì´ˆê¸°?™”
	private static SqlMapClient initSqlMap() {
		return getSqlMapClient("SqlMapConfig.xml");
		                             
	}

	// ì´ˆê¸°?™”?•œ sqlMapClient ë°˜í™˜
	public static SqlMapClient getSqlMapClient() {
		return sqlMapper;
	}

	// ?‹¤?‹œë¡œë“œ
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

	// ?…? ¥
	public static Object insert(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.insert(sqlId, dataMap);
	}

	// ?ˆ˜? •
	public static int update(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.update(sqlId, dataMap);
	}

	// ?‚­? œ
	public static int delete(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.delete(sqlId, paramMap);
	}

	// ?‚­? œ
	public static int delete(String sqlId, String str) throws SQLException {
		return sqlMapper.delete(sqlId, str);
	}

	// ì¡°íšŒ
	public static Map select(String sqlId, Map paramMap) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, paramMap);
	}

	// ì¡°íšŒ
	public static Map select(String sqlId, String str) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, str);
	}

	// ì¡°íšŒ
	public static Object selectObject(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}

	// ì¡°íšŒ ? •ë³´ê? ?—†?Š” ê²½ìš° size=0?¸ Listê°ì²´ ë°˜í™˜
	public static List selectList(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}


	// ì¡°íšŒ
	public static Map selectMap(String sqlId, Map paramMap, String keyProperty) throws SQLException {
		return sqlMapper.queryForMap(sqlId, paramMap, keyProperty);
	}

	// ?Š¸?œ?­?…˜ ?‹œ?‘
	public static void startTransaction() throws SQLException {
		sqlMapper.startTransaction();
	}

	// ?Š¸?œ?­?…˜ commit
	public static void commitTransaction() throws SQLException {
		sqlMapper.commitTransaction();
	}

	// ?Š¸?œ?­?…˜ ì¢…ë£Œ
	public static void endTransaction() throws SQLException {
		sqlMapper.endTransaction();
	}

	// ë°°ì¹˜?‹œ?‘
	public static void startBatch() throws SQLException {
		sqlMapper.startBatch();
	}

	// ë°°ì¹˜?ˆ˜?–‰
	public static int executeBatchBatch() throws SQLException {
		return sqlMapper.executeBatch();
	}

	// connection ê°ì²´ë¥? ë°˜í™˜
	public static Connection getConnection() throws SQLException {
		return sqlMapper.getCurrentConnection();
	}

}
