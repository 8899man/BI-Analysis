/**   
 * @Title: AuthInterceptor.java 
 * @Package com.dfzy.auth 
 * @Description: (权限控制拦截器) 
 * @author lit  
 * @date 2014年8月8日 下午3:37:12 
 * @version V1.0   
 */
package com.sxit.mgt.auth.aop;

import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.utils.JsonUtils;
import com.sxit.config.SysConfig;

/**
 * @ClassName: AuthInterceptor
 * @Description: (权限控制拦截器)
 * @author 张如兵
 * @date 2014年8月8日 下午3:37:12
 * 
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		// 第一步 获取注解
		AuthPassport authPassport = ((HandlerMethod) handler)
				.getMethodAnnotation(AuthPassport.class);

		// 如果注解为空,则不需要验证
		if (authPassport == null) { // 没有加权限控制代码
			return true;
		}

		// 第二步 ：session验证
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("baseUser") == null) {
			returnJsonMsg(ResultMessage.errorMsg("登录过期", 3), response);
			return false;
		}

		// 第三步：权限验证
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {

			// 获取方法返回类型
			Class returnType = ((HandlerMethod) handler).getReturnType()
					.getParameterType();
			String rename = returnType.getName();
			if (authPassport.rightCode().equalsIgnoreCase("common")) {
				return true;
			} else {
				Set<String> rightSet = (Set<String>) session
						.getAttribute("rightSet");

				if (rightSet == null || rightSet.isEmpty()) {
					// 返回到登录界面
					response.sendRedirect(SysConfig.webUrl + "/auth/login");
					return false;
				} else// 权限代码验证
				{
					String rightcode = authPassport.rightCode().toLowerCase()
							.trim();

					if (rightSet.contains(rightcode)) {
						return true;
					} else {
						if (rename
								.equalsIgnoreCase("com.sxit.mgt.common.vo.ResultMessage")) {

							returnJsonMsg(ResultMessage.errorMsg("无权限", 4),
									response);

						} else {
							response.sendRedirect(SysConfig.webUrl
									+ "/auth/nopower");
						}
						return false;
					}
				}
			}
		} else {
			return true;
		}
	}

	/**
	 * @Title: returnJsonMsg
	 * @Description: (返回Json消息)
	 * @param msg
	 * @param response
	 * @return void
	 * @throws
	 */
	public void returnJsonMsg(ResultMessage res, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/json;charset=utf-8");
			response.setCharacterEncoding("utf-8");

			String msg = JsonUtils.toJson(res);
			out.print(msg);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
}
