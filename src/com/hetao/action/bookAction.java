/*
 * @(#)webProject --- bookAction.java 
 */
package com.hetao.action;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author 何涛
 * @version 1st   on 2017年9月19日
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
	
	public String BookIsExit() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from book where title=\""+title+"\"");
		while(rs.next()){
			int q=rs.getInt(1);
			if(q==0){
				result="书籍不存在!";return SUCCESS;
			}
		}
		rs.close();
		
		result="true";
		return SUCCESS;
	}
	
	public String AuthorIsExit() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from author where Name=\""+author+"\"");
		while(rs.next()){
			int q=rs.getInt(1);
			if(q==0){
				result="作者不存在!";return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("select * from author where name=\""+author+"\"");
		String id="";
		while(rs.next()){
			id=rs.getString(1);
		}
		rs.close();
		
		rs=stat.executeQuery("select count(*) from book where AuthorID='"+id+"'");
		while(rs.next()){
			int count=rs.getInt(1);
			if(count==0){
				result="作者字条未添加作品！";return SUCCESS;
			}
		}
		rs.close();
		
		result="true";return SUCCESS;
	}
	
	public String DetailOfBook() throws ClassNotFoundException, SQLException{
		ISBN=request.getParameter("ISBN");
		AuthorID=request.getParameter("AuthorID");
		
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		
		if(AuthorID==null){
			ResultSet rs=stat.executeQuery("select AuthorID from book where ISBN=\""+ISBN+"\"");
			while(rs.next()){
				AuthorID=rs.getString(1);
			}
		}
		
		ResultSet rs=stat.executeQuery("select * from book where ISBN=\""+ISBN+"\"");
		LinkedList<String> resultJSON=new LinkedList<>();
		while(rs.next()){
			for(int i=0;i<6;i++)
				resultJSON.add(rs.getString(i+1));
		}
		request.setAttribute("result", resultJSON);
		rs.close();
		
		connect=DriverManager.getConnection(url,"root","www.12358.com");
		stat=(Statement) connect.createStatement();
		rs=stat.executeQuery("select * from author where AuthorID=\""+AuthorID+"\"");
		LinkedList<String> authorInfo=new LinkedList<String>();
		while(rs.next()){
			for(int i=0;i<4;i++)
				authorInfo.add(rs.getString(i+1));
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
		ArrayList<String> ids=new ArrayList<>();
		while(rs.next()){
			ids.add(rs.getString(1));
		}
		rs.close();
		ArrayList<String[]> queryResult = new ArrayList<String[]>();
		for(String id:ids){
			rs=stat.executeQuery("select * from book where AuthorID=\""+id+"\"");
			String[] record = new String[7];
			while(rs.next()){
				for(int i=0;i<6;i++)
					record[i] = rs.getString(i+1);
				record[6]=author;
				queryResult.add(record);
			}
		}
		if(queryResult.isEmpty()) return ERROR;
		rs.close();stat.close();connect.close();
		request.setAttribute("result", queryResult);
		return SUCCESS;
	}
	
	public String queryByBook() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select * from book where title=\""+title+"\"");
		result="";
		while(rs.next()){
			for(int i=0;i<6;i++)
				result+=rs.getString(i+1)+"~";
			result+=author+"!";
		}
		rs.close();stat.close();connect.close();
		request.setAttribute("result", result);
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
			if(count.equals("0")){
				result="删除失败！";return SUCCESS;
			}
		}
		rs.close();
		
		String qrl="delete from book where ISBN=\""+ISBN+"\"";
		stat.execute(qrl);
		rs.close();stat.close();connect.close();
		result="删除成功！";
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
				result="图书不存在！";
				return SUCCESS;
			}
		}
		rs.close();

		rs=stat.executeQuery("select count(*) from author where AuthorID=\""+AuthorID+"\"");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")){
				result="作者字条不存在！是否新建作者信息？";
				return SUCCESS;
			}
		}
		rs.close();
		
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
        		result="更新失败!";return SUCCESS;
        	}
        }
        if((!"".equals(publisher))&&(!publisher.equals(info[3]))){
        	int q=stat.executeUpdate("update book set publisher='"+publisher+"' where ISBN='"+ISBN+"'");
        	if(q!=1){
        		result="更新失败！";return SUCCESS;
        	}
        }
        if((!"".equals(publishDate))&&(!publishDate.equals(info[4]))){
        	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");  
            java.util.Date d = null;  
            try {  
                d = format.parse(publishDate);  
            } catch (Exception e) { 
            	System.out.println("日期格式不正确！");
                e.printStackTrace();  
            }  
            java.sql.Date date = new java.sql.Date(d.getTime());
            
        	PreparedStatement pstmt=connect.prepareStatement("update book set publishDate=? where ISBN=?");
        	pstmt.setDate(1, date);
        	pstmt.setString(2, ISBN);
        	int q=pstmt.executeUpdate();
        	if(q!=1){
        		result="更新失败！可能是日期格式不正确";return SUCCESS;
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
		result="更新成功！";//dataMap.put("result", result);
		return SUCCESS;
	}
	
	public String addAuthor() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from author where AuthorID=\""+AuthorID+"\"");
		while(rs.next()){
			int count=rs.getInt(1);
			if(count!=0){
				result="作者名已存在！";
				return SUCCESS;
			}
		}
		rs.close();
		PreparedStatement pstmt=connect.prepareStatement("insert into author values(?,?,?,?)");
		pstmt.setString(1, AuthorID);
		pstmt.setString(2, author);
		pstmt.setInt(3, Integer.parseInt(Age));
		pstmt.setString(4, Country);
		pstmt.executeUpdate();
		result="添加成功!";
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
				result="该书目已存在！";
				return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("insert into book values(\""+ISBN+"\",\""+title+"\",\""+AuthorID+"\",\""+publisher+"\")"
		+"\",\""+publishDate+"\",\""+price+"\")");
		result="添加成功！";
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
}

