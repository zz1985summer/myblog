package com.zz.myblog.util;

	
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;




public class Md5PasswordEncoder {
	public String encode(String password) {
		MessageDigest md =null;
		String result="";
		
		try {
			md = MessageDigest.getInstance( "MD5" );
			byte[] b=md.digest(password.getBytes("UTF-8"));
			result = getString(b);
//			md.update(password.getBytes());
//			BigInteger hash = new BigInteger(1, md.digest());
//		    result = hash.toString(16);
//		    while(result.length() < 32) { //40 for SHA-1
//		       result = "0" + result;
//		    }
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return result;
		
	}
	
	
	private static String getString( byte[] bytes ) 
	{
	  StringBuffer sb = new StringBuffer();
	  for( int i=0; i<bytes.length; i++ )     
	  {
	     byte b = bytes[ i ];
	     String hex = Integer.toHexString((int) 0x00FF & b);
	     if (hex.length() == 1) 
	     {
	        sb.append("0");
	     }
	     sb.append( hex );
	  }
	  return sb.toString();
	}
	
	
}
