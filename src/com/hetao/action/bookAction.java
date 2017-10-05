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
import java.util.TreeMap;

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
	
	public String BookIsExist() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from Book where Title=\""+title+"\"");
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
	
	public String AuthorIsExist() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from Author where Name=\""+author+"\"");
		while(rs.next()){
			int q=rs.getInt(1);
			if(q==0){
				result="作者不存在!";return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("select * from Author where Name=\""+author+"\"");
		String id="";
		while(rs.next()){
			id=rs.getString(1);
		}
		rs.close();
		
		rs=stat.executeQuery("select count(*) from Book where AuthorID='"+id+"'");
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
		String check=request.getParameter("check");
		request.setAttribute("check", check);
		
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		
		if(AuthorID==null){
			ResultSet rs=stat.executeQuery("select AuthorID from Book where ISBN=\""+ISBN+"\"");
			while(rs.next()){
				AuthorID=rs.getString(1);
			}
		}
		
		ResultSet rs=stat.executeQuery("select * from Book where ISBN=\""+ISBN+"\"");
		LinkedList<String> resultJSON=new LinkedList<>();
		while(rs.next()){
			for(int i=0;i<6;i++)
				resultJSON.add(rs.getString(i+1));
		}
		request.setAttribute("result", resultJSON);
		rs.close();
		
		rs=stat.executeQuery("select * from Author where AuthorID=\""+AuthorID+"\"");
		LinkedList<String> authorInfo=new LinkedList<String>();
		while(rs.next()){
			for(int i=0;i<4;i++)
				authorInfo.add(rs.getString(i+1));
		}
		request.setAttribute("authorInfo", authorInfo);
		rs.close();stat.close();connect.close();
		return SUCCESS;
	}
	
	public String QueryByAuthor() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		PreparedStatement pstmt=connect.prepareStatement("select * from Author where Name=?");
		pstmt.setString(1, author);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<String> ids=new ArrayList<>();
		while(rs.next()){
			ids.add(rs.getString(1));
		}
		rs.close();
		ArrayList<String[]> queryResult = new ArrayList<String[]>();
		for(String id:ids){
			pstmt=connect.prepareStatement("select * from Book where AuthorID=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			String[] record = new String[7];
			while(rs.next()){
				for(int i=0;i<6;i++)
					record[i] = rs.getString(i+1);
				record[6]=author;
				queryResult.add(record);
			}
		}
		if(queryResult.isEmpty()) return ERROR;
		String[] tmp=new String[1];tmp[0]="true";
		queryResult.add(tmp);
		rs.close();connect.close();
		request.setAttribute("result", queryResult);
		return SUCCESS;
	}
	
	public String queryByBook() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select ISBN from Book where Title='"+title+"'");
		
		LinkedList<String> isbns=new LinkedList<String>();
		while(rs.next()){
			isbns.add(rs.getString(1));
		}
		rs.close();
		ArrayList<String[]> queryInfo=new ArrayList<String[]>();
		for(String isbn:isbns){
			rs=stat.executeQuery("select * from Book where ISBN='"+isbn+"'");
			String[] record=new String[7];
			while(rs.next()){
				for(int i=0;i<6;i++)
					record[i]=rs.getString(i+1);
			}
			queryInfo.add(record);
			rs.close();
		}
		for(int i=0;i<queryInfo.size();i++){
			ResultSet query=stat.executeQuery("select Name from Author where AuthorID='"+queryInfo.get(i)[2]+"'");
			while(query.next()){
				queryInfo.get(i)[6]=query.getString(1);
			}
			query.close();
		}
		stat.close();connect.close();
		if(queryInfo.isEmpty())	return ERROR;
		String[] tmp=new String[1];tmp[0]="false";
		queryInfo.add(tmp);
		request.setAttribute("result", queryInfo);
		return SUCCESS;
	}
	

	public String deleteBook() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from Book where ISBN='"+ISBN+"'");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")){
				result="删除失败！";return SUCCESS;
			}
		}
		rs.close();
		
		String qrl="delete from Book where ISBN='"+ISBN+"'";
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
		ResultSet rs=stat.executeQuery("select count(*) from Book where ISBN='"+ISBN+"'");
		while(rs.next()){
			String count=rs.getString(1);
			if(count.equals("0")){
				result="图书不存在！";
				return SUCCESS;
			}
		}
		rs.close();
		
		if(AuthorID!=""){
			rs=stat.executeQuery("select count(*) from Author where AuthorID='"+AuthorID+"'");
			while(rs.next()){
				String count=rs.getString(1);
				if(count.equals("0")){
					result="作者字条不存在！是否新建作者信息？";
					return SUCCESS;
				}
			}
			rs.close();
		}
		
		rs=stat.executeQuery("select * from Book where ISBN='"+ISBN+"'");
		String[] info=new String[6];
		while(rs.next()){
			for(int i=0;i<6;i++)
				info[i]=rs.getString(i+1);
		}
		rs.close();
		
        if((!"".equals(AuthorID))&&(!AuthorID.equals(info[2]))){
        	int q=stat.executeUpdate("update Book set AuthorID='"+AuthorID+"' where ISBN='"+ISBN+"'");
        	if(q!=1){
        		result="更新失败!";return SUCCESS;
        	}
        }
        if((!"".equals(publisher))&&(!publisher.equals(info[3]))){
        	int q=stat.executeUpdate("update Book set Publisher='"+publisher+"' where ISBN='"+ISBN+"'");
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
            
        	PreparedStatement pstmt=connect.prepareStatement("update Book set PublishDate=? where ISBN=?");
        	pstmt.setDate(1, date);
        	pstmt.setString(2, ISBN);
        	int q=pstmt.executeUpdate();
        	if(q!=1){
        		result="更新失败！可能是日期格式不正确";return SUCCESS;
        	}
        }
        if((!"".equals(price))&&(!price.equals(info[5]))){
        	PreparedStatement pstmt=connect.prepareStatement("update Book set price=? where ISBN=?");
        	pstmt.setFloat(1, (float) Double.parseDouble(price));
        	pstmt.setString(2, ISBN);
        	pstmt.executeUpdate();
        }
        result="更新成功！";
		return SUCCESS;
	}
	
	public String addAuthor() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/bookdb";
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		ResultSet rs=stat.executeQuery("select count(*) from Author where AuthorID='"+AuthorID+"'");
		while(rs.next()){
			int count=rs.getInt(1);
			if(count!=0){
				result="作者ID已存在！";
				return SUCCESS;
			}
		}
		rs.close();
		PreparedStatement pstmt=connect.prepareStatement("insert into Author values(?,?,?,?)");
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
		ResultSet rs=stat.executeQuery("select count(*) from Book where ISBN='"+ISBN+"'");
		while(rs.next()){
			int count=rs.getInt(1);
			if(count!=0){
				result="该ISBN已存在！";
				return SUCCESS;
			}
		}
		rs.close();
		
		rs=stat.executeQuery("select count(*) from Author where AuthorID='"+AuthorID+"'");
		while(rs.next()){
			int count=rs.getInt(1);
			if(count==0){
				result="作者字条不存在！是否新建作者信息？";
				return SUCCESS;
			}
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");  
        java.util.Date d = null;  
        try {  
            d = format.parse(publishDate);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        java.sql.Date date = new java.sql.Date(d.getTime());
		//int q=stat.executeUpdate("insert into Book values('"+ISBN+"','"+title+"','"+AuthorID+"','"+publisher+"','"+publishDate+"','"+price+"')");
		PreparedStatement pstmt=connect.prepareStatement("insert into Book values(?,?,?,?,?,?)");
		pstmt.setString(1, ISBN);
		pstmt.setString(2, title);
		pstmt.setString(3, AuthorID);
		pstmt.setString(4, publisher);
		pstmt.setDate(5, date);
		pstmt.setFloat(6, (float) Double.parseDouble(price));
		int q=pstmt.executeUpdate();
		if(q==1)	result="添加成功！";
		else result="添加失败！";
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
}

