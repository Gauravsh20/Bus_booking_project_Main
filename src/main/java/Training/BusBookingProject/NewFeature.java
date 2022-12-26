package Training.BusBookingProject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class NewFeature {
	SessionFactory sessionFactory;
	public java.sql.Date ConvertDate(String dt) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1 =  sdf.parse(dt);
		return new java.sql.Date(d1.getTime()) ;
	}
	
	public java.sql.Date currentSQLDate() {
		Date utilDate = new Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}
	
	public List<TravelscheduleMain> AvailableBus(){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
//		String hql = ("FROM TravelscheduleMain T WHERE T.scheduledate > ':currentSQLDate'");
		Query query = session.createQuery("FROM TravelscheduleMain T WHERE T.scheduledate >= :currentSQLDate").setParameter("currentSQLDate", currentSQLDate());
		List results = query.list();
		return results;
		
	}
	
	

}
