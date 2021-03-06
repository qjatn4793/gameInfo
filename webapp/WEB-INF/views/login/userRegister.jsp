<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - User</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 가입</h3></div>
                                    <div class="card-body">
                                        <!--<form>-->
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userName" type="text" placeholder="이름을 입력해 주세요" maxlength="10"/>
                                                        <label for="userName">이름</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="userPhone" type="tel" placeholder="휴대폰 번호를 - 없이 입력해 주세요" maxlength="11"/>
                                                        <label for="userPhone">휴대폰 번호를 - 없이 입력해 주세요</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userBirth" type="text" placeholder="생년월일을 - 없이 입력해 주세요 (예 : 20220101)" maxlength="8"/>
                                                <label for="userBirth">생년월일을 - 없이 입력해 주세요 (예 : 20220101)</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userId" type="text" placeholder="ID를 입력해 주세요" maxlength="20" onkeyup="userIdCheck()"/>
                                                <label for="userId">ID를 입력해 주세요</label>
                                            </div>
                                            <p id = "checkId" size = "2"></p>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPw" type="password" placeholder="패스워드를 입력해 주세요" minlength="10" maxlength="20"/>
                                                        <label for="userPw">패스워드를 입력해 주세요</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPwConfirm" type="password" placeholder="다시한번 패스워드를 입력해 주세요" minlength="10" maxlength="20" onkeyup="userPwCheck()"/>
                                                        <label for="userPwConfirm">다시한번 패스워드를 입력해 주세요</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <p id = "checkPw" size = "2"></p>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><button class="btn btn-primary btn-block" onclick="userRegister()">회원 가입</button></div>
                                            </div>
                                        <!--</form>-->
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/login">Have an account? Go to login</a></div>
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

            function userIdCheck() {
                var userId = $("#userId").val();

                $.ajax({
                    type: "POST",
                    url: "/userIdCheck",
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "userId": userId
                    }),
                    async: false,
                    error: function () {
                        $("#checkId").html("사용할 수 없는 ID 입니다.");
                        $("#checkId").attr("color", "red");
                    },
                    success: function (data) {
                        if (userId.length > 5 && userId.match(/[A-Za-z0-9]/) != null) {
                            if (data == "0") {
                                $("#checkId").html("사용할 수 있는 ID 입니다.");
                                $("#checkId").css("color", "green");
                            } else {
                                $("#checkId").html("사용할 수 없는 ID 입니다.");
                                $("#checkId").css("color", "red");
                            }
                        }else {
                            $("#checkId").html("ID 는 숫자 포함 5자리 이상이어야 합니다.");
                            $("#checkId").css("color", "red");
                        }
                    }
                });
            }

            function userPwCheck(){
                var userPw = $("#userPw").val();
                var userPwConfirm = $("#userPwConfirm").val();

                if(userPw == userPwConfirm){
                    $("#checkPw").html("비밀번호가 같습니다.");
                    $("#checkPw").css("color", "green");
                }else {
                    $("#checkPw").html("비밀번호가 서로 다릅니다. 확인해 주세요.");
                    $("#checkPw").css("color", "red");
                }
            }

            function registerEnterKey() {
                if(window.event.keyCode==13){
                    userRegister();
                }
            }

            function userRegister(){

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
                                    type: "POST",
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
                                        alert('회원가입을 실패 하였습니다.');
                                    },
                                    success: function (data) {
                                        if (data == "1") {
                                            alert(userName + '님 ' + '회원가입을 성공 하였습니다. \n가입한 ID / PW 로 로그인을 진행하세요!');
                                            location.replace("/login");
                                        } else {
                                            alert('회원가입을 실패 하였습니다.');
                                            location.replace("/userRegister");
                                        }
                                    }
                                });
                            } else { // userPw 와 userPwConfirm 이 같지 않을 때
                                alert("비밀번호와 비밀번호 재입력 값이 서로 같지 않습니다. \n다시한번 확인해주세요.");
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
