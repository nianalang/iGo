package com.igo.utils;
/**
 * 通过画笔画出验证码的内容
 */
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

/**
 * Servlet implementation class CreateCode
 */
@WebServlet("/CreateCode")
public class CreateCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//7.禁止浏览器缓存随机图片
		response.setDateHeader("Expires", -1);
		response.setHeader("Cache-Contral", "no-cache");
		response.setHeader("Pragma",  "no-cache");
		//6.通知浏览器以图片的形式打开发送过去的数据
		response.setHeader("Content-Type", "image/jpeg");
		//1.在内存中创建一幅图片
		BufferedImage image=new BufferedImage(80, 30,BufferedImage.TYPE_INT_RGB);
		//2.在图片上写上数据
		Graphics graphics=image.getGraphics();
		//设置背景色
		graphics.setColor(new Color(237, 239, 240));
		graphics.fillRect(0, 0, 80, 30);
		//3.设置写入数据的颜色和背景
		graphics.setColor(new Color(224, 59, 118));
		graphics.setFont(new Font(null, Font.BOLD, 20));
		//4.在图片上写数据
		String num=(String) request.getSession().getAttribute("checkCode");
		//将随机产生的数据保存到session中
		//request.getSession().setAttribute("checkCode", num);
		graphics.drawString(num, 0, 20);
		//将写好的数据输出给浏览器
		ImageIO.write(image, "jpg",response.getOutputStream());
	}

	public String makeNum() {
		// TODO Auto-generated method stub
		Random random=new Random();
		String num=random.nextInt(9999)+"";
		StringBuffer sBuffer=new StringBuffer();
		//如果不够四位，前面补零
		for(int i=0;i<4-num.length();i++){
			sBuffer.append("0");
		}
		num=sBuffer.toString()+num;
		return num;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

