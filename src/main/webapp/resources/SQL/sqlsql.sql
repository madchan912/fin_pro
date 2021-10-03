--recipy 자료실 테이블 생성
create table recipy(
recipy_no number(38) primary key --레시피 번호
,recipy_name varchar2(200) not null --작성자(회원 닉네임 참조)
,mail_id varchar2(30) --멤버 메일 아이디 참조
,recipy_title varchar2(200) not null--제목
,recipy_file varchar2(200) --레시피사진
,recipy_cont varchar2(4000) --레시피순서   
,recipy_material varchar2(4000) --재료
,recipy_material_v varchar2(4000) --재료량
,recipy_hit number(38) default 0 --조회수
,recipy_ref number(38) --원본글과 답변글을 묶어주는 글 그룹번호
,recipy_step number(38) --원본글이면 0, 첫번째 답변글이면1, 두번째 답변글이면2...=>원본글과 답변글을 구분하는 값이면서 몇번째 답변글인가를 알려준다.
,recipy_level number(38) --답변글 정렬순서
,recipy_date date --등록날짜
,recipy_editdate date --수정날짜
);

--recipy_no_seq 생성
create sequence recipy_no_seq
start with 1
increment by 1
nocache; 

drop table recipy;
 select * from recipy order by recipy_no desc;
drop sequence recipy_no_seq;

 

--회원관리 테이블
create table member(
mail_id varchar2(30) primary key--메일 아이디
 ,mem_nic varchar2(30) not null--닉네임
 ,mem_pwd varchar2(200) not null --회원비번(암호화시켜야함)
 ,mem_name varchar2(50) not null --회원이름
 ,mem_phone varchar2(30)  not null--폰번호
 ,mem_date date --가입날짜
 ,mem_state number(38) --가입회원이면 1, 탈퇴회원은 2
 ,mem_delcont varchar2(4000) --탈퇴사유
 ,mem_deldate date --탈퇴날짜

 );
 
 drop table member;
 select * from member;
 
--댓글 테이블 생성
create table reply(
 rno number(38) primary key --댓글 번호
 ,recipy_no number(38) --recipy의 레시피 번호.외래키 제약조건으로 추가 설정
 ,mail_id varchar2(30) --멤버 메일 아이디 참조
 ,replyer varchar2(100) not null --댓글 작성자(mem_nic 참조)
 ,replytext varchar2(4000) not null --댓글 내용
 ,regdate date --댓글 등록 날짜
 ,updatedate date --댓글 수정날짜
);

drop table VISIT;
select * from reply order by rno desc;

--외래키 설정 작업
alter table reply add constraint tbl_reply_recipy_no_fk --외래키 제약 조건명
foreign key(recipy_no) references recipy(recipy_no);
--foreign key(외래키)
 
--댓글 시퀀스 생성
create sequence rno_seq
increment by 1 --1씩 증가 옵션
start with 1 -- 1부터 시작
nocache;

drop sequence rno_seq;



--총 방문자 테이블 
CREATE TABLE VISIT (
v_date date
);




