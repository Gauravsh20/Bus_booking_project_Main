package Training.BusBookingProject;


public class Test {
public static void main(String[] args) {
	UserDAO dao=new UserDAO();
	System.out.println(dao.book("S001"));
 }
}