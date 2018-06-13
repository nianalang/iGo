package com.igo.factory;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.util.Properties;

//DAO工厂，用来生产DAO实例，使Service与DAO完全解耦合
public class DAOFactory {

	private static String simpleName=null;
	private  static Properties properties=null;
	//使用静态块获取dao.properties
	static{
		properties=new Properties();
		try {
			//得到文件路径
			properties.load(DAOFactory.class.getClassLoader().getResourceAsStream("dao.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//通过接口名和connection得到实例对象
	public static <T> T createDao(Class<T> interfaceName){//UserDao.class
		//System.out.println(interfaceName);
		//得到接口名
		simpleName=interfaceName.getSimpleName();//UserDao
		//System.out.println(simpleName+"ccc");
		//得到映射端口里的完整类名
		String className=properties.getProperty(simpleName);
		//使用完整类名生产实例
		 T Object=null;
		try {
			Object=(T)Class.forName(className).newInstance();
		} catch (Exception e){
			// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return  Object;
	}
}
