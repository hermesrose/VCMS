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

	// SqlMapper 초기?��
	private static SqlMapClient initSqlMap() {
		return getSqlMapClient("SqlMapConfig.xml");
		                             
	}

	// 초기?��?�� sqlMapClient 반환
	public static SqlMapClient getSqlMapClient() {
		return sqlMapper;
	}

	// ?��?��로드
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

	// ?��?��
	public static Object insert(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.insert(sqlId, dataMap);
	}

	// ?��?��
	public static int update(String sqlId, Map dataMap) throws SQLException {
		return sqlMapper.update(sqlId, dataMap);
	}

	// ?��?��
	public static int delete(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.delete(sqlId, paramMap);
	}

	// ?��?��
	public static int delete(String sqlId, String str) throws SQLException {
		return sqlMapper.delete(sqlId, str);
	}

	// 조회
	public static Map select(String sqlId, Map paramMap) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, paramMap);
	}

	// 조회
	public static Map select(String sqlId, String str) throws SQLException {
		return (Map) sqlMapper.queryForObject(sqlId, str);
	}

	// 조회
	public static Object selectObject(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}

	// 조회 ?��보�? ?��?�� 경우 size=0?�� List객체 반환
	public static List selectList(String sqlId, Map paramMap) throws SQLException {
		return sqlMapper.queryForList(sqlId, paramMap);
	}


	// 조회
	public static Map selectMap(String sqlId, Map paramMap, String keyProperty) throws SQLException {
		return sqlMapper.queryForMap(sqlId, paramMap, keyProperty);
	}

	// ?��?��?��?�� ?��?��
	public static void startTransaction() throws SQLException {
		sqlMapper.startTransaction();
	}

	// ?��?��?��?�� commit
	public static void commitTransaction() throws SQLException {
		sqlMapper.commitTransaction();
	}

	// ?��?��?��?�� 종료
	public static void endTransaction() throws SQLException {
		sqlMapper.endTransaction();
	}

	// 배치?��?��
	public static void startBatch() throws SQLException {
		sqlMapper.startBatch();
	}

	// 배치?��?��
	public static int executeBatchBatch() throws SQLException {
		return sqlMapper.executeBatch();
	}

	// connection 객체�? 반환
	public static Connection getConnection() throws SQLException {
		return sqlMapper.getCurrentConnection();
	}

}
