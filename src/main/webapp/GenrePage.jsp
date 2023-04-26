<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resource/css/genrepage.css">
    <script src="resource/js/genrepage.js"></script>
</head>

<body>
    <nav>
        <div class="top-nav">
            <div class="top-nav-left">도서관</div>
            <div class="serach">
                <input type="text" placeholder="검색어를 입력" class="serach_text">
            </div>
            <div class="top-nav-right">
                <ul>
                    <li>로그인</li>
                    <li>회원가입</li>
                </ul>
            </div>
        </div>
        <hr>
        <div class="middle-nav">
            <div class="nav_genre">
                <ul>
                    <li onclick="click_genre('thriller');" id="thriller" class="select_">스릴러</li>
                    <li onclick="click_genre('romance');" id="romance" class="select_">로맨스</li>
                    <li onclick="click_genre('romance_fantasy');" id="romance_fantasy" class="select_">로맨스 판타지</li>
                    <li onclick="click_genre('modern');" id="modern" class="select_">현대</li>
                    <li onclick="click_genre('fantasy');" id="fantasy" class="select_">판타지</li>
                    <li onclick="click_genre('action');" id="action" class="select_">무협</li>
                    <li onclick="click_genre('comic');" id="comic" class="select_">개그</li>
                </ul>
            </div>
            <div>예정</div>
        </div>
        <hr>
        <div class="bot-nav" id="nav-b">
            <div class="submit_btn">
                <ul>
                    <li>
                        <form><input type="submit" value="월" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="화" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="수" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="목" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="금" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="토" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                    <li>
                        <form><input type="submit" value="일" name="Day" class="btn_day"><input type="hidden"
                                id="get_genre" name="Genre" value=""></form>
                    </li>
                </ul>
            </div>
            <div>예정</div>
        </div>
    </nav>
    <div class="main_body">
        <div class="informations">
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/신의탑.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/뷰군.jpg" class="img_size"></div>
                <div class="card_title">뷰티풀 군바리</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/퀘스트 지상 주의.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/윈드 브레이커.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : 조용석</div>
                    <div class="card_art_author">그림 : 조용석</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/신의탑.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/신의탑.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
            <div class="info_card">
                <div class="card_img"><img src="resource/img/webtoon/신의탑.jpg" class="img_size"></div>
                <div class="card_title">신의 탑</div>
                <div class="up_day">월 요일</div>
                <div class="author">
                    <div class="card_story_author">글 : SIU</div>
                    <div class="card_art_author">그림 : SIU</div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>