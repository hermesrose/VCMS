package jp.co.vcms.common;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;

public class CDao {

	public String sqlID = null;
	public String type = null;
	public Map<String, Object> paramMap = null;

	public CDao(String sqlID, String type) {

		this.sqlID = sqlID;
		this.type = type;
		this.paramMap = new HashedMap<String, Object>();

	}

	public void CleanParameter() {

		this.paramMap = new HashedMap<String, Object>();
	}

	public void SetParameter(String key, Object value) {

		this.paramMap.put(key, value);

	}

	public void SetMapParameter(Map<String, Object> map) {

		this.paramMap.putAll(map);

	}

	public void setRequestParameter(HttpServletRequest request) {

		Enumeration em = request.getParameterNames();
		while (em.hasMoreElements()) {

			String key = (String) em.nextElement();
			String value = request.getParameter(key);

			this.SetParameter(key.toUpperCase(), value);
		}
	}

	public void Execute() {

		if (this.type.equals(IDao.Select) || this.type.equals(IDao.Insert) || this.type.equals(IDao.Update)
				|| this.type.equals(IDao.Delete) || this.type.equals(IDao.Procedure)) {

			try {

				if (this.type.equals(IDao.Insert)) {

					CommonDAO.insert(this.sqlID, this.paramMap);

				} else if (this.type.equals(IDao.Update) || this.type.equals(IDao.Procedure)) {

					CommonDAO.update(this.sqlID, this.paramMap);

				} else if (this.type.equals(IDao.Delete)) {

					CommonDAO.delete(this.sqlID, this.paramMap);

				}

			} catch (Exception e) {
				// TODO: handle exception
			}

		}

	}

	public Object ExecuteScalar() {

		if (this.type.equals(IDao.Select)) {

			try {

				return CommonDAO.selectObject(this.sqlID, this.paramMap);

			} catch (SQLException e) {

			}

		}

		return null;
	}

	public Object ExecuteSelect() {

		if (this.type.equals(IDao.Select)) {

			try {

				return CommonDAO.select(this.sqlID, this.paramMap);

			} catch (SQLException e) {

			}

		}
		return null;
	}

	public Map<String, Object> ExecuteMap() {

		if (this.type.equals(IDao.Select)) {

			try {

				return CommonDAO.select(this.sqlID, this.paramMap);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (this.type.equals(IDao.Procedure)) {

			try {

				 CommonDAO.select(this.sqlID, this.paramMap);
				 return this.paramMap;

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return null;
	}

	public List<Map<String,Object>>ExecuteList() {

		if (this.type.equals(IDao.Select)) {

			try {

				return CommonDAO.selectList(this.sqlID, this.paramMap);

			} catch (SQLException e) {

			}

		}
		return null;
	}
	
	
	
	
	
	
	
	
	
}
