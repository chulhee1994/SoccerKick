/**
 *	상품 정보 입력 유효성 검사
 */

 function checkProduct(){
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
	
	
	//번호 자동 입력 검사 X
	
	//상품 이름 검사
	var regName = /^[가-힣|0-9]*$/;
	if(!regName.test(name) || name.length==0 ||name==null){
		alert("상품 이름을 다시 입력해주세요.");
		form.name.select();
		return;
	}
	//가격 검사
	if(parseInt(price)<=0 || isNaN(price) ||price.length==0){
		alert("가격을 잘못 입력하셨습니다.");
		form.price.focus();
		return;
	}
	
	//배급사 
	var regPublisher = /^[가-힣a-zA-Z]*$/;
	if(!regPublisher.test(publisher) || publisher.length==0){
		alert("배급사를 다시 입력해주세요.");
		form.publisher.select();
		return;
	}
	//상태 검사X select
		
	//이미지 검사X img 파일형태
	
	//정보 검사
	if(information.length==0||information.length <10){
		alert("정보를 10자이상 입력하세요.");
		form.information.select();
		return;
	}
	//분류 검사
	var regCatogory = /^[가-힣]*$/;
	if(!regCatogory.test(category) ||category.length==0){
		alert("분류를 다시 입력해주세요.");
		form.category.select();
		return;
	}
	
	//재고 검사
	if(parseInt(inventory)<=0||isNaN(inventory) ||inventory.length==0 ){
		alert("재고를 다시 입력해주세요.");
		form.inventory.focus();
		return;
	}
	form.submit();
 }