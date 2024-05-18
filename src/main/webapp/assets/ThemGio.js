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

function handleInputClick(clickedInput) {
        var inputValue = clickedInput.value;
        var quantity = clickedInput.getAttribute('data-quantity');
        var span = document.getElementById('span');
        var outputInput = document.getElementById('sizeInputOutput');
        var btnThem = document.getElementById('btnThem');

        // Hiển thị số lượng còn lại và giá trị của input
        if (span) {
            span.textContent = `Số lượng còn lại: ${quantity}`;
            span.style.display = 'inline-block';
        } else {
            console.log('Không tìm thấy span có id "span"');
        }

        if (outputInput) {
            outputInput.value = inputValue;
        } else {
            console.log('Không tìm thấy thẻ input có id là sizeInputOutput');
        }

        // Bỏ thuộc tính disabled của button
        if (btnThem) {
            btnThem.removeAttribute('disabled');
        } else {
            console.log('Không tìm thấy button có id là btnThem');
        }
    }

