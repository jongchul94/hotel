package com.exe.hotel;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.text.DecimalFormat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.exe.dao.EventDAO;
import com.exe.dao.EventReviewDAO;
import com.exe.dao.GalleryDAO;
import com.exe.dao.HotelBookingDAO;
import com.exe.dao.HotelUserDAO;
import com.exe.dao.ReviewDAO;
import com.exe.dao.RoomDAO;
import com.exe.dao.SpaDAO;

import com.exe.dto.EventBookingDTO;
import com.exe.dto.EventCheckDTO;
import com.exe.dto.EventDTO;
import com.exe.dto.EventReviewDTO;
import com.exe.dto.GalleryDTO;
import com.exe.dto.HotelBookingDTO;
import com.exe.dto.HotelUserDTO;
import com.exe.dto.LessonUserDTO;
import com.exe.dto.LoginDTO;
import com.exe.dto.ReviewDTO;
import com.exe.dto.RoomDTO;
import com.exe.dto.SpaDTO;
import com.exe.hotel.mail.MailAuthKeyGenerator;
import com.exe.hotel.mail.MailHandler;

@Controller
public class HotelController {

	@Autowired
//	@Qualifier("hotelUserDAO")
	HotelUserDAO userDao;

	@Autowired
//	@Qualifier("galleryDAO")
	GalleryDAO galleryDao;

	@Autowired
//	@Qualifier("reviewDAO")
	ReviewDAO reviewDao;

	@Autowired
//	@Qualifier("eventDAO")
	EventDAO eventDao;

	@Autowired
//	@Qualifier("eventReviewDAO")
	EventReviewDAO eventReviewDAO;

	@Autowired
	RoomDAO rdao;

	@Autowired
	HotelBookingDAO hdao;
	
	@Autowired
	SpaDAO spaDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(HttpServletRequest request) {

		List<GalleryDTO> lists= galleryDao.getList();

		request.setAttribute("lists",lists );

		return "index";
	}
	
	@RequestMapping(value = "/indexImage", method = {RequestMethod.GET,RequestMethod.POST})
	public String indexImage(HttpServletRequest request) {

		return "indexImage";
		
		
	}
	
	//id�ߺ� üũ
	@RequestMapping(value = "/idDupCheck.action", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String idDupCheck(
			@RequestParam String paramId) 
					throws Exception{
		
		int result = -1;
		String checkedId = "";
		// �˻� ��, 0�̸� ��밡��, 1�̸� �ߺ�, -1�̸� �޼��� �۵�X, -2�̸� SQL �۵�X
		result = userDao.idDupCheck(paramId);
		
		if(result == 0) {
			checkedId = paramId;
		}else if(result == 1) {
			checkedId = "";
		}else {
			checkedId = "";
		}
		return checkedId;
	}
	
	//�̸��� ���� 
	@RequestMapping("signUpForm/emailCertify")
	public @ResponseBody String responseEmailCertify(@RequestParam String paramEmail) throws Exception {
		System.out.println("�������� ���� �ּ�: " + paramEmail);

		// ���� Ű ����
		String random_24_string = new MailAuthKeyGenerator().excuteGenerate();
		System.out.println("active_key ��: " + random_24_string);

		// ���� Ű �������� ���� ������(get)
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[it Hotel ȸ������ �̸��� ���� �����Դϴ� ]");
		sendMail.setText(new StringBuffer().append("<h1>�̸��� ������ �������ּ���</h1>").append("<h1><a href='http://localhost/hotel/emailActivate?u_email=")
				.append(paramEmail).append("&u_email_active_key=").append(random_24_string).append("' target='_blank'>�̸��� ���� ��ũ�Դϴ�</a></h1>").toString());
		sendMail.setFrom("peterjangyoungsub", "it hotel");
		sendMail.setTo(paramEmail);
		sendMail.send();
		
		return random_24_string;
	}
	
	
	@RequestMapping("emailActivate")
	public String responseEmailActivate(@RequestParam HashMap<String, Object> params) throws Exception {
		
		JOptionPane.showMessageDialog(null, "���̵� �̿��� �����մϴ�");
		
		return "redirect:/login.action";
		
	}

	//ȸ������
	@RequestMapping(value = "/signup.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView signUp() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("signup");
		return mav;
	}

	// ������ �μ�Ʈ�ϰ� �Ϸ�Ǿ��ٴ� �������� ���°�
	@RequestMapping(value = "/signup_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup_ok(HotelUserDTO dto, HttpServletRequest req, HttpServletResponse res) {

		
		userDao.insertUser(dto);

		return "redirect:/signupOk.action";
	}

	// ���� �Ϸ�Ǿ��ٰ� �����ִ� �޼���- �α��ι�ư ����
	@RequestMapping(value = "/signupOk.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupOk(HttpSession session) {
		
		return "signupOk";
	}

	//�α���
	@RequestMapping(value = "/login.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpSession session,HttpServletRequest request) {

		String referer = request.getHeader("Referer");	//���� ���
		
		String main ="/";
		
		if(referer!=null&&!referer.equals("")) {
			request.getSession().setAttribute("redirectURI", referer);
		}else {
			//�α��� �Ϸ��� �ٽ� �α���â���� ���� ����!! main index�� �������ش�.
			request.getSession().setAttribute("redirectURI", main);
		}
		return "login";
		
	}
	
	@RequestMapping(value = "/login_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login_ok(HotelUserDTO dto,HttpServletRequest request,HttpSession session) {

		String userId = dto.getUserId();
		String userPwd = dto.getUserPwd();

		ModelAndView mav = new ModelAndView();

		HotelUserDTO dto2 = userDao.getReadUserData(userId);

		String redirectURI = (String)session.getAttribute("redirectURI");

		System.out.println(redirectURI);
		
		if(dto2==null || !dto2.getUserPwd().equals(userPwd)) {

			mav.setViewName("login");
			mav.addObject("message", "���̵� Ȥ�� ��й�ȣ�� ��Ȯ�� �Է��ϼ���");

			return mav;
		}

		LoginDTO login = new LoginDTO();

		login.setUserId(dto2.getUserId());
		login.setUserName(dto2.getUserName());
		login.setUserEmail(dto2.getEmail());
		login.setTel(dto2.getTel());
		login.setBirth(dto2.getBirth());
		login.setAddr(dto2.getAddr());

		session.setAttribute("login", login);
		
		//ȸ������, ȸ�����ԿϷ�, �α��� ���������� �α��� ��ư�� ��������� ó��
		if(redirectURI.contains("signup.action") || 
			redirectURI.contains("signupOk.action") || 
			redirectURI.contains("login.action") || 
			redirectURI.contains("searchPwd.action")) {
			
			List<GalleryDTO> lists= galleryDao.getList();
			
			request.setAttribute("lists",lists );
			
			redirectURI = "/";
			
			mav.setView(new RedirectView(redirectURI,true));
			
			return mav;
		}
		
		mav.setView(new RedirectView(redirectURI,true));

		return mav;
	}

	//�α׾ƿ�
	@RequestMapping(value = "/logout.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpSession session) {

		String referer = request.getHeader("Referer");	//���� ���

		session.removeAttribute("login");
		
		if(referer.contains("login_ok.action")) {
			
			return "redirect:/";
		}
		
		return "redirect:" + referer;
	}

	//��й�ȣ ã��
	@RequestMapping(value = "/searchPwd.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPwd() {

		return "searchPwd";
	}

	@RequestMapping(value = "/searchPwd_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView searchPwd_ok(HotelUserDTO dto) {

		ModelAndView mav = new ModelAndView();

		String userId = dto.getUserId();
		String userTel = dto.getTel();

		HotelUserDTO dto2 = userDao.getReadUserData(userId);

		mav.setViewName("login");

		if (dto==null || !dto2.getTel().equals(userTel)) {

			mav.addObject("message", "��ġ�ϴ� ������ �����ϴ�.");

			return mav;
		}

		mav.addObject("message", "��й�ȣ�� ["+dto2.getUserPwd() + "] �Դϴ�.");

		return mav;
	}

	//About Us
	@RequestMapping(value = "/about.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String about() {

		return "about";
	}

	//Services
	@RequestMapping(value = "/service.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String service() {

		return "service";
	}

	//Gallery(�̹��� �Խ���)
	@RequestMapping(value = "/gallery.action", method = RequestMethod.GET)
	public ModelAndView gallery() {

		ModelAndView mav = new ModelAndView();

		List<GalleryDTO> lists = galleryDao.getList();

		mav.setViewName("gallery-3");
		mav.addObject("lists", lists);

		return mav;
	}

	//�̹��� ���
	@RequestMapping(value = "/galleryUpload.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String galleryUpload(HttpSession session) {
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		if(login == null || login.equals("") || !login.getUserId().equals("admin")) {
			return "404";
		}
		
		return "galleryUpload";
	}

	@RequestMapping(value = "/galleryUpload_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String galleryUpload_ok(
			MultipartHttpServletRequest request, 
			HttpServletRequest req,
			String str) {

		MultipartFile file = request.getFile("upload");

		String galleryName = req.getParameter("galleryName");
		String content = req.getParameter("content");
		String imageName = file.getOriginalFilename();

		GalleryDTO dto = new GalleryDTO();	//db�� ����ְ�

		int maxNum = galleryDao.getMaxNum();

		dto.setGalleryIndex(maxNum + 1);
		dto.setGalleryName(galleryName);
		dto.setContent(content);
		dto.setImageName(imageName);

		galleryDao.insertGallery(dto);

		//�������: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\gallery

		/*
		 * String path = request.getSession() .getServletContext()
		 * .getRealPath("/gallery");
		 */
		
		//hotelWeb -> HotelWebService
		Path path = Paths.get("D:\\sts-bundle\\work\\HotelWebService\\src\\main\\webapp\\resources\\images\\gallery");

		if(file!=null&&file.getSize()>0) { //������ ������

			try {

				FileOutputStream fos =
						new FileOutputStream(path +
								"/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) { 
						break; 
					}
					fos.write(buffer,0,data);  
				}
				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return "redirect:/gallery.action";
	}

	//���� ����
	@RequestMapping(value = "/pricing.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricing() {

		return "pricing";
	}

	//���� ���� ����Ʈ
	@RequestMapping(value = "/room-grid.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String roomgrid() {

		return "room-grid";
	}

	//���� ������
	@RequestMapping(value = "/room-details.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roomDetails(HttpSession session,HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("room-details");

		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(login!=null) {
			HotelUserDTO dto = userDao.getReadUserData(login.getUserId());
			mav.addObject("userDTO", dto);
		}

		if(request.getParameter("roomIndex")==null) {

			mav.setViewName("404");
			return mav;
		}

		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		int countReview = reviewDao.countReview(roomIndex);

		RoomDTO dto = rdao.getReadRoomData(roomIndex);

		// *****************************************************************************
		// review ���̺� �����Ͽ� review ���� ������ ���� ( ��ĥ �� ����� �� �κп� �־�� ��)
		// ******************************************************************************


		mav.setViewName("room-details");
		mav.addObject("dto",dto); // �ش� �� ��ü �ѱ�

		//����ڰ� �Է��� ���� ���
		mav.addObject("checkin", request.getParameter("checkin"));
		mav.addObject("checkout", request.getParameter("checkout"));
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));

		List<ReviewDTO> lists = reviewDao.getReviewList(roomIndex);

		mav.addObject("lists",lists);
		mav.addObject("roomIndex",roomIndex);
		mav.addObject("countReview", countReview);

		return mav;
	}

	@RequestMapping(value = "/room-details_ok.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomDetails_ok(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="arrList[]") List<Integer> deleteList,
			@RequestParam(value="pricePerNight") int pricePerNight )

	{
		HttpSession session = request.getSession();

		ModelAndView mav = new ModelAndView();		
		int total=0;


		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}    

		for(int data:deleteArray) {
			total +=data;
		}		

		mav.setViewName("room-details_ok");		
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		mav.addObject("arr", formatter.format(total+pricePerNight));
		

		session.setAttribute("total",total+pricePerNight); 

		return mav;
	}

	//Room-details�� review
	@RequestMapping(value = "/review.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String review(ReviewDTO dto,HttpServletRequest request) {

		String referer = request.getHeader("Referer");

		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));

		dto.setReviewNum(reviewDao.reviewMaxNum()+1);
		dto.setRoomNum(roomIndex);

		reviewDao.insertReviewData(dto);

		return "redirect:"+referer;
	}

	//Room-details�� review ����
	@RequestMapping(value = "/review-delete.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public String reviewDelete(HttpSession session,HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");

		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));

		reviewDao.deleteReviewData(reviewNum);

		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));

		return "redirect:"+referer;
	}

	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error() {

		return "404";
	}

	
	//�̺�Ʈ ����Ʈ=======================�̺�Ʈ=======================�̺�Ʈ=======================�̺�Ʈ=======================�̺�Ʈ=======================�̺�Ʈ
	@RequestMapping(value = "/event-grid.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventgrid() throws Exception {

		ModelAndView mav = new ModelAndView();

		try {
			//��ü ������ �̾Ƴ���
			List<EventDTO> lists = eventDao.getEventList();

			//��õ �̺�Ʈ 3�� �̾Ƴ���
			List<EventDTO> getReadEventListByAsc3 = 
					eventDao.getReadEventListByAsc3();
			mav.setViewName("event-grid");
			mav.addObject("listsRecommend", getReadEventListByAsc3);
			mav.addObject("lists", lists);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return mav;
	}

	//�̺�Ʈ �̱�(1���� �̺�Ʈ ����ֱ�)
	@RequestMapping(value = "/event-single.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventsingle(
			HttpServletRequest request) throws Exception{

		//�ε��� ��ȣ �޳���, 1���� ������ �̾Ƴ��� >> event-single�� �Ѱ��ֱ� 
		ModelAndView mav = new ModelAndView();
		
		try {
			
			int eventIndex = Integer.parseInt(request.getParameter("eventIndex"));
			
			EventDTO dto = eventDao.getReadEventData(eventIndex);
			dto.setContent1(dto.getContent1().replace("\n", "<br/>"));
			dto.setContent2(dto.getContent2().replace("\n", "<br/>"));
			dto.setContent3(dto.getContent3().replace("\n", "<br/>"));
			mav.setViewName("event-single");
			mav.addObject("dto",dto);

			//�̺�Ʈ ���� ���� ó��
			int countReview = eventReviewDAO.countReview(eventIndex);

			List<EventReviewDTO> lists = eventReviewDAO.getReviewList(eventIndex);

			mav.addObject("lists",lists);
			mav.addObject("eventIndex",eventIndex);
			mav.addObject("countReview", countReview);
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}

		return mav;		
	}

	//�̺�Ʈ ���
	@RequestMapping(value = "/event-upload.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventupload() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			mav.setViewName("event-upload"); 
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return mav;
	}

	@RequestMapping(value = "/event-upload_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String eventupload_ok(EventDTO dto, //dto�� �̺�Ʈ ���ε� ���� �����Ͱ� �Ѿ�´�.
			MultipartHttpServletRequest request, 
			HttpServletResponse response, 
			String str) throws Exception {

		try {
			
			MultipartFile file = request.getFile("eventUpload");

			//�Ѿ���� ��¥ ���� �����ֱ�
			String startDate = dto.getStartDate();
			String endDate = dto.getEndDate();

			// ��¥��ȯ
			String dates[] = dto.getStartDate().split("/");       
			startDate = dates[2]+"/"+dates[0]+"/"+dates[1];

			String dates2[] = dto.getEndDate().split("/");
			endDate = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

			dto.setEventIndex(eventDao.getMaxNum() +1);
			dto.setStartDate(startDate);
			dto.setEndDate(endDate);
			dto.setSavefileName( file.getOriginalFilename());

			eventDao.insertEvent(dto);

			Path path = Paths.get("D:\\sts-bundle\\work\\HotelWeb\\src\\main\\webapp\\resources\\images\\event");

			if(file!=null&&file.getSize()>0) { 

				try {

					FileOutputStream fos =
							new FileOutputStream(path+ 
									"/" + file.getOriginalFilename());

					InputStream is = file.getInputStream();

					byte[] buffer = new byte[512];

					while(true) {

						int data = is.read(buffer,0,buffer.length);

						if(data==-1) {
							break;
						}

						fos.write(buffer,0,data);
					}

					is.close();
					fos.close();
				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
		
		return "redirect:/event-grid.action";
	}
		
	//�̺�Ʈ ����
	@RequestMapping(value = "/eventReview.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String eventReview(EventReviewDTO dto,HttpServletRequest request) throws Exception {
	
		try {
			
			dto.setEventReviewNum(eventReviewDAO.reviewMaxNum()+1); 
			eventReviewDAO.insertReviewData(dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return "redirect:event-single.action?eventIndex="+dto.getEventIndex();
	}

	//�̺�Ʈ ���� ����
	@RequestMapping(value = "/eventReview-delete.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public String eventReviewDelete(HttpSession session,HttpServletRequest request) {

		int eventReviewNum = Integer.parseInt(request.getParameter("eventReviewNum"));

		eventReviewDAO.deleteReviewData(eventReviewNum);

		int eventIndex = Integer.parseInt(request.getParameter("eventIndex"));

		return "redirect:event-single.action?eventIndex=" + eventIndex;
	}
	
	//������ �̺�Ʈ ��û Ŭ����! ����� ����
	@RequestMapping(value = "/event-request.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventRequestOk(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		ModelAndView mav = new ModelAndView();

		try {

			int eventIndex =Integer.parseInt(request.getParameter("eventIndex"));	
			String userId = request.getParameter("eventUserId");
			String userRequest  = request.getParameter("eventUserRequest");

			//���̵�+�̺�Ʈ�ε����� ����� ������ �ִ��� ��ȸ
			EventBookingDTO dto = eventDao.getReadEventBookingData(userId, eventIndex);

			//1.������ �̹� ������ ������� �ִ°��
			if(dto!=null&&!dto.equals(" ")) {
				EventDTO edto = eventDao.getReadEventData(eventIndex);

				mav.setViewName("event-request-confirmed");
				mav.addObject("dto",dto);
				mav.addObject("message","�̺�Ʈ ������� �̹� �̹������մϴ�");
				mav.addObject("edto",edto);
				mav.addObject("eventIndex",eventIndex);
				return mav;	

				//2.������� ���°��, null�� ��ȯ�ؼ� ��ûâ�� ����ش�.
			}else if((dto==null||dto.equals(""))
					&&(userRequest==null||userRequest.equals(""))){
				return null;	

			}else {

				//���� ������� ���� ��� ==�űԷ� ������ ������� �ϴ� ���
				String userName = request.getParameter("eventUserName");
				String companionNumber = request.getParameter("companionNumber");
				String userSelectedDate = request.getParameter("userSelectedDate");

				String dates[] = userSelectedDate.split("/"); 
				userSelectedDate = dates[2]+"/"+dates[0]+"/"+dates[1]; 

				//2.������ �ش� �̺�Ʈ�� ó�� ������ �� ���
				EventBookingDTO ebdto = new EventBookingDTO();

				ebdto.setEventBookingNum(eventDao.getBookingMaxNum()+1);
				ebdto.setUserId(userId);
				ebdto.setUserName(userName);
				ebdto.setUserRequest(userRequest);
				ebdto.setEventIndex(eventIndex);
				ebdto.setCompanionNumber(companionNumber);
				ebdto.setUserSelectedDate(userSelectedDate);
				eventDao.insertEventBooking(ebdto);

				EventBookingDTO dto2 = eventDao.getReadEventBookingData(userId, eventIndex);

				EventDTO edto = eventDao.getReadEventData(eventIndex);

				mav.setViewName("event-request-confirmed");
				mav.addObject("dto",dto2);
				mav.addObject("edto",edto);

			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}

		return mav;

	}

	//�̺�Ʈ ���� ���
	@RequestMapping(value = "/event-booking-delete.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public String eventBookingDelete(HttpServletRequest request) throws Exception {

		String referer = request.getHeader("Referer");	
		
		try {
			
			int eventBookingNum= Integer.parseInt(request.getParameter("eventBookingNum"));
			eventDao.deleteEventBookingData(eventBookingNum);
			
		} catch (Exception e) {

			System.out.println(e.toString());
		}
		
		return "redirect:" + referer;

	}

	//event-grid ȭ�鿡�� ���� ������ �̺�Ʈ ��� �̾Ƴ��� �۾�
	@RequestMapping(value="/event-list.action", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventList(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String mode = request.getParameter("mode");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String searchValue = request.getParameter("searchValue");

		ModelAndView mav = new ModelAndView();

		try {
			
			//case1.�˻��� + ��¥ �˻� ���� ���� ���
			if(mode!=null && mode.equals("mainstart")) {

				List<EventDTO> originalLists = 
						eventDao.getEventList();

				mav.setViewName("event-list"); //event-list.jsp�� ������
				mav.addObject("mode",mode);
				mav.addObject("originalLists", originalLists);

				return mav;

			}else{


				//case2. �˻��ϰ� ���� ���
				//�Ѿ���� ��¥ ���� �����ֱ�
				String dates[] =  startDate.split("/");       
				startDate = dates[2]+"/"+dates[0]+"/"+dates[1]; 

				String dates2[] = endDate.split("/");
				endDate = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

				Map<String, Object> params = 
						new HashMap<String, Object>();

				params.put("startDate", startDate);
				params.put("endDate", endDate);
				params.put("searchValue", searchValue);

				//2-1. event ���̺� ����
				List<EventDTO> availableEventLists =	
						eventDao.getEventLists(params); //start ~end �������� ���డ���� �̺�Ʈ �̾ƿ���

				mav.addObject("startDate",startDate);
				mav.addObject("endDate",endDate);
				mav.addObject("availableEventLists", availableEventLists);
				mav.setViewName("event-list"); 

			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return mav;
	}

	//�������������� �̺�Ʈ ����Ȯ���ϱ� �������� ����
	@RequestMapping(value = "/eventCheck.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventCheck(
			HttpServletRequest request,
			HttpSession session) throws Exception {

		ModelAndView mav  = new ModelAndView();
		
		try {
			
			
			//1.�α����� �ȵǾ� �ִٸ� >> �α��� â���� ����.
			if(session.getAttribute("login")==null) {	
				String referer = request.getHeader("Referer");	
				request.getSession().setAttribute("redirectURI", referer);
				mav.setViewName("login");
				return mav;
			}

			//2.�α��μ��� + userId ������� �̺�Ʈ ���� �ҷ�����
			LoginDTO login = (LoginDTO)session.getAttribute("login");
			String userId = login.getUserId();

			List<EventCheckDTO> lists = eventDao.getEventListsByUserId(userId);

			mav.addObject("elists",lists);
			mav.setViewName("eventCheck");
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return mav;
	}
    //event�� ============================= event��============================event��============================event��
	
	//���� ����(�˻�)
	@RequestMapping(value = "/booking-step1.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep1(HttpServletRequest req,
			HttpServletResponse response,Model model) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking-step1");	

		mav.addObject("checkin", req.getParameter("checkin"));
		mav.addObject("checkout", req.getParameter("checkout"));
		mav.addObject("adult", req.getParameter("adult"));
		mav.addObject("children", req.getParameter("children"));

		return mav;
	}
	
	@RequestMapping(value="/room-list.action", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomList(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		ModelAndView mav = new ModelAndView();

		// 1. hotelBooking ���̺� ����
		List<HotelBookingDTO> lists =	
				hdao.getRoomLists(checkin, checkout);

		// 2. lists ���� roomIndex ��������
		int[] roomIndex = new int[6]; 
		if(!lists.isEmpty()) {

			Iterator<HotelBookingDTO> it = lists.iterator();
			int i=0;
			while(it.hasNext()) {
				HotelBookingDTO dto = it.next();
				roomIndex[i] = dto.getRoomIndex(); 
				i++;
			}
		}   

		// 3.  ���� �ȵ� roomIndex�� ������ room���̺� ����, select							
		List<RoomDTO> lists2 = rdao.getRoomLists(roomIndex);

		mav.setViewName("room-list");
		mav.addObject("lists", lists2);
		//����ڰ� �Է��� ���� ���
		mav.addObject("checkin", checkin);
		mav.addObject("checkout", checkout);
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));

		return mav;
	}
	
	@RequestMapping(value = "/booking-step2.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep2(HttpServletRequest request,
			HttpServletResponse response) {

		int total =0;
		HttpSession session = request.getSession();

		if(session.getAttribute("total")!=null) {			
			total = (Integer)session.getAttribute("total");
		}
		


		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");	     

		// ��¥��ȯ
		String dates[] = checkin.split("/"); 
		checkin = dates[2]+"/"+dates[0]+"/"+dates[1]; 

		String dates2[] = checkout.split("/");
		checkout = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

		int interval = hdao.getInterval2(checkin,checkout);	     

		int optionTotal = interval *  total;

		String [] optionList = request.getParameterValues("optionList2");
		ModelAndView mav = new ModelAndView();

		mav.setViewName("booking-step2");

		//�� ����
		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		RoomDTO dto = rdao.getReadRoomData(roomIndex);

		
		
		//����ڰ� �Է��� ���� �״�� ���
		mav.addObject("checkin", request.getParameter("checkin"));
		mav.addObject("checkout", request.getParameter("checkout"));
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));
		mav.addObject("total", optionTotal);
		mav.addObject("optionList", optionList[0]);	
		mav.addObject("interval", interval);
		request.setAttribute("total", optionTotal);		

		// ����ڰ� ���� ������ roomIndex
		mav.addObject("roomIndex", roomIndex);	
		mav.addObject("roomType", request.getParameter("roomType"));	

		//������
		mav.addObject("dto", dto);

		return mav;
	}

	@RequestMapping(value = "/booking-step2_ok.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep2ok(HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();

		
		String card = request.getParameter("card");
		double price=  Double.parseDouble(request.getParameter("price"));

		int offPrice = 0;
		int newPrice =0;
		int off = 0; // %��

		if (card.equals("no")) {
			off = 0;
			offPrice = (int)price;
			newPrice = (int)price;
		}

		if (card.equals("visa")) {
			off = 20;
			newPrice = (int)price;
			price = price * 0.8;
			offPrice = (int)price;
		}

		if (card.equals("master")) {
			off = 10;
			newPrice = (int)price;
			price = price * 0.9;
			offPrice = (int)price;
		}

		if (card.equals("american")) {
			off = 40;
			newPrice = (int)price;
			price = price * 0.6;
			offPrice = (int)price;
		}

		if (card.equals("maestro")) {
			off = 30;
			newPrice = (int)price;
			price = price * 0.7;
			offPrice = (int)price;
		}

		if (card.equals("what")) {
			off = 30;
			newPrice = (int)price;
			price = price * 0.7;
			offPrice = (int)price;
		}
		
		ModelAndView mav = new ModelAndView();
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		mav.addObject("off", off);
		mav.addObject("newPrice", formatter.format(newPrice));
		mav.addObject("offPrice", formatter.format(offPrice));
		
		String offPrice2 = String.valueOf(offPrice);
		session.setAttribute("realTotal", offPrice2); // String.toString()
		
		mav.setViewName("booking-step2_ok");		
		return mav;	

	}
	
	// payment.action -> confirmation_ok.action -> confirmation.action
	// ���� �Ϸ� ó��- 1 (payment�� ��������, ������ ���� ����)
	@RequestMapping(value = "/payment.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView confirmation(HttpServletRequest request,
			HttpServletResponse response,HotelBookingDTO dto, 
			RedirectAttributes redirect) {

		HttpSession session = request.getSession();	
		String total = request.getParameter("total");

		if(session.getAttribute("realTotal")!=null) {			
			total = (String)session.getAttribute("realTotal");
			session.removeAttribute("realTotal");			
		}		

		ModelAndView mav = new ModelAndView();		

		if(session.getAttribute("login")==null) {			
			String referer = request.getHeader("Referer");	//���� ���
			request.getSession().setAttribute("redirectURI", referer);			

			mav.setViewName("login");
			return mav;
		}		

		LoginDTO login = (LoginDTO)session.getAttribute("login");


		// hotelbooking ���̺� insert�ϱ����� bookingId������
		int bookingNum = hdao.getMaxNum();	    

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");

		// ��¥��ȯ
		String dates[] = dto.getCheckin().split("/");       
		checkin = dates[2]+"/"+dates[0]+"/"+dates[1]; 

		String dates2[] = dto.getCheckout().split("/");
		checkout = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

		dto.setBookingMessage(request.getParameter("bookingMessage"));
		dto.setCheckin(checkin);
		dto.setCheckout(checkout);
		dto.setBookingId(bookingNum+1); // ������ 				

		dto.setPrice(total); // ���� ����  => �̰� Ȯ�εǸ� �����
		dto.setUserId(login.getUserId());		

		System.out.println("üũ��: "+dto.getCheckin() + "����" + dto.getPrice());

		mav.addObject("total", Integer.parseInt(total));

		session.setAttribute("hdto", dto);

		mav.addObject("email", login.getUserEmail());
		mav.addObject("name", login.getUserName());
		mav.addObject("phone", login.getTel());
		mav.addObject("address", login.getAddr());


		mav.setViewName("payment");
		return mav; 		


	}

	// ���� �Ϸ� ó��- 2. DB�� insert �� confirmation.action���� redirect ��Ű��
	@RequestMapping(value ="/confirmation_ok.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public String confirmationOk(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			Model model,
			RedirectAttributes redirect) 

	{
		// ��¥ �������� �Ϸ�� ��Ȳ
		HotelBookingDTO dto = (HotelBookingDTO)session.getAttribute("hdto");
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		session.removeAttribute("hdto");
		
		DecimalFormat formatter = new DecimalFormat("###,###");
				

		
		System.out.println("!!!!!!!!! : "+dto.getPrice());
		//dto.setPrice(formatter.format(dto.getPrice()));
		// hotelbooking ���̺� insert
		
		
		hdao.insertData(dto);

		redirect.addAttribute("checkin", dto.getCheckin());
		redirect.addAttribute("checkout", dto.getCheckout());
		redirect.addAttribute("adult", dto.getAdult());
		redirect.addAttribute("children", dto.getChildren());
		redirect.addAttribute("bookingId", dto.getBookingId());
		redirect.addAttribute("roomIndex", dto.getRoomIndex());
		redirect.addAttribute("total", dto.getPrice());

		//			Map<String, Object> map = new HashMap<String,Object>();
		//			map.put("dto", dto);
		//			map.put("total", dto.getPrice());
		//			
		//			redirect.addFlashAttribute("res", map);

		return "redirect:/confirmation_ok2.action";

		//			return "redirect:/confirmation_ok2.action?checkin="+dto.getCheckin()
		//			+"&checkout="+dto.getCheckout()+"&adult="+dto.getAdult()+"&children="+dto.getChildren();
	}



	// confirmation.jsp �� �����ֱ� 
	@RequestMapping(value = "/confirmation_ok2.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView confirmationOk2(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("checkin") String checkin,
			@RequestParam("checkout") String checkout,
			@RequestParam("adult") String adult,
			@RequestParam("children") String children,
			@RequestParam("bookingId") String bookingId,
			@RequestParam("roomIndex") String roomIndex,
			@RequestParam("total") String total) {

		ModelAndView mav = new ModelAndView();
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		mav.addObject("checkin", checkin);
		mav.addObject("checkout", checkout);
		mav.addObject("adult", adult);
		mav.addObject("children", children);
		mav.addObject("bookingId", bookingId);
		mav.addObject("roomIndex", roomIndex);
		mav.addObject("total", formatter.format(Integer.parseInt(total)));
		mav.setViewName("confirmation");

		return mav; 

	}
	

	//My Page
	@RequestMapping(value = "/myPage.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage(HttpServletRequest request, HttpSession session, LessonUserDTO dto) {
		
		if(session.getAttribute("login")==null) {

			String referer =request.getHeader("Referer");	//���� ���
			request.getSession().setAttribute("redirectURI", referer);

			return "login";
		}
		
		return "myPage";
	}
	
	//ȸ����������
	@RequestMapping(value = "/userUpdate.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userUpdate(HttpSession session, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("login")==null) {

			String referer =request.getHeader("Referer");	//���� ���
			request.getSession().setAttribute("redirectURI", referer);

			mav.setViewName("login");
			return mav;
		}
		mav.setViewName("userUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/userUpdate_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String userUpdate_ok(HotelUserDTO dto, HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		
		session.removeAttribute("login");
		
		userDao.updateUserData(dto);
		
		LoginDTO login = new LoginDTO();
		
		login.setUserId(dto.getUserId());
		login.setUserName(dto.getUserName());
		login.setUserEmail(dto.getEmail());
		login.setTel(dto.getTel());
		login.setBirth(dto.getBirth());
		login.setAddr(dto.getAddr());
		
		session.setAttribute("login", login);
		
		return "redirect:/myPage.action";
	}
	
	
	//����Ȯ��
	@RequestMapping(value = "/bookingConfirm.action", method = RequestMethod.GET)
	public ModelAndView bookingConfirm(HttpServletRequest request,
			HttpServletResponse response) {


		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();		
		String msg="";

		if(session.getAttribute("login")==null) {	
			//System.out.println("�α����� �ȵȻ����Դϴ�");
			String referer = request.getHeader("Referer");	//���� ���
			request.getSession().setAttribute("redirectURI", referer);
			mav.setViewName("login");
			return mav;
		}

		LoginDTO login = (LoginDTO)session.getAttribute("login");	
		List<RoomDTO> dto2 =  new ArrayList<RoomDTO>();

		// 1. suzy �� �������� (hotelBooking)
		List<HotelBookingDTO> lists = hdao.getReadBookingData(login.getUserId());


		if(lists.isEmpty()) {

			msg = "����� ������ �����ϴ�";
			System.out.println("����� ������ ���ٴ� �޼��� �Ѱ��ݴϴ�");

			mav.setViewName("bookingConfirm");
			mav.addObject("msg",msg);
			return mav;

		}
		
		DecimalFormat formatter = new DecimalFormat("###,###");

		List<HotelBookingDTO> lists2 = new ArrayList<HotelBookingDTO>();

		// 2. ���������� ��ϵ� roomIndex�� ������ room���̺� ���� => roomType, roomImage�� dto�� �����Ѵ�
		int roomIndex;
		Iterator<HotelBookingDTO> it = lists.iterator();

		while(it.hasNext()) {

			HotelBookingDTO dto = it.next();
			
			// , ���
			dto.setPrice(formatter.format(Integer.parseInt(dto.getPrice())));
			
			roomIndex = dto.getRoomIndex(); 
			//	dto2 = rdao.getRoomLists(roomIndex);	
			//	����� �ش� roomIndex�� �� ���� ���������
			RoomDTO rdto = rdao.getReadRoomData(roomIndex);	

			dto.setRoomImage(rdto.getRoomImage());
			dto.setRoomType(rdto.getRoomType());		    

			lists2.add(dto);
		}
		mav.setViewName("bookingConfirm");
		
		// ���� + �� ���� (room)
		mav.addObject("lists", lists2);


		return mav;
	}

	@RequestMapping(value = "/cancelBooking.action", method = RequestMethod.GET)
	public ModelAndView cancelBooking(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="bookingId") int bookingId) {


		ModelAndView mav = new ModelAndView();

		mav.setViewName("cancelBooking");
		mav.addObject("bookingId", bookingId);
		return mav;


	}

	// cancelBooking_ok.action
	@RequestMapping(value = "/cancelBooking_ok.action", method = RequestMethod.GET)
	public String cancelBookingOk(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="bookingId") int bookingId) {

		hdao.deleteData(bookingId);
		//mav.setViewName("cancelBooking_ok");
		//mav.addObject("bookingId", bookingId);

		//	return "redirect:/signupOk.action";

		return "redirect:/cancelBooking_ok2.action";
	}

	@RequestMapping(value = "/cancelBooking_ok2.action", method = RequestMethod.GET)
	public String cancelBookingOk2(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("�Խ��ϴٿ�");

		return "cancelBooking_ok";
	}
	
	
	
	//admin ����
	@RequestMapping(value = "/admin.action", method = RequestMethod.GET)
	public String adminPage(HttpSession session) {
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		if(login == null || login.equals("") || !login.getUserId().equals("admin")) {
			return "404";
		}

		return "adminPage";
	}
	
	@RequestMapping(value = "/userAdmin.action", method = RequestMethod.GET)
	public ModelAndView userAdminPage(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		if(login == null || login.equals("") || !login.getUserId().equals("admin")) {
			
			mav.setViewName("404");
			
			return mav;
		}
		
		List<HotelUserDTO> lists = userDao.getUserListData();
		
		mav.setViewName("userAdmin");
		mav.addObject("lists", lists);
		
		return mav;
	}
	
	@RequestMapping(value = "/userDelete.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String userDelete(HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		
		if(userId==null) {
			return "404";
		}
		
		userDao.deleteUserData(userId);
		
		return "redirect:userAdmin.action";
	}
	
	@RequestMapping(value = "/roomAdmin.action", method = RequestMethod.GET)
	public ModelAndView roomAdmin(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		if(login == null || login.equals("") || !login.getUserId().equals("admin")) {
			
			mav.setViewName("404");
			
			return mav;
		}
		
		int[] roomIndex = {1,2,3,4,5,6};
		
		List<RoomDTO> roomList = rdao.getRoomLists(roomIndex);
		
		mav.setViewName("roomAdmin");
		mav.addObject("roomList", roomList);
		Map<Integer, List<HotelBookingDTO>> hm = new HashMap<Integer, List<HotelBookingDTO>>();
	
		List<HotelBookingDTO> list = hdao.getReadBookingList(1);
		hm.put(1,list);
		
		list = hdao.getReadBookingList(2);
		hm.put(2,list);
		
		list = hdao.getReadBookingList(3);
		hm.put(3,list);
		
		list = hdao.getReadBookingList(4);
		hm.put(4,list);
		
		list = hdao.getReadBookingList(5);
		hm.put(5,list);
		
		list = hdao.getReadBookingList(6);
		hm.put(6,list);
		
		mav.addObject("hm",hm);
		mav.addObject("message","������ �����ϴ�.");
		return mav;
	}
	
	@RequestMapping(value = "/bookingDelete.action", method = RequestMethod.GET)
	public String bookingDelete(HttpServletRequest request) {
		
		int bookingId = Integer.parseInt(request.getParameter("bookingId"));
		
		hdao.deleteBookingData(bookingId);
		
		return "redirect:roomAdmin.action";
	}
	
	//Spa
	@RequestMapping(value = "/life-spa.action", method = RequestMethod.GET)
	public ModelAndView lifespa() {

		ModelAndView mav = new ModelAndView();

		List<SpaDTO> lists = spaDAO.getSpaList();

		mav.setViewName("life-spa");
		mav.addObject("lists", lists);

		return mav;
	}
	
	@RequestMapping(value = "/spa-upload.action", method = RequestMethod.GET)
	public String spaupload() {

		return "spa-upload";
	}

	@RequestMapping(value = "/spa-upload_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String spaupload_ok(SpaDTO dto, 
			MultipartHttpServletRequest request, 
			HttpServletResponse response, String str) {

		MultipartFile file = request.getFile("spaUpload");

		dto.setSpaIndex(spaDAO.getMaxNum() +1);
	
		dto.setSavefileName( file.getOriginalFilename());

		spaDAO.insertspa(dto);

		Path path = Paths.get("D:\\sts-bundle\\work\\HotelWebService\\src\\main\\webapp\\resources\\images\\spa");

		if(file!=null&&file.getSize()>0) { 

			try {

				FileOutputStream fos =
						new FileOutputStream(path+ 
								"/" + file.getOriginalFilename());

				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) {
						break;
					}

					fos.write(buffer,0,data);
				}

				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return "redirect:/life-spa.action";
	}

	@RequestMapping(value="/spa-booking.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String spaBooking()  {

		return "spa-booking";
	}
	
	//spa-request.action
	@RequestMapping(value = "/spa-request.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView spaRequest(SpaDTO dto,HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		String spaDate = request.getParameter("spaDate");	     
		String spaType = request.getParameter("spaType");	
		String time = request.getParameter("time");	
		String adult = request.getParameter("adult");	
		String spaUserRequest = request.getParameter("spaUserRequest");
		String savefileName=request.getParameter("savefileName");
		String price = request.getParameter("price");
		// ��¥��ȯ
		String dates[] = spaDate.split("/"); 
		spaDate = dates[2]+"/"+dates[0]+"/"+dates[1]; 

		//mav.addObject("spaBookingNum",spaDAO.getBookingMaxNum()+1);
		mav.addObject("spaDate", spaDate);
		mav.addObject("dto", dto);

		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO)session.getAttribute("login");

		String spaUserId="";
		String spaUserName="";
		String phone="";
		String email="";

		if(login!=null) {

			spaUserId = login.getUserId();
			spaUserName = login.getUserName();
			phone = login.getTel();
			email = login.getUserEmail();
		}

		//spaBooking ���̺� insert

		int spaBookingNum = spaDAO.getBookingMaxNum()+1001;

		//dto.setPrice(spaDAO.getReadPrice(spaType));
		dto.setSavefileName(spaDAO.getReadSaveFileName(spaType));

		System.out.println("savefileName:"+spaDAO.getReadSaveFileName(spaType));

		dto.setSpaUserId(spaUserId);
		dto.setSpaUserName(spaUserName);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setSpaBookingNum(spaBookingNum);
		dto.setSpaDate(spaDate);
		spaDAO.insertspaBooking(dto);		

		// select �κ�

		//SpaDTO dto1 = spaDAO.getReadspaBookingData(spaUserId,spaBookingNum);

		List<SpaDTO> lists = spaDAO.getSpaBookingList(spaUserId);

		mav.addObject("lists", lists);
		mav.setViewName("spaConfirm");

		return mav;
	}
	
	@RequestMapping(value="/spaConfirm.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView spaConfirm(HttpServletRequest request,HttpServletResponse response)  {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		SpaDTO dto = new SpaDTO();
		String spaUserId="";
		
		if(login!=null) {
			
			spaUserId = login.getUserId();
		}
		dto.setSpaUserId(spaUserId);
		
		List<SpaDTO>lists = spaDAO.getSpaBookingList(spaUserId);
		mav.addObject("lists", lists);
		mav.setViewName("spaConfirm");
		
		return mav;
	}

	//spa-booking-delete.action
	@RequestMapping(value = "/spa-booking-delete.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public String spaBookingDelete(HttpServletRequest request) {

		int spaBookingNum= Integer.parseInt(request.getParameter("spaBookingNum"));

		spaDAO.deletespaBookingData(spaBookingNum);

		return "redirect:/spaConfirm.action";
	}
	

	//index���� �˻������� form�� ��Ƽ� booking-step1����
	@RequestMapping(value = "/hotelSearch.action", method = RequestMethod.POST)
	public String hotelSearch(HttpServletRequest req) {

		String checkin = req.getParameter("checkin");
		String checkout = req.getParameter("checkout");
		String adult =  req.getParameter("adult");
		String children =  req.getParameter("children");

		return "redirect:/booking-step1.action?checkin="+checkin
				+"&checkout="+checkout+"&adult="+adult+"&children="+children;

	}

	//���� ���� ������
	@RequestMapping(value = "/mailSending.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mailSending(HttpServletRequest req) throws Exception {

		SimpleEmail email = new SimpleEmail();

		String userEmail = req.getParameter("userEmail");	//������ ��� �̸���
		String userSubject = req.getParameter("userSubject"); //����
		String userMessage = req.getParameter("userMessage"); //����

        email.setCharset("UTF-8");      //�ѱ�ó��
        email.setHostName("localhost"); //SMTP (������ ���ϼ���) ����
        email.setSmtpPort(25);   //���� 25���� SMTP ��Ʈ

        email.setFrom(userEmail);
        email.addTo("xh2967@naver.com");	//�޴� ��� �̸���
        email.setSubject(userSubject);
        email.setMsg(userMessage);
        
        email.send();
        
        return "index";
    }
	
	@RequestMapping(value = "/contact.action", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public String contact() {
		
		return "contact";
	}
	
	
	
	
}
