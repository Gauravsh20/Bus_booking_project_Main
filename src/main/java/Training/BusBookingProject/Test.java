package Training.BusBookingProject;

import java.util.List;

public class Test {
public static void main(String[] args) {
	UserDAO dao=new UserDAO();
	List<TravelscheduleMain> lists=dao.Busid("S001");
	for (TravelscheduleMain travelscheduleMain : lists) {
		System.out.println(travelscheduleMain.getBusid());
	}
	
//	System.out.println(nw.currentSQLDate());
 }
}