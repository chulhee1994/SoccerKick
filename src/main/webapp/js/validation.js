/**
 *	상품 정보 입력 유효성 검사
 */
function checkProduct() {
    //상품 번호 num
    //상품 이름 name
    //가격 price
    //배급사 publisher
    //상태 condition
    //이미지 img
    //정보 information
    //분류 category
    //재고 inventory
    
    var form = document.registerForm;
    
    var num = form.num.value;
    var name = form.name.value;
    var price = form.price.value;
    var publisher = form.publisher.value;
    var condition = form.condition.value;
    var information = form.information.value;
    var category = form.category.value;
    var inventory = form.inventory.value;

    // 모든 필수 항목이 채워져야만 폼을 제출하도록 검사

    // 상품 번호 검사
    if (num.length === 0) {
        alert("상품 번호를 입력해주세요.");
        form.num.focus();
        return false;
    }
    
// 상품 이름 검사 (한글, 숫자, 영어 대소문자, 중간 공백 허용)
var regName = /^[가-힣a-zA-Z0-9\s]+$/;

if (!regName.test(name) || name.length == 0 || name == null) {
    alert("상품 이름을 다시 입력해주세요.");
    form.name.select();
    return false;
}

    
    // 가격 검사
    if (parseInt(price) <= 0 || isNaN(price) || price.length == 0) {
        alert("가격을 잘못 입력하셨습니다.");
        form.price.focus();
        return false;
    }
    
    // 배급사 검사
    var regPublisher = /^[가-힣a-zA-Z]*$/;
    if (!regPublisher.test(publisher) || publisher.length == 0) {
        alert("배급사를 다시 입력해주세요.");
        form.publisher.select();
        return false;
    }
    
    // 상태 검사: Select에 대한 처리가 필요하다면 추가해 주세요
    if (condition.length == 0) {
        alert("상태를 선택해주세요.");
        form.condition.focus();
        return false;
    }
    
    // 이미지 검사 (이미지 파일 형태에 대한 처리가 필요할 경우 추가)
    if (form.img.files.length === 0) {
        alert("이미지를 선택해주세요.");
        form.img.focus();
        return false;
    }
    
    // 정보 검사
    if (information.length == 0 || information.length < 10) {
        alert("정보를 10자 이상 입력하세요.");
        form.information.select();
        return false;
    }
    
    // 분류 검사
    var regCategory = /^[가-힣]*$/;
    if (!regCategory.test(category) || category.length == 0) {
        alert("분류를 다시 입력해주세요.");
        form.category.select();
        return false;
    }
    
    // 재고 검사
    if (parseInt(inventory) <= 0 || isNaN(inventory) || inventory.length == 0) {
        alert("재고를 다시 입력해주세요.");
        form.inventory.focus();
        return false;
    }

    // 모든 입력이 정상이면 폼을 제출
    form.submit();
}
