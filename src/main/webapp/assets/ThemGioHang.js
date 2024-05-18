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
	var slInputOutput = document.getElementById('slInputOutput');
	if (slInputOutput) {
        slInputOutput.value = quantity;
    } else {
        console.log('Không tìm thấy thẻ input có id là sizeInputOutput');
    }
    var outputInput = document.getElementById('sizeInputOutput');
    if (outputInput) {
        outputInput.value = inputValue;
    } else {
        console.log('Không tìm thấy thẻ input có id là sizeInputOutput');
    }

    // Kiểm tra sự tồn tại của thẻ input có id="sizeInputOutput"
    if (!(outputInput.value)) {
        // Nếu không tìm thấy thẻ input, ngăn chặn người dùng nhấp vào nút "Thêm vào giỏ hàng"
        var addToCartButton = document.querySelector('input[name="btnThem"]');
        if (addToCartButton) {
            addToCartButton.disabled = true; // Vô hiệu hóa nút
            span.textContent = `Bạn phải chọn kích thước`;
        	span.style.display = 'inline-block';// Hiển thị thông báo
        }
    } else {
        // Nếu tìm thấy thẻ input, bật nút "Thêm vào giỏ hàng"
        var addToCartButton = document.querySelector('input[name="btnThem"]');
        if (addToCartButton) {
            addToCartButton.disabled = false; // Cho phép nhấp vào nút
        }
    }
}












