package Training.BusBookingProject;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class UserDAO {

	SessionFactory sessionFactory;
	public List<User> showUser(String user){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from User");
		Criteria cr = session.createCriteria(User.class);
		List<User> userList=query.list();
		return userList;
		
		
	}
	
	public String updateUser(User user) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(User.class);
		 Transaction trans = session.beginTransaction();
		 session.update(user);
		 trans.commit();
		return "***...Record Updated...***";

		 
	 }

	
	 public String deleteUser(String userid) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 User user=SearchUserId(userid);
		 Transaction t = session.beginTransaction();
		 try {
			 session.delete(user);
			 t.commit();
			return "Record delete";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return ("Not Delete ."+e.getMessage());
			
			
		}
		
	 }
	
		public String generateUserId() {
			
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(User.class);
			List<User> userList = cr.list();
			if (userList.size() == 0) {
				return "U001";
			}
			session.close();
			String id = userList.get(userList.size() - 1).getUserid();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("U%03d", id1);
			return id2;

		}

	public String Adduser(User user) {
		String userid = generateUserId();
		user.setUserid(userid);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		Transaction trans = session.beginTransaction();
		session.save(user);
		trans.commit();
		return "User Details added Successfully";

	}

	public User SearchUserId(String UserId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("userid", UserId));
		List<User> Userlist = cr.list();
		return Userlist.get(0);
	}

	public String generateBookingId() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Booking.class);
		List<Booking> bookingList = cr.list();
		if (bookingList.size() == 0) {
			return "K001";
		}
		session.close();
		String id = bookingList.get(bookingList.size() - 1).getBookingId();
		int id1 = Integer.parseInt(id.substring(1));
		id1++;
		String id2 = String.format("K%03d", id1);
		return id2;
	}

	public String addBooking(Booking booking) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String bookId = generateBookingId();
		booking.setBookingStatus(BookingStatus.PENDING);
		booking.setBookingId(bookId);
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		// booking.setDateofBooking(sqlDate);
		Transaction t = session.beginTransaction();
		session.save(booking);
		t.commit();
		return "Added Booking Details";
	}

	public List<Booking> showBooking(String booking) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Booking");
		Criteria cr = session.createCriteria(Booking.class);
		List<Booking> bookingLst = query.list();
		return bookingLst;
	}

	public List<User> checkUsers(String user, String psswd) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("username", user));
		cr.add(Restrictions.eq("password", psswd));
		List<User> usrLst = cr.list();
		return usrLst;

	}

	public Booking SearchBookingId(String UserId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Booking.class);
		cr.add(Restrictions.eq("bookingId", UserId));
		List<Booking> bookinglist = cr.list();
		return bookinglist.get(0);
	}

	public List<Booking> seats(String a) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From Booking where scheduleId=:s").setParameter("s", a);
		List<Booking> leavelist1 = query.list();
		return leavelist1;
	}

	public List<Integer> book(String id) {
		List<Booking> booking = seats(id);
		List<Integer> seat = new ArrayList<Integer>();
		List<Integer> seat2 = new ArrayList<Integer>();
		for (Booking bookings : booking) {
			System.out.println(bookings.getSeatNo());
			int a = bookings.getSeatNo();
			seat.add(a);
		}
		for (int i = 1; i <= 20; i++) {
			if (!seat.contains(i)) {
				seat2.add(i);
			}

		}
		return seat2;
	}
	
	public List<Booking>ShowBookingOp(String UserId){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From Booking where userId=:u").setParameter("u", UserId);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	
		
	}
	 public String CancelTicets(String BookingID) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 String hql = "DELETE FROM Booking WHERE booking_id=:book";
		 Query query = session.createQuery(hql);
		 query.setParameter("book", BookingID);
		 query.executeUpdate();
		 return "Gaurav";
	 }
	 
	 public String generateWalletId(){
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Wallet.class);
		 List<Wallet> walletList = cr.list();
		 if(walletList.size()==0){
			 return "W001";
		 }
		 session.close();
		 String id = walletList.get(walletList.size()-1).getWalletId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("W%03d", id1);
		return id2;
		 
		}
	 
	 public String addWallet(Wallet wallet){
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			String walletId=generateWalletId();
			wallet.setWalletId(walletId);
			Criteria cr = session.createCriteria(Wallet.class);
			Transaction trans = session.beginTransaction();
			session.save(wallet);
			trans.commit();
			return "***...Wallet Added Successfully...***";
			
		}
     
	 public String updateWallet(Wallet wallet) {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Wallet.class);
		 Transaction trans = session.beginTransaction();
		 session.update(wallet);
		 trans.commit();
		return "***...Record Updated...***";

		 
	 }
	 
	 public double wallettll(String UserId) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
//		 SELECT SUM(E.salary), E.firtName FROM Employee E
//		 String sumHql = "SELECT SUM(salary) FROM employees WHERE idemployee = 31";
//		 Query sumQuery = s.createQuery(sumHql);
//		 System.out.println(sumQuery.list().get(0));
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId=:a").setParameter("a",UserId);
		 List<Double>wall=query.list();
		 try {
			return wall.get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String id=e.getMessage();
			return 00.00;
		}
		 
	 }
	 
	 public double Wallet_type(String UserId,String type) {
		 sessionFactory =SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("SELECT SUM(walletAmount) FROM Wallet where userId=:a and walletType=:t").setParameter("a",UserId).setParameter("t",WalletType.valueOf(type));
		 List<Double>wall=query.list();
		 try {
			return wall.get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String id=e.getMessage();
			return 00.00;
		}
	 }
	 
	 public String BookingDelete(String BookingId) {
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Booking booking=SearchBookingId(BookingId);
		 Transaction tr=session.beginTransaction();
		 session.delete(booking);
		 tr.commit();
		 try {
			return "delete...";
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			e.getMessage();
			return "Not Canceled";
		}
		 
	 }
	 public List<Booking> SearchBookId(String Bookedid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Booking where bookingId=:u").setParameter("u", Bookedid);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	 
	 }
	 
	 public List<Wallet>SearchWalletId(String userId,String type){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Wallet where userId=:u and walletType=:w").setParameter("u", userId).setParameter("w",WalletType.valueOf(type));
		List<Wallet>Wallet = query.list();
		return Wallet;	
		 
	 }
	 
	 public List<Booking> Final_ticket(String Userid){
		 sessionFactory=SessionHelper.getConnection();
		 Session session=sessionFactory.openSession();
		 Query query = session.createQuery("From Booking where userId=:u and bookingStatus='APPROVED'" ).setParameter("u", Userid);
		List<Booking> leavelist2 = query.list();
		return leavelist2;	 
	 }
	 
	 
	 
	
}
