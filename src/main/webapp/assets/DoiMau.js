// Định nghĩa hàm để thay đổi màu sắc khi click vào input
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


  function handleInputClick(inputId, quantity) {
    console.log('Input ID:', inputId);
    console.log('Quantity:', quantity);

    var inputValue = document.getElementById(inputId).value;
    console.log('Input Value:', inputValue);

    var spanId = 'quantityDisplay' + inputId.substring('sizeInput'.length);
    console.log('Span ID:', spanId);

    var quantityDisplay = document.getElementById(spanId);
    if (quantityDisplay) {
        quantityDisplay.textContent = `Số lượng còn lại: ${quantity}`;
        quantityDisplay.style.display = 'inline-block';
        console.log('Quantity Display:', quantityDisplay);
    } else {
        console.log('Không tìm thấy span:', spanId);
    }
}








