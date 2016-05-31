package t.o.servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import t.o.bean.DBfood;
import t.o.bean.foodBean;

public class foodadd extends HttpServlet {
	private String uploadPath = "..\\..\\images"; // 上传文件的目录
	private String tempPath = "d:\\12"; // 临时文件目录

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("adminName")==null){
			response.getWriter().write("<script language='JavaScript'>" +
					"window.open('admin/login.jsp',target='_top');" + 
					"</script>"
					);
			}
		
		String path = request.getContextPath();
		String filePath=this.getServletConfig().getServletContext().getRealPath("/");
		String food_no = null;
		String food_name = null;
		String food_type = null;
		String food_price = null;
		String food_cook = null;
		String food_synopsis = null;
		String food_remark = null;
		try {
			DiskFileUpload fu = new DiskFileUpload();
			// 设置最大文件尺寸，这里是4MB
			fu.setSizeMax(4194304);
			// 设置缓冲区大小，这里是4kb
			fu.setSizeThreshold(4096);
			// 设置临时目录：
			fu.setRepositoryPath(filePath+"/images/tmp");

			// 得到所有的文件：
			List fileItems = fu.parseRequest(request);//解析用户请求的参数,取出文件上传信息
			Iterator i = fileItems.iterator();
			// 依次处理每一个文件：
			while(i.hasNext()) {
				FileItem item = (FileItem)i.next();
				//检查是一个普通的表单域还是File组件
				if( !item.isFormField() ){
					//item.getName 返回的是完整的文件名，如:E:\\xx\11.doc
					//所以这里用一个fullFile来取文件名
					File fullFile = new File(item.getName());
					File uploadedFile = new File(filePath+"/images/foodimg/"+food_no+".jpg");
					item.write(uploadedFile);
//					System.out.println(filePath);
				}
				if("food_no".equals(item.getFieldName())){
					food_no = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_no+"<br>");
				}
				if("food_name".equals(item.getFieldName())){
					food_name = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_name+"<br>");
				}
				if("food_type".equals(item.getFieldName())){
					food_type = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_type+"<br>");
				}
				if("food_price".equals(item.getFieldName())){
					food_price = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_price+"<br>");
				}
				if("food_cook".equals(item.getFieldName())){
					food_cook = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_cook+"<br>");
				}		
				if("food_synopsis".equals(item.getFieldName())){
					food_synopsis = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_synopsis+"<br>");
				}
				if("food_remark".equals(item.getFieldName())){
					food_remark = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					out.println(food_remark+"<br>");
				}
			}
		}
		catch(Exception e) {
			// 可以跳转出错页面
			out.print(e.toString());
		}
		String sql = "insert into t_o_Food values(NULL,'"+food_no+"','"+food_name+"','"+food_type+"','"+food_price+"','"+food_cook+"','"+food_synopsis+"','"+food_remark+"')";
		int result = DBfood.uploadFood(sql);
		if(result>0){
			foodBean foodbean = new foodBean(food_no,food_name,food_type,food_price,food_cook,food_synopsis,food_remark);
			request.setAttribute("foodaddshow", foodbean);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/foodaddshow.jsp");
			dispatcher.forward(request, response);
		}
		else{
			out.print("提交失败！");
		}
		out.println("<a href='a_food_food_add.jsp'>返回</a>");
	}
}
