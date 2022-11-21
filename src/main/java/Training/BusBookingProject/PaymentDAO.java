package Training.BusBookingProject;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class PaymentDAO {
SessionFactory sessionFactory;
Session session;
	
	public String paymentId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(PaymentDetail.class);
		List<PaymentDetail> plst=cr.list();
		if (plst.size()==0) {
			return "P001";
		}
		String ScheduleIds=plst.get(plst.size() - 1).getPaymentId();
		int ids = Integer.parseInt(ScheduleIds.substring(1));
		String bid=String.format("P%03d",++ids);
		return bid;
		}
	
	 public double Wallet_type(String UserId,PaymentType type) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId=:a and walletType=:t").setParameter("a",UserId).setParameter("t",type);
		 List<Double>wall=query.list();
		return wall.get(0);
	 }
	
	public String addPayment(PaymentDetail paymentDetail){
		 	String pId = paymentId();
		 	String userid=paymentDetail.getUserId();
		 	PaymentType type=paymentDetail.getPaytype();
		 	System.out.println(type);
		 	double bamt=paymentDetail.getAmount();
		 	double amount=Wallet_type(userid,type );
		 	System.out.println(amount);
		 	if(bamt>=amount) {
		 		return"not pay";
		 		
		 	}else {
		 	paymentDetail.setPaytype(paymentDetail.getPaytype());	
			paymentDetail.setPaymentId(pId);
			paymentDetail.setPaymentStatus(PaymentStatus.SUCCESSFULL);
			if(sessionFactory == null){
			sessionFactory=SessionHelper.getConnection();
			}

			
			session=sessionFactory.openSession();
			Transaction tr = session.beginTransaction();
			session.save(paymentDetail);
			tr.commit();
			session.close();
			
			session=sessionFactory.openSession();
			UserDAO dao=new UserDAO();
			Booking booking=dao.SearchBookingId(paymentDetail.getBookingId());
			tr = session.beginTransaction();
			booking.setBookingStatus(BookingStatus.APPROVED);
			session.saveOrUpdate(booking);
			tr.commit();
			session.close();
			
			session=sessionFactory.openSession();
			UserDAO udao=new UserDAO();
			double tamt=-bamt;
			Wallet wallet=new Wallet();
			String walletId=udao.generateWalletId();
			wallet.setWalletId(walletId);
			wallet.setWalletType(WalletType.PAYTM);
			wallet.setWalletAmount((float) tamt);
			wallet.setUserId(userid);
			Criteria cr = session.createCriteria(Wallet.class);
			Transaction trans = session.beginTransaction();
			session.save(wallet);
			trans.commit();		
			return "Payment Details Added";
		 	}
	 }
	
	
	public Date convertDate(String strDate) throws ParseException{
		java.util.Date test = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		java.sql.Date sqlDate=new java.sql.Date(test.getTime());
		return sqlDate;
	   }
	
	public PaymentDetail SearchPayment(String bookingid ){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Criteria cr = session.createCriteria(PaymentDetail.class);
			cr.add(Restrictions.eq("bookingId", bookingid));
			List<PaymentDetail> paydtel = cr.list();
			return paydtel.get(0);
		}
	
	
	 public String BookingDelete(String BookingId) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 UserDAO udao=new UserDAO();
		 Booking booking=udao.SearchBookingId(BookingId);
		 PaymentDetail paysearchid=SearchPayment(BookingId);
		 if(paysearchid.getPaymentStatus()==PaymentStatus.SUCCESSFULL) {
			 
			 
			 	Refund refund=new Refund();
			 	refund.setPaymentId(paysearchid.getPaymentId());
			 	refund.setAmount(paysearchid.getAmount());
			 	refund.setRefundStatus(RefundStatus.PENDING);
			 	refund.setUserId(paysearchid.getUserId());
			 	refund.setWalletId(paysearchid.getWalletId());
			 	Criteria cr = session.createCriteria(Refund.class);
			 	Transaction trns=session.beginTransaction();
			 	session.save(refund);
			 	trns.commit();
			 	
			 	Transaction tr=session.beginTransaction();
				session.delete(paysearchid);
				tr.commit(); 
			 	
			 		 }
			 Transaction tr=session.beginTransaction();
			 session.delete(booking);
			 tr.commit();
			 return "delete...";
		 
	 }
	 
	 
	 
	 
	
}
