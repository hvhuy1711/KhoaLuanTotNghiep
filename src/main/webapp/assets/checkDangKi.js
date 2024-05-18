
function validateEmail() {
  var emailInput = document.getElementById("emailInput");
  var emailMessage = document.getElementById("emailMessage");
  var emailRegex = /^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$/;

  if (emailRegex.test(emailInput.value)) {
    emailMessage.textContent = "Email hợp lệ";
    emailMessage.style.color = "green";
  } else {
    emailMessage.textContent = "Email không hợp lệ";
    emailMessage.style.color = "red";
  }
}
  
// Trigger validation when the input field loses focus
document.getElementById("email").addEventListener("blur", validateEmail);