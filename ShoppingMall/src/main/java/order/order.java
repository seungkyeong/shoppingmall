package order;

public class order {
	private String productId;
	private String productName;
	private int price;
	private String productStock; //수량
	private String productInfo; //사진
	private String fullname; //상품정보
	private String userid;
	private String username;
	private String email;
	private int tel;
	private String useraddress;
	private String postcode; //우편번호
	private String selected_Opt; //옵션
	private String order_Qty; //주문수량
	private int orderDate; //주문날짜
	private int orderId; //주문번호
	private int order_seq_num; //결제 시간
	private int billingDate; //배송상태
	private String deliver_msg; //배송 메시지
	private int deliver_situ; //
	private int totalAmount; //
	private String cal_info; //
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductDist() {
		return productStock;
	}
	public void setProductDist(String productDist) {
		this.productStock = productDist;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getUseraddress() {
		return useraddress;
	}
	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getSelected_Opt() {
		return selected_Opt;
	}
	public void setSelected_Opt(String selected_Opt) {
		this.selected_Opt = selected_Opt;
	}
	public String getOrder_Qty() {
		return order_Qty;
	}
	public void setOrder_Qty(String order_Qty) {
		this.order_Qty = order_Qty;
	}
	public int getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(int orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrder_seq_num() {
		return order_seq_num;
	}
	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}
	public int getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(int billingDate) {
		this.billingDate = billingDate;
	}
	public String getDeliver_msg() {
		return deliver_msg;
	}
	public void setDeliver_msg(String deliver_msg) {
		this.deliver_msg = deliver_msg;
	}
	public int getDeliver_situ() {
		return deliver_situ;
	}
	public void setDeliver_situ(int deliver_situ) {
		this.deliver_situ = deliver_situ;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getCal_info() {
		return cal_info;
	}
	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}
	}