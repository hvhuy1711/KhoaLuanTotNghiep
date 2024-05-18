function setSubmitValue(value) {
  // Xác nhận giá trị tại đây nếu cần thiết (tùy chọn)
  // ...

  const ghiChuInput = document.getElementById('ghiChuInput');

  // Kiểm tra xem phần tử có tồn tại trước khi truy cập
  if (ghiChuInput) {
    ghiChuInput.dataset.storedValue = value; // Lưu trữ giá trị trong thuộc tính dữ liệu
    ghiChuInput.value = value; // Đặt giá trị để hiển thị tạm thời (tùy chọn)
  } else {
    console.error("Không tìm thấy phần tử có ID 'ghiChuInput'.");
  }
}
