package Training.BusBookingProject;

import java.util.List;

public class Test {
	public static void main(String[] args) {
		PaymentDAO dao=new PaymentDAO();
//		UserDAO dao=new UserDAO();
//		Booking book=null;
//		double gpayamt=0;
//		
//		PaymentDetail walls=new PaymentDetail();
//		walls =dao.SearchPayment("K009");
//		System.out.println(walls.getPaymentStatus());
//		System.out.println(dao.BookingDelete("K009"));

		TravelscheduleDAO dao1=new TravelscheduleDAO();
		TravelscheduleMain t=dao1.SearchTravelId("S001");
		System.out.println(t.getAddressend());
		
		
//		double tt=dao.Wallet_type("U002",PaymentType.PHONE_PAY);
//		System.out.println(tt);
		
		
	}

}
