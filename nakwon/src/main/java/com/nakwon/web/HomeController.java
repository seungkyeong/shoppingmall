package com.nakwon.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nakwon.domain.ManagerVO;
import com.nakwon.service.ManagerService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ManagerService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "project/location/location";
	}
	
	//濡쒓렇�씤 �럹�씠吏� 吏꾩엯
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "project/manager/login";
	}
	
	//濡쒓렇�씤 泥댄겕
	@RequestMapping(value="/logincheck",method=RequestMethod.POST)
	public String logincheck(HttpServletRequest request, ManagerVO vo, RedirectAttributes rttr) throws Exception {
//		System.out.println("login 硫붿꽌�뱶 吏꾩엯");
//		System.out.println("�쟾�떖�맂 �뜲�씠�꽣 : "+vo);
		
		HttpSession session = request.getSession();
		ManagerVO lvo = service.login(vo);
		
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result",result);
			return "redirect:/login";
		}
		
		session.setAttribute("member", lvo); //�엫�떆肄붾뱶 �떊寃� �꽩�꽩
		
		return "redirect:/managerMain"; //�꽦怨� �떆 愿�由ъ옄 硫붿씤�쑝濡� �씠�룞
	}
	//愿�由ъ옄�럹�씠吏� 硫붿씤
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain(Locale locale, Model model) {
		
		return "project/manager/Main/managerMain";
	}
	
}