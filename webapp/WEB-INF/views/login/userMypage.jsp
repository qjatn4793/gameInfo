<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mypage - User</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">마이페이지</h3></div>
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input th:value="${session.userName}" class="form-control" id="userName" type="text" maxlength="10" readonly/>
                                                    <label for="userName">이름</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input th:value="${session.userPhone}" class="form-control" id="userPhone" type="tel" maxlength="11" readonly/>
                                                    <label for="userName">휴대폰번호</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input th:value="${session.userBirth}" class="form-control" id="userBirth" type="text" maxlength="8" readonly/>
                                            <label for="userName">생년월일</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input th:value="${session.userId}" class="form-control" id="userId" type="text" maxlength="20" readonly/>
                                            <label for="userName">사용자 ID</label>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input style="display:none;" class="form-control" id="userPw" type="password" placeholder="패스워드를 입력해 주세요" minlength="10" maxlength="20" readonly/>
                                                    <label style="display:none;" id="userPwLabel" for="userPw">변경하실 패스워드를 입력해 주세요</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input style="display:none;" class="form-control" id="userPwConfirm" type="password" placeholder="다시한번 패스워드를 입력해 주세요" minlength="10" maxlength="20" onkeyup="userPwCheck()" readonly/>
                                                    <label style="display:none;" id="userPwConfirmLabel" for="userPwConfirm">다시한번 패스워드를 입력해 주세요</label>
                                                </div>
                                            </div>
                                        </div>
                                        <p id = "checkPw" size = "2"></p>
                                    </div>
                                    <div class="card-footer py-3"> <!-- text-center 클래스 제거함 -->
                                        <div class="small">
                                            <button id="userUpdateToggle" class="btn btn-primary btn-block" onclick="userUpdateToggle()">회원정보수정</button>
                                            <button id="userUpdate" class="btn btn-primary btn-block" style="display:none;" onclick="userUpdate()">회원정보수정완료</button>
                                        </div>
                                    </div>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="/" >메인으로 돌아가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
        <script>
            function userPwCheck(){
                var userPw = $("#userPw").val();
                var userPwConfirm = $("#userPwConfirm").val();

                if(userPw == userPwConfirm){
                    $("#checkPw").html("변경할 비밀번호가 같습니다.");
                    $("#checkPw").css("color", "green");
                }else {
                    $("#checkPw").html("변경할 비밀번호가 서로 다릅니다. 확인해 주세요.");
                    $("#checkPw").css("color", "red");
                }
            }

            function userUpdateToggle(){

                alert("회원정보를 수정해 주세요!\n사용자 ID 를 제외한 값을 수정이 가능합니다.");

                $('#userUpdateToggle').css('display', 'none');
                $('#userUpdate').css("display", "block");
                $('#userPw').css("display", "block");
                $('#userPwConfirm').css("display", "block");
                $('#userPwLabel').css("display", "block");
                $('#userPwConfirmLabel').css("display", "block");

                $('#userName').prop('readonly', false);
                $('#userPhone').prop('readonly', false);
                $('#userBirth').prop('readonly', false);
                $('#userPw').prop('readonly', false);
                $('#userPwConfirm').prop('readonly', false);
            }

            function userUpdate(){

                var userId = $("#userId").val();
                var userPw = $("#userPw").val();
                var userPwConfirm = $("#userPwConfirm").val();
                var userName = $("#userName").val();
                var userBirth = $("#userBirth").val();
                var userPhone = $("#userPhone").val();

                var numCheck = /^[0-9]+$/;

                var userBirthY = userBirth.substring(0,4);
                var userBirthM = userBirth.substring(4,6);

                var now = new Date();
                var year = now.getFullYear();

                if(userId != null && userId != "" && userPw != null && userPw != "" && userPwConfirm != null && userPwConfirm != "" && userName != null && userName != "" && userBirth != null && userBirth != "" && userPhone != null && userPhone != "") {
                    if (numCheck.test(userBirth) && numCheck.test(userPhone)) { // userBirth, userPhone 이 숫자만 입력되었을 때
                        if (userBirthM < 13 && userBirthY < year && userBirth > 1900 && userBirth.length > 7) { // 생년월일에서 입력한 월이 13월을 넘지 않고 현재 년도 보다 낮을 경우 1900년생 보다 높을경우
                            if (userPw == userPwConfirm) { // userPw 와 userPwConfirm 이 같을 때
                                // 특정 문자열 발견시 공백으로 치환 : userId
                                userId = userId.replace(/\</g, '');
                                userId = userId.replace(/\>/g, '');
                                userId = userId.replace(/\#/g, '');
                                userId = userId.replace(/\$/g, '');
                                userId = userId.replace(/\@/g, '');
                                userId = userId.replace(/\^/g, '');
                                userId = userId.replace(/\&/g, '');
                                userId = userId.replace(/\*/g, '');
                                userId = userId.replace(/\(/g, '');
                                userId = userId.replace(/\)/g, '');
                                userId = userId.replace(/\;/g, '');
                                userId = userId.replace(/\=/g, '');
                                userId = userId.replace(/\'/g, '');
                                userId = userId.replace(/\"/g, '');

                                userName = userName.replace(/\</g, '');
                                userName = userName.replace(/\>/g, '');
                                userName = userName.replace(/\#/g, '');
                                userName = userName.replace(/\$/g, '');
                                userName = userName.replace(/\@/g, '');
                                userName = userName.replace(/\^/g, '');
                                userName = userName.replace(/\&/g, '');
                                userName = userName.replace(/\*/g, '');
                                userName = userName.replace(/\(/g, '');
                                userName = userName.replace(/\)/g, '');
                                userName = userName.replace(/\;/g, '');
                                userName = userName.replace(/\=/g, '');
                                userName = userName.replace(/\'/g, '');
                                userName = userName.replace(/\"/g, '');


                                $.ajax({
                                    type: "PUT",
                                    url: "/userRegister",
                                    dataType: "text",
                                    async: false,
                                    contentType: "application/json",
                                    data: JSON.stringify({
                                        "userId": userId,
                                        "userPw": userPw,
                                        "userName": userName,
                                        "userBirth": userBirth,
                                        "userPhone": userPhone,
                                        "status": 1
                                    }),
                                    async: false,
                                    error: function () {
                                        alert('회원수정을 실패 하였습니다. \n입력하신 정보를 확인해주세요.');
                                    },
                                    success: function (data) {
                                        if (data == "1") {
                                            alert(userName + '님 ' + '회원수정을 성공 하였습니다. \n다시 로그인 해주세요!');
                                            location.replace("/login");
                                        } else {
                                            alert('회원수정을 실패 하였습니다. \n입력하신 정보를 확인해주세요.');
                                            location.replace("/userMypage");
                                        }
                                    }
                                });
                            } else { // userPw 와 userPwConfirm 이 같지 않을 때
                                alert("변경할 비밀번호와 변경할 비밀번호 재입력 값이 서로 같지 않습니다. \n다시한번 확인해주세요.");
                            }
                        } else { // 생년월일에서 입력한 월이 13월을 넘지 않고 현재 년도 보다 낮지 않을 경우
                            alert("생년월일을 확인해 주세요!");
                        }
                    } else { // userBirth, userPhone 이 숫자만 입력되지 않았을 때
                        alert("가입하실 휴대폰 번호나 생년월일은 숫자만 입력이 가능합니다. \n다시한번 확인해주세요.");
                    }
                }else{
                    alert("빈 칸을 모두 채워주세요!");
                }
            }
        </script>
    </body>
</html>
