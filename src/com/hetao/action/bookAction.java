/*
 * @(#)webProject --- bookAction.java 
 */
package com.hetao.action;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author ����
 * @version 1st   on 2017��9��19��
 */
public class bookAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String author;
	private String Age;
	private String Country;
	private String ISBN;
	private String AuthorID;
	private String title;
	private String publisher;
	private String publishDate;
	private String price;
	private String result;
	private HttpServletRequest request;
	private HttpServletResponse response;
	//private Map<String,String>dataMap;

	public void setAuthor(String author){
		this.author=author;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public String getAge(){
		return Age;
	}
	
	public void setAge(String Age){
		this.Age=Age;
	}
	
	public String getCountry(){
		return Country;
	}
	
	public void setCountry(String Country){
		this.Country=Country;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title=title;
	}
	
	public void setAuthorID(String AuthorID){
		this.AuthorID=AuthorID;
	}
	
	public String getAuthorID(){
		return this.AuthorID;
	}
	
	public void setPublisher(String publisher){
		this.publisher=publisher;
	}
	
	public String getPublisher(){
		return publisher;
	}
	
	public void setPublishDate(String publishDate){
		this.publishDate=publishDate;
	}
	
	public String getPublishDate(){
		return publishDate;
	}
	
	public void setPrice(String price){
		this.price=price;
	}
	
	public String getPrice(){
		return price;
	}
	
	public void setResult(String result){
		this.result=result;
	}
	
	public String getResult(){
		return result;
	}
	
	public String DetailOfBook() throws ClassNotFoundException, SQLException{
		ISBN=request.getParameter("ISBN");
		AuthorID=request.getParameter("AuthorID");
		
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select * from book where ISBN=\""+ISBN+"\"");
		String result="";
		if(rs.wasNull())	return ERROR;
		while(rs.next()){
			result+=rs.getString(1)+"~";
			result+=rs.getString(2)+"~";
			result+=rs.getString(3)+"~";
			result+=rs.getString(4)+"~";
			result+=rs.getString(5)+"~";
			result+=rs.getString(6);
		}
		request.setAttribute("result", result);
		rs.close();
		
		connect=DriverManager.getConnection(url,"root","www.12358.com");
		stat=(Statement) connect.createStatement();
		rs=stat.executeQuery("select * from author where AuthorID=\""+AuthorID+"\"");
		String authorInfo=new String();
		while(rs.next()){
			authorInfo+=rs.getString(1)+"~";
			authorInfo+=rs.getString(2)+"~";
			authorInfo+=rs.getString(3)+"~";
			authorInfo+=rs.getString(4);
		}
		request.setAttribute("authorInfo", authorInfo);
		rs.close();stat.close();connect.close();
		return SUCCESS;
	}
	
	public String QueryAllBooks() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select * from author where name=\""+author+"\"");
		String id="";
		while(rs.next()){
			id=rs.getString(1);
		}
		rs.close();
		
		rs=stat.executeQuery("select * from book where AuthorID=\""+id+"\"");
		if(rs.wasNull())	return ERROR;
		String result="";
		while(rs.next()){
			for(int i=0;i<6;i++)
				result+=rs.getString(i+1)+"~";
			result+=author+"!";
		}
		rs.close();stat.close();connect.close();
		request.setAttribute("result", result);
		rs.close();stat.close();connect.close();
		return SUCCESS;
	}

	public String deleteBook() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from book where ISBN=\""+ISBN+"\"");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")) return ERROR;
		}
		rs.close();
		
		String qrl="delete from book where ISBN=\""+ISBN+"\"";
		stat.execute(qrl);
		rs.close();stat.close();connect.close();
		return SUCCESS;
	}
	
	public String modify() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from book where ISBN=\""+ISBN+"\"");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")){
				result="ͼ�鲻���ڣ�";
				return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("select AuthorID from author where Name=\""+author+"\"");
		while(rs.next()){
			AuthorID=rs.getString(1);
		}
		rs.close();
		
		if(AuthorID==null){
			result="�������������ڣ��Ƿ��½�������Ϣ��";//dataMap.put("result", result);
			return SUCCESS;
		}
		
		rs=stat.executeQuery("select * from book where ISBN='"+ISBN+"'");
		String[] info=new String[6];
		while(rs.next()){
			for(int i=0;i<6;i++)
				info[i]=rs.getString(i+1);
		}
		rs.close();
		
        /*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");  
        java.util.Date d = null;  
        try {  
            d = format.parse(publishDate);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        java.sql.Date date = new java.sql.Date(d.getTime()); */
		//rs=stat.executeQuery("select * from book where ISBN=\""+ISBN+"\"");
		//rs.close();
        
		//int q=stat.executeUpdate("delete from book where ISBN=\""+ISBN+"\"");
		
		
        //System.out.println(AuthorID);
        if((!"".equals(author))&&(!AuthorID.equals(info[2]))){
        	int q=stat.executeUpdate("update book set AuthorID='"+AuthorID+"' where ISBN='"+ISBN+"'");
        	if(q!=1){
        		result="����ʧ��!";return SUCCESS;
        	}
        }
        if((!"".equals(publisher))&&(!publisher.equals(info[3]))){
        	int q=stat.executeUpdate("update book set publisher='"+publisher+"' where ISBN='"+ISBN+"'");
        	if(q!=1){
        		result="����ʧ�ܣ�";return SUCCESS;
        	}
        }
        if((!"".equals(publishDate))&&(!publishDate.equals(info[4]))){
        	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");  
            java.util.Date d = null;  
            try {  
                d = format.parse(publishDate);  
            } catch (Exception e) { 
            	System.out.println("���ڸ�ʽ����ȷ��");
                e.printStackTrace();  
            }  
            java.sql.Date date = new java.sql.Date(d.getTime());
            
        	PreparedStatement pstmt=connect.prepareStatement("update book set publishDate=? where ISBN=?");
        	pstmt.setDate(1, date);
        	pstmt.setString(2, ISBN);
        	int q=pstmt.executeUpdate();
        	if(q!=1){
        		result="����ʧ�ܣ����������ڸ�ʽ����ȷ";return SUCCESS;
        	}
        }
        if((!"".equals(price))&&(!price.equals(info[5]))){
        	PreparedStatement pstmt=connect.prepareStatement("update book set price=? where ISBN=?");
        	pstmt.setFloat(1, (float) Double.parseDouble(price));
        	pstmt.setString(2, ISBN);
        	pstmt.executeUpdate();
        	//int q=stat.executeUpdate("update book set price="+(float)Double.parseDouble(price)+" where ISBN="+ISBN+"'");
        }
        /*PreparedStatement pstmt=connect.prepareStatement("insert into book values(?,?,?,?,?,?)");
        pstmt.setString(1, ISBN);
        pstmt.setString(2, title);
        pstmt.setString(3, AuthorID);
        pstmt.setString(4, publisher);
        pstmt.setString(5, publishDate);
        pstmt.setFloat(6, (float) Double.parseDouble(price));
        pstmt.executeUpdate();*/
        
		//PreparedStatement pstmt=connect.prepareStatement("update book set ")
		//"update book set AuthorID=\""+AuthorID+"\","
				//+ "publisher=\""+publisher+"\",publishDate=\""+date+"\",price="+price+" where ISBN=\""+ISBN+"\"";
		//rs=stat.executeQuery(query);
		result="���³ɹ���";//dataMap.put("result", result);
		return SUCCESS;
	}
	
	public String addAuthor() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from author where AuthorID=\""+AuthorID+"\"");
		while(rs.next()){
			String count=rs.getString(1);
			if(count!="0"){
				result="�������Ѵ��ڣ�";
				return SUCCESS;
			}
		}
		rs.close();
		
		stat.executeQuery("inert into author values(\""+AuthorID+"\",\""+author+"\",\""+Age+"\",\""+Country+"\")");
		result="���ӳɹ�!";
		return SUCCESS;
	}
	
	public String addBook() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from book where ISBN=\""+ISBN+"\"");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")){
				result="����Ŀ�Ѵ��ڣ�";
				return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("insert into book values(\""+ISBN+"\",\""+title+"\",\""+AuthorID+"\",\""+publisher+"\")"
		+"\",\""+publishDate+"\",\""+price+"\")");
		result="���ӳɹ���";
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
}
