/**
 * 
 */// Định nghĩa hàm để thay đổi màu sắc khi click vào input
function changeInputColor(input) {
	input.style.backgroundColor = '#446879'; // Màu sắc mới khi click
}
function changeInputColorBack(input) {
	input.style.backgroundColor = '#efefef'; // Màu sắc mới khi click
}

// Lặp qua tất cả các input và thêm sự kiện click cho mỗi input
var inputs = document.querySelectorAll('input[name="themGio"]');
inputs.forEach(function(input) {
	input.addEventListener('click', function() {
    	event.preventDefault();
        
        // Đặt màu sắc của input khi click
        changeInputColor(this);

        // Đặt lại màu sắc của các input khác về trạng thái ban đầu
        inputs.forEach(function(otherInput) {
            if (otherInput !== input) {
                changeInputColorBack(otherInput);
            }
        });

	});
});
// Hàm để cập nhật trạng thái của nút "Thêm vào giỏ hàng"
function updateCartButtonState() {
    var addToCartButton = document.querySelector('.add-to-cart');
    var outputInput = document.getElementById('sizeInputOutput');
    var inputValue = outputInput.value;

    // Kiểm tra giá trị của input phía dưới
    if (inputValue.trim() !== '') {
        // Nếu có giá trị, bật nút "Thêm vào giỏ hàng"
        addToCartButton.disabled = false; // Cho phép người dùng nhấp vào
        addToCartButton.style.opacity = '1'; // Hiển thị nút
    } else {
        // Nếu không có giá trị, vô hiệu hóa nút "Thêm vào giỏ hàng"
        addToCartButton.disabled = true; // Ngăn chặn người dùng nhấp vào
        addToCartButton.style.opacity = '0.5'; // Ẩn nút
    }
}

/*// Hàm được gọi khi người dùng chọn một kích thước từ danh sách input
function updateQuantityDisplay(clickedInput) {
    var inputValue = clickedInput.value;
    var quantity = clickedInput.getAttribute('data-quantity');

    var span = document.getElementById('span');

    if (span) {
        span.textContent = `Số lượng còn lại: ${quantity}`;
        span.style.display = 'inline-block';
    } else {
        console.log('Không tìm thấy span có id "span"');
    }

    var outputInput = document.getElementById('sizeInputOutput');

    if (outputInput) {
        outputInput.value = inputValue;
    } else {
        console.log('Không tìm thấy thẻ input có id là sizeInputOutput');
    }

    // Sau khi cập nhật giá trị input, cập nhật trạng thái của nút "Thêm vào giỏ hàng"
    updateCartButtonState();
}*/













