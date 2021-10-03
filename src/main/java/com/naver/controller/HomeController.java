package com.naver.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.service.MemberService;
import com.naver.service.RecipyService;
import com.naver.vo.MemberVO;

import pwdconv.PwdChange;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private RecipyService recipyService;
	@Autowired
	private JavaMailSender mailSender; // 메일

	// 회원가입 페이지
	@RequestMapping("/Join")
	public ModelAndView Join() {
		ModelAndView joinM = new ModelAndView();
		joinM.setViewName("main/Join");
		return joinM;
	}

	// 로그인 페이지
	@RequestMapping("/Login")
	public ModelAndView Login() {
		ModelAndView loginM = new ModelAndView();
		loginM.setViewName("main/Login"); // 뷰페이지
		return loginM;
	}

	// 이메일 중복체크
	@RequestMapping("/member_mailcheck")
	public String member_idcheck(String mail_id, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		MemberVO db_mail = this.memberService.mailcheck(mail_id);// 이메일 중복검색

		int re = -1;// 중복 이메일이 없을때 반환값

		if (db_mail != null) { // 중복아이디가 있을때
			re = 1;
		}
		out.println(re);// 값 반환
		return null;
	}

	// 닉네임 중복체크
	@RequestMapping("/member_nickcheck")
	public String member_nickcheck(String mem_nic, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		MemberVO db_nick = this.memberService.nickcheck(mem_nic);// 이메일 중복검색

		int re = -1;// 중복 이메일이 없을때 반환값

		if (db_nick != null) { // 중복아이디가 있을때
			re = 1;
		}
		out.println(re);// 값 반환
		return null;
	}

	// 회원저장
	@RequestMapping("/member_join_ok")
	public String member_join_ok(MemberVO m, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		m.setMem_pwd(PwdChange.getPassWordToXEMD5String(m.getMem_pwd()));// 비번 암호화
		this.memberService.insertMember(m); // 회원저장

		out.println("<script>");
		out.println("alert('회원가입 되었습니다.');");
		out.println("location='Login';");
		out.println("</script>");

		return null; // 회원저장후 로그인 매핑주소로 이동

	}

	// 로그인 인증
	@RequestMapping("/member_login_ok")
	public String member_login_ok(String login_id, String login_pwd, HttpSession session, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		MemberVO dm = this.memberService.loginCheck(login_id);
		// 가입 회원 1인경우만 로그인 인증처리

		if (dm == null) {
			out.println("<script>");
			out.println("alert('가입 안된 회원입니다');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			if (!dm.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(login_pwd))) { // 비번이 같지 않으면(암호화)
				out.println("<script>");
				out.println("alert('비번이 다릅니다');");
				out.println("history.back();");
				out.println("</script>");
			} else { // 비번이 같은경우
				session.setAttribute("id", login_id); // 세션 아이디 저장
				return "redirect:/main2";
			}
		}
		return null;
	}

	// 메인
	@RequestMapping("/main2")
	public ModelAndView index(HttpServletResponse response, HttpSession session) throws Exception {

		// 총레시피갯수
		int recipyCount = this.recipyService.recipyCount();
		// 총회원수
		int memberCount = this.memberService.memberCount();
		// 총 방문자수
		// int 퍄
		String id = (String) session.getAttribute("id"); // 세션 아이디 저장할때 키이름

		if (id != null) {
			MemberVO m = this.memberService.getMember(id);
			ModelAndView am = new ModelAndView();
			
			am.addObject("recipyCount", recipyCount);
			am.addObject("memberCount", memberCount);
			am.addObject("m", m);
			am.setViewName("main/main2");
			return am;
		} else {
			ModelAndView am = new ModelAndView();
			am.setViewName("main/main2");
			am.addObject("recipyCount", recipyCount);
			am.addObject("memberCount", memberCount);
			am.setViewName("main/main2");
			return am;
		}

	}

	// 로그아웃
	@RequestMapping("/member_logout") // 서버에 정보를 브라우저에 응답할때 리스폰즈씀
	public String member_logout(HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		session.invalidate();// 세션 만료(즉 로그아웃)
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location='Login';");
		out.println("</script>");

		return null;
	}

	// 정보수정
	@RequestMapping("/member_edit")
	public ModelAndView member_edit(HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String mail_id = (String) session.getAttribute("id");
		if (mail_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {

			// 오라클로 부터 mail_id에 해당하는 회원정보 가져옴
			MemberVO m = this.memberService.getMember(mail_id);

			ModelAndView em = new ModelAndView("main/member_edit");// 수정폼
			em.addObject("m", m);
			return em;

		}
		return null;
	}

	// 정보 수정 완료
	@RequestMapping("/member_edit_ok")
	public String member_edit_ok(MemberVO m, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성
		String mem_nic = m.getMem_nic(); // 마이페이지에 닉네임 보내주기 위해
		String mail_id = (String) session.getAttribute("id");
		if (mail_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			m.setMail_id(mail_id);
			m.setMem_pwd(PwdChange.getPassWordToXEMD5String(m.getMem_pwd()));// 정식 비번 암호화

			this.memberService.editMember(m);// 정보수정완료

			out.println("<script>");
			out.println("alert('정보 수정했습니다.');");
			out.println("location='mypage?recipy_name=" + mem_nic + "';");
			out.println("</script>");
		}
		return null;
	}

	// 회원탈퇴 폼
	@RequestMapping("/member_del")
	public ModelAndView member_del(HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String mail_id = (String) session.getAttribute("id");
		if (mail_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			MemberVO dm = this.memberService.getMember(mail_id);// 회원정보를 가져옴

			ModelAndView m = new ModelAndView();
			m.addObject("m", dm);
			m.setViewName("main/member_del");
			return m;
		}
		return null;
	}

	// 탈퇴완료
	@RequestMapping("/member_del_ok")
	public String member_del_ok(HttpServletResponse response, HttpSession session, String mem_pwd, String del_cont)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String mail_id = (String) session.getAttribute("id");
		if (mail_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			mem_pwd = PwdChange.getPassWordToXEMD5String(mem_pwd);
			MemberVO db_pwd = this.memberService.getMember(mail_id);

			if (!db_pwd.getMem_pwd().equals(mem_pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				MemberVO dm = new MemberVO();
				dm.setMail_id(mail_id);
				dm.setMem_delcont(del_cont);
				this.memberService.delMem(dm);// 회원탈퇴

				session.invalidate();// 세션 만료(로그아웃)

				out.println("<script>");
				out.println("alert('탈퇴 되었습니다');");
				out.println("location='Login';");
				out.println("</script>");
			}
		}

		return null;
	}

	// 메인 페이지
	@RequestMapping("/")
	public ModelAndView index1(HttpServletResponse response, HttpSession session) throws Exception {

		// 총레시피갯수
		int recipyCount = this.recipyService.recipyCount();
		// 총회원수
		int memberCount = this.memberService.memberCount();
		// 총 방문자수
		// int 퍄
		String id = (String) session.getAttribute("id"); // 세션 아이디 저장할때 키이름

		if (id != null) {
			MemberVO m = this.memberService.getMember(id);
			ModelAndView am = new ModelAndView();
			
			am.addObject("recipyCount", recipyCount);
			am.addObject("memberCount", memberCount);
			am.addObject("m", m);
			am.setViewName("main/main2");
			return am;
		} else {
			ModelAndView am = new ModelAndView();
			am.setViewName("main/main2");
			am.addObject("recipyCount", recipyCount);
			am.addObject("memberCount", memberCount);
			am.setViewName("main/main2");
			return am;
		}

	}

	// 비번찾기 폼
	@RequestMapping("/pwd_find")
	public String pwd_find() {
		return "main/pwd_find";
	}

	// 이메일로 비번 보내기
	@RequestMapping("/pwd_find_ok")
	public void pwd_find_ok(@RequestParam("login_mail") String login_mail,
			@RequestParam("login_name") String login_name, HttpServletResponse response, MemberVO m) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		m.setMail_id(login_mail);
		m.setMem_name(login_name); // 받아온 메일 아이디와 이름 저장 후
		MemberVO pm = this.memberService.pwdMember(m); // 회원아이디와 이름을 기준으로 오라클로부터 회원정보 검색

		if (pm == null) {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			Random r = new Random();// 난수 발생
			int pwd_random = r.nextInt(100000);// 0~100000 사이의 임의의 정수숫자 난수를 발생
			String ran_pwd = Integer.toString(pwd_random);// 임시정수를 문자열로 변경
			m.setMem_pwd(PwdChange.getPassWordToXEMD5String(ran_pwd)); // 임시 비번을 암호화

			this.memberService.updatePwd(m);// 메일아이디 기준으로 임시비번을 수정

			// 이메일 전송하기
			String title = "dailycook 임시비밀번호"; // 메일제목
			String content = "임시 비밀번호는 " + ran_pwd + "입니다. 비밀번호를 변경하여 사용하세요"; // 메일 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("yujin.jeonga@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(login_mail); // 받는사람 이메일
				messageHelper.setSubject(title); // 생략 가능
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);

				out.println("<script>");
				out.println("alert('이메일로 전송되었습니다.');");
				out.println("location='Login';");
				out.println("</script>");

			} catch (Exception e) {
				System.out.println(e);
			}

		}

	}

}
