package com.naver.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.service.MemberService;
import com.naver.service.RecipyService;

import com.naver.vo.MemberVO;
import com.naver.vo.RecipyVO;

import com.oreilly.servlet.MultipartRequest;

@Controller
public class RecipyController {

	@Autowired
	private RecipyService recipyService;
	@Autowired
	private MemberService memberService;

	// 레시피 상세정보
	@RequestMapping("/recipy_01")
	public String recipy_01() {
		return "/recipy/recipy_01";
	}

	// 레시피 등록 폼
	@RequestMapping("/insert")
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		ModelAndView wm = new ModelAndView();

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {

			wm.setViewName("/recipy/insert");
			return wm;
		}
		return null;
	}

	// 레시피 등록(저장) 완료
	@RequestMapping("insert_ok")
	public String insert_ok(RecipyVO r, HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws Exception {
		// 세션으로 아이디 받아와서

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			// 오라클로 부터 id에 해당하는 회원정보 가져옴(레시피 작성자 저장위해)
			MemberVO m = this.memberService.getMember(id);

			//String saveFolder = request.getRealPath("resources/upload");
			String saveFolder = request.getSession().getServletContext().getRealPath("resources/upload");

			int fileSize = 5 * 1024 * 1024;// 이진파일 최대크기
			MultipartRequest multi = null;// 레시피사진을 받을 변수선언
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

			// 폼에서 입력하는 데이터 받아오기
			String recipy_title = multi.getParameter("recipy_title");// 레시피 제목

			// 순서 받아오기
			String[] listO = multi.getParameterValues("oder_1");// 배열로 받아서
			String recipy_cont = ""; // 배열로 받은 순서를 이어서 저장할 변수

			if (listO != null) {
				for (int i = 1; i <= listO.length; i++) {
					recipy_cont += listO[i - 1] + "<br>"; // 이어서 저장
				}
			}

			// 재료를 받아오기
			String[] listM = multi.getParameterValues("material");
			String material_cont = "";

			if (listM != null) {
				for (int i = 1; i <= listM.length; i++) {
					material_cont += listM[i - 1] + "<br>"; // 이어서 저장
				}
			}

			// 재료량 받아오기

			String[] listM_v = multi.getParameterValues("material_v");
			String material_v_cont = "";

			if (listM_v != null) {
				for (int i = 1; i <= listM_v.length; i++) {
					material_v_cont += listM_v[i - 1] + "<br>"; // 이어서 저장
				}
			}

			// 파일 가져오기
			File upFile = multi.getFile("recipy_file");// 첨부한 레시피사진을 가져옴.

			if (upFile != null) {
				String fileName = upFile.getName();// 첨부한 파일명을 구함.
				Calendar c = Calendar.getInstance();// 칼렌더는 추상클래스로 new로 객체 생성을 못함.하지만 연월일 시분초를 반환할 때 주소 사용
				int year = c.get(Calendar.YEAR);// 년도값
				int month = c.get(Calendar.MONTH) + 1;// 월값, +1을 한 이유는 1월이 0으로 반환되기 때문이다.
				int date = c.get(Calendar.DATE);// 일값

				String homedir = saveFolder + "/" + year + "-" + month + "-" + date;// 오늘날짜 폴더 경로를 저장
				File path01 = new File(homedir);
				if (!(path01.exists())) {// 폴더 경로가 존재하지 않다면
					path01.mkdir();// 폴더 생성
				}
				Random rd = new Random();
				int random = rd.nextInt(100000000);// 0이상 1억 미만 사이의 정수숫자 난수 발생

				/* 첨부파일 확장자 */
				int index = fileName.lastIndexOf(".");// .의 위치번호를 구함
				String fileExtendsion = fileName.substring(index + 1);// .이후 부터 마지막 문자 까지 구함.즉 첨부파일 확장자를 구함.
				String refileName = "recipy" + year + month + date + random + "." + fileExtendsion;// 새로운 이진파일명
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;// 오라클에 저장할 레코드값
				upFile.renameTo(new File(homedir + "/" + refileName));// 실제 업로드

				// 빈클래스에 가져온 값 저장
				r.setRecipy_file(fileDBName);
			} else {
				String fileDBName = "";
				r.setRecipy_file(fileDBName);// 사진저장
			}

			r.setRecipy_title(recipy_title);// 제목 저장
			r.setRecipy_name(m.getMem_nic());// 작성자 닉네임
			r.setMail_id(m.getMail_id()); // 아이디 저장
			// 레시피 순서 저장

			r.setRecipy_cont(recipy_cont); // 레시피순서 넘기기
			r.setRecipy_material(material_cont); // 재료 넘기기
			r.setRecipy_material_v(material_v_cont);// 재료량 넘기기
			r.setRecipy_no(r.getRecipy_no()); // 넘버 넘기기

			// 빈클래스 객체 이용하여 DB에 저장
			this.recipyService.insertRecipy(r);// 레시피자료실 저장

			return "redirect:/recommand";
		}

		return null;

	}

	// 추천페이지
	@RequestMapping("/recommand")
	public String recommand(Model listM, HttpServletRequest request, RecipyVO r, HttpServletResponse response,
			HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		// 검색기능
		String find_field = request.getParameter("find_field");// 검색 필드
		String find_name = request.getParameter("find_name");// 검색어
		r.setFind_field(find_field);
		r.setFind_name("%" + find_name + "%");

		List<RecipyVO> rlist = this.recipyService.getRList(r);// 검색 전후 레시피 목록

		if (id != null) {

			MemberVO m = new MemberVO();
			m = this.memberService.getMember(id);

			listM.addAttribute("rlist", rlist);// blist속성 키이름에 목록을 저장
			listM.addAttribute("find_field", find_field);// 검색 필드
			listM.addAttribute("find_name", find_name);// 검색어
			listM.addAttribute("m", m);// 마이페이지에 닉네임을 넘기기 위한 회원정보
			return "/main/recommand";
		} else {
			listM.addAttribute("rlist", rlist);// blist속성 키이름에 목록을 저장
			listM.addAttribute("find_field", find_field);// 검색 필드
			listM.addAttribute("find_name", find_name);// 검색어
			return "/main/recommand";
		}

	}

	// 레시피 상세보기
	@RequestMapping("/recipy_cont")
	public ModelAndView recipy_cont(int recipy_no, RecipyVO r, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		r = this.recipyService.getRecipyCont(recipy_no);

		

		//// 순서를 토큰으로 분리 하기////////////////
		String[] tokens = r.getRecipy_cont().split("<br>");

		// 토큰을 리스트로 받아 넘기기
		List<String> tokenlist = new ArrayList<String>();
		for (int i = 0; i < tokens.length; i++) {
			tokenlist.add(tokens[i]);
		}

		//// 재료를 토큰으로 분리 하기//////////////
		String[] tokens2 = r.getRecipy_material().split("<br>");

		List<String> tokenlist2 = new ArrayList<String>();
		for (int i = 0; i < tokens2.length; i++) {
			tokenlist2.add(tokens2[i]);
		}

		//// 재료량을 토큰으로 분리 하기///////////
		String[] tokens3 = r.getRecipy_material_v().split("<br>");

		List<String> tokenlist3 = new ArrayList<String>();
		for (int i = 0; i < tokens3.length; i++) {
			tokenlist3.add(tokens3[i]);
		}

		ModelAndView cm = new ModelAndView();
		if (id != null) {
			MemberVO m = this.memberService.getMember(id);
			cm.setViewName("recipy/recipy_cont");
			cm.addObject("r", r);
			cm.addObject("token", tokenlist);
			cm.addObject("token2", tokenlist2);
			cm.addObject("token3", tokenlist3);
			cm.addObject("m", m);// 마이페이지에 닉네임을 넘기기 위한 회원정보

			return cm;
		} else {
			cm.setViewName("recipy/recipy_cont");
			cm.addObject("r", r);
			cm.addObject("token", tokenlist);
			cm.addObject("token2", tokenlist2);
			cm.addObject("token3", tokenlist3);
			return cm;
		}
	}

	// 마이페이지(항상 닉네임 값을 받아야함)
	@RequestMapping("/mypage")
	public ModelAndView mypage(String recipy_name, RecipyVO r, HttpServletResponse response, HttpSession session)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		String id = (String) session.getAttribute("id");

		MemberVO mnic = this.memberService.getMemberId(recipy_name);// 닉네임 기준으로 회원정보 구하기
		r.setRecipy_name(recipy_name);
		List<RecipyVO> mylist = this.recipyService.myList(r);// 닉네임 기준으로 레시피 리스트 가져오기
		ModelAndView mm = new ModelAndView();
		
		if (id == null) { //로그인 안했을때
			mm.setViewName("/main/mypage");
			mm.addObject("mylist", mylist);
			mm.addObject("mnic", mnic);
			return mm;
			
		} else {

			MemberVO m = this.memberService.getMember(id);// 세션아이디 기준으로 회원정보 구하기

			mm.setViewName("/main/mypage");
			mm.addObject("mylist", mylist);
			mm.addObject("mnic", mnic); //세션아이디와 닉네임기준 아이디가 동일할때 정보수정 가능해야 하므로 
			mm.addObject("m", m); // 타인 마이페이지에서 자신 마이페이지로 갈때 id 기준으로 넘기기위해(세션 아이디가 달라도 타인 마이페이지를 볼수있게)
			return mm;
		}
		
	}

	//레시피 삭제 
	@RequestMapping("recipy_del")
	public void recipy_del(int recipy_no,RecipyVO r,HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   String up=request.getRealPath("resources/upload");
		   
		   r = this.recipyService.getRecipyCont(recipy_no);//레시피 번호기준 레시피검색
		   
		   
		   this.recipyService.delRecipy(recipy_no);//자료실 삭제
		   
		   if(r.getRecipy_file() != null) { //레시피 번호기준 첨부파일 있는경우
			   File file=new File(up+r.getRecipy_file());//삭제할 파일 객체 생성
			   file.delete();//폴더는 삭제되지 않고 기존 첨부파일만 삭제된다.
		   }
		   
		   out.println("<script>");
		   out.println("alert('레시피가 삭제되었습니다');");
		   out.println("location='mypage?recipy_name="+r.getRecipy_name()+"';");
		   out.println("</script>");
		   
		
		
	}
	
}
