/**
 * 
 */
 
 function validateForm() {
  const Id_ = document.getElementById("ID_").value.length;
  const Pw = document.getElementById("PW_").value;
  const Name = document.getElementById("NAME_").value;
  const Birth = document.getElementById("BIRTH_").value;
  const Gender = document.getElementById("GENDER_").value;
  let error = false;
 
   if (Id_ < 8 || Id_ > 16) {
    document.getElementById("id_inner").innerHTML = "8자리 이상 16자 이하";
    error = true;
  } else {
    document.getElementById("id_inner").innerHTML = "";
  }

  // Password validation
  const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
  if (!regExp.test(Pw)) {
    document.getElementById("pw_inner").innerHTML = "8자리 이상 16 자리 이하 영문, 숫자, 특수문자 포함";
    error = true;
  } else {
    document.getElementById("pw_inner").innerHTML = "";
  }

  // Name validation
  if (Name == "") {
    document.getElementById("name_inner").innerHTML = "필수 정보 입니다.";
    error = true;
  } else {
    document.getElementById("name_inner").innerHTML = "";
  }

  // Birth validation
  if (Birth.length < 8) {
    document.getElementById("birth_inner").innerHTML = "생년월일 8자리 입력해주세요";
    error = true;
  } else {
    document.getElementById("birth_inner").innerHTML = "";
  }

  // Gender validation
  if (Gender == 0) {
    document.getElementById("gender_inner").innerHTML = "필수 정보입니다.";
    error = true;
  } else {
    document.getElementById("gender_inner").innerHTML = "";
  }

  if (error) {
    return false;
  } else {
    return true;
  }
}