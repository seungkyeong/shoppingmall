package order;

public class orderDAO {
	orderId VARCHAR2(40);
	order_seq_num NUMBER(8);
	productId VARCHAR2(100);
	productName VARCHAR2(300);
	price NUMBER(10);
	order_Qty NUMBER(2);
	productDist VARCHAR2(30);
	productInfo VARCHAR2(100),
	selected_Opt VARCHAR2(100),
	fullname VARCHAR2(200),
	userid VARCHAR2(50),
	username VARCHAR2(30),
	email VARCHAR2(100),
	tel NUMBER(11),
	useraddress VARCHAR2(100),
	postcode VARCHAR2(20),
	orderDate DATE DEFAULT SYSDATE,
	deliver_msg VARCHAR2(300),
	deliver_situ NUMBER(2),
	totalAmount NUMBER(8),
	billingDate DATE DEFAULT SYSDATE,
	cal_info VARCHAR2(20)
}