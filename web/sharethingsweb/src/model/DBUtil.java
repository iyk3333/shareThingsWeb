package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DBUtil {
	public static ResultSet findUser(Connection con, String mid) {
		String sqlSt = "SELECT * FROM customer WHERE id=";

		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt + "'" + mid + "'")) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void addMember(Connection con, String mid, String passwd, String name,
	         String phone, String email, String address) throws SQLException {
	      // TODO Auto-generated method stub
	      PreparedStatement pstmt = null;
	      
	      try {
	         con.setAutoCommit(false);
	         
	         pstmt = con.prepareStatement("INSERT INTO customer(id, passwd, name, phone, email, address) VALUES(?, ?, ?, ?, ?, ?)");
	         pstmt.setString(1, mid);
	         pstmt.setString(2, passwd);
	         pstmt.setString(3, name);
	         pstmt.setString(4, phone);
	         pstmt.setString(5, email);
	         pstmt.setNString(6, address);
	         
	         pstmt.executeUpdate();
	         con.commit();
	         con.setAutoCommit(true);
	      } 
	      catch (SQLException e) {
	         e.printStackTrace();
	      } 
	      finally {
	         if (pstmt != null) pstmt.close();
	      }
	   }
	
	public static ResultSet findIDPW(Connection con, String email) {
		String sqlSt = "SELECT * FROM customer WHERE email=";

		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt + "'" + email + "'")) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void addExchange(Connection con, int customerNo) {
		PreparedStatement pstmt = null;
		String sqlSt = "select * from product order by uploadTime DESC limit 1";
		ResultSet rs = null;
		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt )) {
				rs = st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int productNo=-1;
		try {
			if(rs!=null) {
				while(rs.next()) {
					productNo = Integer.parseInt(rs.getString("productNo"));
				}
			}
			
			con.setAutoCommit(false);
			pstmt = con.prepareStatement("INSERT INTO exchange (customerNo,productNo) VALUES (?, ?)");
			pstmt.setInt(1, customerNo);
			pstmt.setInt(2, productNo);
			
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public static void addExchangeProduct(Connection con,int customerNo, String category, String name,  String file, String opponentproduct, String information, String day,String now) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement("INSERT INTO product(customerNo, productCategory, productName,productImgURL, opponentproduct, productInformation,lendingPeriod,uploadTime) VALUES (?,?, ?, ?,?,?,?,?)");
			
			pstmt.setInt(1, customerNo);
			pstmt.setString(2, category);
			pstmt.setString(3, name);
			pstmt.setString(4, file);
			pstmt.setString(5, opponentproduct);
			pstmt.setString(6, information);
			pstmt.setString(7, day);
			pstmt.setString(8, now);
			
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
			
			
			addExchange(con,customerNo);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
		}
	
	}
	
	public static void addRental(Connection con, int customerNo) {
		PreparedStatement pstmt = null;
		String sqlSt = "select * from product order by uploadTime DESC limit 1";
		ResultSet rs = null;
		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt )) {
				rs = st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int productNo=-1;
		try {
			if(rs!=null) {
				while(rs.next()) {
					productNo = Integer.parseInt(rs.getString("productNo"));
				}
			}
			
			con.setAutoCommit(false);
			pstmt = con.prepareStatement("INSERT INTO rental (customerNo,productNo) VALUES (?, ?)");
			pstmt.setInt(1, customerNo);
			pstmt.setInt(2, productNo);
			
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public static void addBorrowProduct(Connection con, int customerNo, String category, String name, String price, String day, String file,String productInformation, String now) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement("INSERT INTO product(customerNo, productCategory, productName,productImgURL, productInformation,price, uploadTime, lendingPeriod) VALUES (?, ?, ?, ?, ?,?,?,?)");
			
			pstmt.setInt(1, customerNo);
			pstmt.setString(2, category);
			pstmt.setString(3, name);
			pstmt.setString(4, file);
			pstmt.setString(5, productInformation);
			pstmt.setString(6, price);
			pstmt.setString(7, now);
			pstmt.setString(8, day);
			
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
			
			
			addRental(con,customerNo);
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
		}
	}
	
	public static ResultSet getBorrowProductList(Connection con) {
		String sqlSt = "SELECT * FROM product where productNo in (select productNo from rental)";

		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public static ResultSet getExchangeProductList(Connection con) {
		String sqlSt = "SELECT * FROM product where productNo in (select productNo from exchange)";

		Statement st;
		try {
			st = con.createStatement();

			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static void storeTime(Connection con,int custid, String date) throws SQLException {				
	PreparedStatement pstmt = null;
		
		try {
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement("UPDATE customer set recentTime = '"+date+"' where customerNo="+custid+"");
			
			
			
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
		
		}
	}
	public static ResultSet findRecommendationProduct(Connection con,int customerNo) {
		String sql = "select * from recommendationProduct where customerNo="+customerNo;
		
		Statement st= null;
		try {
			st = con.createStatement();
			if(st.execute(sql)) {
				return st.getResultSet();
				//ResultSet rs = st.getResultSet();
				//String pName = rs.getString("productName");
				//if(st.execute(sql+"'%"+pName+"%'")) return st.getResultSet();
			} 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static ArrayList<String> findRecommendation(Connection con, int customerNo) throws SQLException {
		//String sql = "select * from product where productName in (select productName from recommendationProduct where customerNo="+customerNo+")";
		//String sql = "select * from product where productName like '%(select productName from recommendationProduct where customerNo="+customerNo+")%'";
		ResultSet rp = findRecommendationProduct(con,customerNo);
		ArrayList<String> productName = new ArrayList<String>();
		if(rp!=null) {
			while(rp.next()) {
				productName.add(rp.getString("productName"));
			}
		}
		
		ArrayList<String> productNo = new ArrayList<String>();
		
		for(int i=0;i < productName.size();i++) {
			String sql = "select * from product where productName like '%"+productName.get(i)+"%'";
			Statement st= null;
			try {
				st = con.createStatement();
				if(st.execute(sql)) {
					ResultSet rs = st.getResultSet();
					if(rs!=null) {
						while(rs.next()) {
							productNo.add(rs.getString("productNo"));
						}
					}
					
					//ResultSet rs = st.getResultSet();
					//String pName = rs.getString("productName");
					//if(st.execute(sql+"'%"+pName+"%'")) return st.getResultSet();
				} 
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return productNo;
		
	}
	public static ResultSet searchCategory(Connection con, String category) {
	      String sqlSt = "SELECT * FROM product WHERE productCategory=";

	      Statement st;
	      try {
	         st = con.createStatement();

	         if (st.execute(sqlSt + "'" + category + "'")) {
	            return st.getResultSet();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
	   
	   
	   public static ResultSet getNotice(Connection con) {
	      String sqlSt = "SELECT * from notice order by noticeNo DESC";
	      
	      try {
	         Statement st = con.createStatement();
	         
	         if (st.execute(sqlSt)) {
	            return st.getResultSet();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
	   
	   public static void storeMyWant(Connection con,int customerNo, String productCategory,String productName,String productInformation,String uploadTime) throws SQLException {
		   PreparedStatement pstmt = null;
			
			try {
				con.setAutoCommit(false);
				
				pstmt = con.prepareStatement("INSERT INTO recommendationProduct (customerNo,productCategory,productName, productInformation, uploadTime) VALUES (?, ?, ?, ?, ?)");
				
				pstmt.setInt(1, customerNo);
				pstmt.setString(2, productCategory);
				pstmt.setString(3, productName);
				pstmt.setString(4, productInformation);
				pstmt.setString(5, uploadTime);
				
				pstmt.executeUpdate();
				con.commit();
				con.setAutoCommit(true);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) pstmt.close();
			}
	   }
	   public static ResultSet searhWord(Connection con,String name) {
		      //String sql = "select * from product where productName=";
		   	  String sql = "select * from product where productName like '%"+name+"%'";
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
		   }
	   
	   public static ResultSet findProduct(Connection con, int productNo) {
		   String sql = "select * from product where productNo=";
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql+productNo)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   
	   public static void increaseLike(Connection con, int productNo) throws SQLException {
		   String sql ="update product set productLike=productLike+1 where productNo="+productNo;
		   
		   PreparedStatement pstmt = null;
			
			try {
				con.setAutoCommit(false);
				
				pstmt = con.prepareStatement(sql);
			
				pstmt.executeUpdate();
				con.commit();
				con.setAutoCommit(true);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) pstmt.close();
			}
	   }
	   public static void completeDealBorrow(Connection con ,int productNo) throws SQLException {
		   String sql ="update product set deal=1 where productNo="+productNo+" and customerNo=(select customerNo from rental where productNo="+productNo+")";
		   
		   PreparedStatement pstmt = null;
			
			try {
				con.setAutoCommit(false);
				
				pstmt = con.prepareStatement(sql);
			
				pstmt.executeUpdate();
				con.commit();
				con.setAutoCommit(true);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) pstmt.close();
			}
	   }
	   
	   public static void completeDealExchange(Connection con ,int productNo) throws SQLException {
		   String sql ="update product set deal=1 where productNo="+productNo+" and customerNo=(select customerNo from exchange where productNo="+productNo+")";
		   
		   PreparedStatement pstmt = null;
			
			try {
				con.setAutoCommit(false);
				
				pstmt = con.prepareStatement(sql);
			
				pstmt.executeUpdate();
				con.commit();
				con.setAutoCommit(true);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) pstmt.close();
			}
	   }
	   
	   public static ResultSet findRecentProduct(Connection con) {
		   String sql = "select * from product order by uploadTime DESC limit 6";
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   
	   public static ResultSet allProduct(Connection con,int customerNo) {
		   String sql = "select * from product where customerNo="+customerNo;
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   public static ResultSet allRecommendation(Connection con,int customerNo) {
		   String sql = "select * from recommendationProduct where customerNo=";
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql+customerNo)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   public static ResultSet findNotice(Connection con, int idx) {
	          String sqlSt = "SELECT title,uploadTime,explanation FROM notice WHERE noticeNo=" + idx;
	          
	          try {
	             Statement st = con.createStatement();
	             
	             if (st.execute(sqlSt)) {
	                return st.getResultSet();
	             }
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          return null;
	       }
	   
	   public static ResultSet allDealComplete(Connection con, int customerNo) {
		   String sql = "select * from product where customerNo="+customerNo+" and deal=1";
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   
	   public static ResultSet findPhone(Connection con, int productNo) {
		   String sql = "select phone from customer where customerNo in (select customerNo from product where productNo="+productNo+")";
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) return st.getResultSet();
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return null;
	   }
	   public static int checkBorrowExchange(Connection con, int productNo) {
		   String sql = "select * from rental where productNo="+productNo;
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) {
		        	 ResultSet s = st.getResultSet();
		        	 int p = -1;
		        	 if(s!=null) {
		        		 while(s.next()) {
		        			 p = s.getInt("productNo");
		        		 }
		        	 }
		        	 if(p>=1)
		        		 return 1;
		        	 else return 0;
		         }
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return 0;
	   }
	   public static int customerOfProduct(Connection con,int productNo) {
		   String sql = "select * from product where productNo="+productNo;
		      
		      Statement st=null;
		      try {
		         st=con.createStatement();
		         if(st.execute(sql)) {
		        	 ResultSet s = st.getResultSet();
		        	 int p = -1;
		        	 if(s!=null) {
		        		 while(s.next()) {
		        			 p = s.getInt("customerNo");
		        		 }
		        	 }
		        	 if(p>=1)
		        		 return p;
		        	 else return 0;
		         }
		      }catch(SQLException e) {
		    	  e.printStackTrace();
		      }
		      return 0;
	   }
}
