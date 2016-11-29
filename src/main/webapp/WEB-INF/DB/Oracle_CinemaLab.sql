/*CinemaLab DB*/
/********************멤버 테이블 생성***********************************************************************************/
DROP TABLE member CASCADE CONSTRAINTS;
CREATE TABLE member (
  no    NUMBER       CONSTRAINT member_pk_no PRIMARY KEY,
  id    VARCHAR2(20) CONSTRAINT member_nn_id NOT NULL,
  pwd   VARCHAR2(20) CONSTRAINT member_nn_pwd NOT NULL,
  name  VARCHAR2(40) CONSTRAINT member_nn_name NOT NULL,
  phone VARCHAR2(20) CONSTRAINT member_nn_phone NOT NULL,
  birth VARCHAR2(20) CONSTRAINT member_nn_birth NOT NULL,
  admin NUMBER       DEFAULT 0 CONSTRAINT member_ck_admin CHECK(admin IN(0,1))
);

INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'khh','admin','관리자1','010-3860-7688','1900-00-00', '1');
INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'seh','admin','관리자2','010-3097-2623','1900-00-00', '1');
INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'jjt','admin','관리자3','010-4476-4025','1900-00-00', '1');
INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'cts','admin','관리자4','010-9859-8754','1900-00-00', '1');
INSERT INTO member
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'pjh','admin','관리자5','010-4030-0994','1900-00-00', '1');
INSERT INTO member (no, id, pwd, name, phone, birth)
VALUES((SELECT NVL(MAX(no)+1,1) FROM member),'kimhohyun','1234','김호현','010-3860-7688','1984-00-00');
COMMIT;

SELECT * FROM member;

/********************Q&A 테이블 생성************************************************************************************/
DROP TABLE qna CASCADE CONSTRAINTS;
CREATE TABLE qna (
  qNo        NUMBER           CONSTRAINT qna_pk_qNo PRIMARY KEY,
  qSubject   VARCHAR2(1000)   CONSTRAINT qna_nn_qSubject NOT NULL,
  qContent   CLOB             CONSTRAINT qna_nn_qContent NOT NULL,
  qRegdate   DATE             DEFAULT SYSDATE,
  qHit       NUMBER           DEFAULT 0,
  group_id   NUMBER DEFAULT 0,
  group_step NUMBER DEFAULT 0,
  group_tab  NUMBER DEFAULT 0,
  root       NUMBER DEFAULT 0,
  depth      NUMBER DEFAULT 0,
  no         NUMBER,
  CONSTRAINT qna_member_fk_no FOREIGN KEY(no) REFERENCES member(no) ON DELETE CASCADE
);

INSERT INTO qna (qNo, qSubject, qContent, qRegdate, no)
VALUES((SELECT NVL(MAX(qNo)+1,1) FROM qna),'테스트입니다.','잘 작성되나요?.',SYSDATE, 6);

COMMIT;

SELECT * FROM qna;

/********************영화 리스트 테이블 생성****************************************************************************/
DROP TABLE movieList CASCADE CONSTRAINTS;
CREATE TABLE movieList (
  mNo        NUMBER           CONSTRAINT movieList_pk_mNo PRIMARY KEY,
  poster     VARCHAR2(1000)   CONSTRAINT movieList_nn_poster NOT NULL,
  title      VARCHAR2(100)   CONSTRAINT movieList_nn_title NOT NULL,
  opendate   DATE             CONSTRAINT movieList_nn_opendate NOT NULL,
  grade      NUMBER     CONSTRAINT movieList_nn_grade NOT NULL,
  genre      VARCHAR2(100),
  runtime    VARCHAR2(100),
  director   VARCHAR2(100),
  cast       VARCHAR2(1000),
  content    CLOB             CONSTRAINT movieList_nn_content NOT NULL,
  trailer    VARCHAR2(1000)   CONSTRAINT movieList_nn_trailer NOT NULL,
  type       NUMBER           CONSTRAINT movieList_nn_type NOT NULL,
  CONSTRAINT movieList_ck_type CHECK(type IN(0,1,2)),
  rank       NUMBER(5,2) DEFAULT 0,
  movieLike  NUMBER(5,2) DEFAULT 0
);

/*데이터 입력은 엑셀로*/

SELECT * FROM movieList;

/********************주요 배우 사진 테이블 생성*************************************************************************/
DROP TABLE characterList CASCADE CONSTRAINTS;
CREATE TABLE characterList (
  cNo        NUMBER           CONSTRAINT characterList_pk_cNo PRIMARY KEY,
  cName      VARCHAR2(20)     CONSTRAINT characterList_nn_cName NOT NULL,
  img        VARCHAR2(1000)   CONSTRAINT characterList_nn_img NOT NULL,
  mNo1       NUMBER           NOT NULL,
  mNo2       NUMBER,
  mNo3       NUMBER,
  mNo4       NUMBER,
  mNo5       NUMBER,
  CONSTRAINT characterList_nn_mNo1 FOREIGN KEY(mNo1) REFERENCES movieList(mNo),
  CONSTRAINT characterList_nn_mNo2 FOREIGN KEY(mNo2) REFERENCES movieList(mNo),
  CONSTRAINT characterList_nn_mNo3 FOREIGN KEY(mNo3) REFERENCES movieList(mNo),
  CONSTRAINT characterList_nn_mNo4 FOREIGN KEY(mNo4) REFERENCES movieList(mNo),
  CONSTRAINT characterList_nn_mNo5 FOREIGN KEY(mNo5) REFERENCES movieList(mNo)
);

/*데이터는 엑셀로 입력*/

SELECT * FROM characterList;

/*******************영화별 댓글 테이블 생성*****************************************************************************/
DROP TABLE replyList CASCADE CONSTRAINTS;
CREATE TABLE replyList (
  reNo          NUMBER           CONSTRAINT replyList_pk_reNo PRIMARY KEY,
  score         NUMBER           DEFAULT 0 CONSTRAINT replyList_nn_score NOT NULL,
  reContent     VARCHAR2(20)     CONSTRAINT eplyList_nn_reContent NOT NULL,
  regDATE       DATE             DEFAULT SYSDATE,
  no            NUMBER,
  mNo           NUMBER,
  CONSTRAINT replyList_member_fk_no FOREIGN KEY  (no) REFERENCES member(no) ON DELETE CASCADE,
  CONSTRAINT replyList_movieList_fk_mNo FOREIGN KEY  (mNo) REFERENCES movieList(mNo)
);

ALTER TABLE replyList MODIFY reContent VARCHAR2(4000);
ALTER TABLE replyList MODIFY (score default 0);

/*입력하기 전에 영화 리스트 데이터 먼저 생성 필요*/
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '4','너무 재밌어요','2016-10-24','6','1');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '3','나쁘지 않아요','2016-10-24','6','2');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '5','완전 짜릿','2016-10-25','6','3');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '3','쏘쏘함','2016-10-26','6','4');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '4','지려용~ㄷㄷ','2016-10-24','6','5');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '4','너무 재밌어요','2016-10-23','6','6');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '1','완전 별로임','2016-10-22','6','7');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '5','장 재밌어요','2016-10-24','6','8');
INSERT INTO replyList
VALUES ((SELECT NVL(MAX(reNo)+1,1) FROM replyList), '4','굳입니다.','2016-10-25','6','9');

COMMIT;

SELECT * FROM replyList;

/*******************극장리스트 테이블 생성*****************************************************************************/
DROP TABLE theaterList CASCADE CONSTRAINTS;
CREATE TABLE theaterList (
  tNo           NUMBER           CONSTRAINT theaterList_pk_tNo PRIMARY KEY,
  local         VARCHAR2(20)     CONSTRAINT theaterList_nn_local NOT NULL,
  theater       VARCHAR2(20)     CONSTRAINT theaterList_nn_theater NOT NULL,
  theaterNo     NUMBER           CONSTRAINT theaterList_nn_theaterNo NOT NULL,
  movietime     VARCHAR2(20)     CONSTRAINT theaterList_nn_movietime NOT NULL,
  mNo           NUMBER,
  CONSTRAINT theaterList_movieList_fk_mNo FOREIGN KEY  (mNo) REFERENCES movieList(mNo)
);

/*데이터는 엑셀로 입력*/

SELECT tNo FROM theaterList WHERE theater='신도림' AND theaterNo=1 AND movietime='21:00';

SELECT * FROM theaterList;

/*******************예약 테이블 생성************************************************************************************/
DROP TABLE reserveList CASCADE CONSTRAINTS;
CREATE TABLE reserveList (
  rNo           NUMBER           CONSTRAINT reserveList_pk_rNo PRIMARY KEY,
  rDate         DATE             CONSTRAINT reserveList_nn_rDate NOT NULL,
 /* rMonth        NUMBER           CONSTRAINT reserveList_nn_rMonth NOT NULL,
  rDay          NUMBER           CONSTRAINT reserveList_nn_rDay NOT NULL,*/
  seat          VARCHAR2(20)     CONSTRAINT reserveList_nn_seat NOT NULL,
  ticket        NUMBER           CONSTRAINT reserveList_nn_ticket NOT NULL,
  payType       VARCHAR2(20)     CONSTRAINT reserveList_nn_paytype NOT NULL,
  payment       NUMBER           CONSTRAINT reserveList_nn_payment NOT NULL,
  paymentId     VARCHAR2(300) CONSTRAINT reserveList_uq_pid UNIQUE,
  shopId        VARCHAR2(300) CONSTRAINT reserveList_nn_sid NOT NULL,
  serverPay     NUMBER CONSTRAINT reserveList_nn_sp NOT NULL,
  cardOkNum     VARCHAR2(300) CONSTRAINT reserveList_nn_cok NOT NULL,
  cancel        VARCHAR2(20),
  refund        VARCHAR2(20),
  no            NUMBER,
  tNo           NUMBER,
  CONSTRAINT reserveList_member_fk_no FOREIGN KEY  (no) REFERENCES member(no) ON DELETE CASCADE,
  CONSTRAINT reserveList_theaterList_fk_tNo FOREIGN KEY  (tNo) REFERENCES theaterList(tNo)
);

/*데이터 입력전에 영화 리스트 데이터 입력 필요*/
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-10-31 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미1','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-01 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미2','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-02 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미3','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-03 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미4','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-04 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'A7','1','신용카드','8000','imp_더미5','merchant_더미','8000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-04 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'B5,B6','2','신용카드','16000','imp_더미6','merchant_더미','16000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-04 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'B15,B17,B18','3','신용카드','24000','imp_더미7','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-04 16:00', 'YYYY-MM-DD HH24:MI'),
                                                     'G1,G2,G3','3','신용카드','24000','imp_더미8','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-04 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미9','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-05 14:30', 'YYYY-MM-DD HH24:MI'),
                                                     'A7','1','신용카드','8000','imp_더미10','merchant_더미','8000','더미','','','6','4');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-05 14:30', 'YYYY-MM-DD HH24:MI'),
                                                     'B5,B6','2','신용카드','16000','imp_더미11','merchant_더미','16000','더미','','','6','4');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-05 14:30', 'YYYY-MM-DD HH24:MI'),
                                                     'B15,B17,B18','3','신용카드','24000','imp_더미12','merchant_더미','24000','더미','','','6','4');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-05 14:30', 'YYYY-MM-DD HH24:MI'),
                                                     'G1,G2,G3','3','신용카드','24000','imp_더미13','merchant_더미','24000','더미','','','6','4');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-05 14:30', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미14','merchant_더미','24000','더미','','','6','4');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'A7','1','신용카드','8000','imp_더미15','merchant_더미','8000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'B5,B6','2','신용카드','16000','imp_더미16','merchant_더미','16000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 16:00', 'YYYY-MM-DD HH24:MI'),
                                                     'B15,B17,B18','3','신용카드','24000','imp_더미17','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'G1,G2,G3','3','신용카드','24000','imp_더미18','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 16:40', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미19','merchant_더미','24000','더미','','','6','5');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'A7','1','신용카드','8000','imp_더미20','merchant_더미','8000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'B5,B6','2','신용카드','16000','imp_더미21','merchant_더미','16000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'B15,B17,B18','3','신용카드','24000','imp_더미22','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'G1,G2,G3','3','신용카드','24000','imp_더미23','merchant_더미','24000','더미','','','6','6');
INSERT INTO reserveList
VALUES ((SELECT NVL(MAX(rNo)+1,1) FROM reserveList), to_date('2016-11-06 18:50', 'YYYY-MM-DD HH24:MI'),
                                                     'C11,C12,C13','3','신용카드','24000','imp_더미24','merchant_더미','24000','더미','','','6','6');

COMMIT;

SELECT * FROM reserveList;
/*******************FAQ 테이블 생성*************************************************************************************/
DROP TABLE faq CASCADE CONSTRAINTS;
CREATE TABLE faq (
  fNo            NUMBER          CONSTRAINT faq_pk_fNo PRIMARY KEY,
  question       VARCHAR2(100)    CONSTRAINT faq_nn_question NOT NULL,
  answer         CLOB            CONSTRAINT faq_nn_answer NOT NULL
);

/*데이터는 엑셀로 입력*/

SELECT * FROM faq;
