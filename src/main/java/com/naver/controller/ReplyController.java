package com.naver.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.service.MemberService;
import com.naver.service.ReplyService;
import com.naver.vo.MemberVO;
import com.naver.vo.ReplyVO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService replyService;
	@Autowired
	MemberService memberService;

	//댓글저장
	@RequestMapping("reply_ok")
	public void reply_ok(ReplyVO rp,HttpServletResponse response,HttpSession session) 
	throws Exception{
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			MemberVO m = this.memberService.getMember(id);//id 기준 회원 정보 가져옴
			rp.setReplyer(m.getMem_nic());
			rp.setMail_id(m.getMail_id());
			
			this.replyService.insertReply(rp);
			
		}
		
	
	}
	
	//댓글 리스트
	@RequestMapping("reply_list")
	public ModelAndView reply_list(int recipy_no,HttpSession session)throws Exception{
		
		
		int totalCount=this.replyService.totalCount(recipy_no); //레시피번호기준 댓글 총 갯수
		List<ReplyVO> rplist=this.replyService.getRpList(recipy_no); //댓글리스트
		
		
		
		ModelAndView rm=new ModelAndView();
		rm.setViewName("recipy/reply_list");
		rm.addObject("totalCount",totalCount);
		rm.addObject("rplist",rplist);
		return rm;
		
	}
	
	//댓글 수정
	@RequestMapping("reply_edit")
	public void reply_edit(String rno_s,String replytext,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		int rno = Integer.parseInt(rno_s); //정수로 바꿈

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			ReplyVO rp =new ReplyVO();
			rp.setRno(rno);
			rp.setReplytext(replytext);
			this.replyService.reply_edit(rp); //rno 기준으로 댓글 수정
		}
	}
	
	//댓글 삭제
	@RequestMapping("reply_del")
	public void reply_del(String rno_s,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 생성

		int rno = Integer.parseInt(rno_s); //정수로 바꿈

		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요');");
			out.println("location='Login';");
			out.println("</script>");
		} else {
			this.replyService.reply_del(rno); //번호 기준으로 댓글 삭제
		}
	}
	
}
