/**
 * 상품 상세목록에서 장바구니로 상품을 보낼때 사용
 */

	//상품 카트목록으로 보내버리는 함수
	function addCart(){
		
		if(confirm("상품을 장바구니 목록에 추가하시겠습니까?")){
			//추가하기 장바구니 목록으로 보내버리기
			document.cart_form.submit();
		}else{
			document.cart_form.reset();
		}
			
		
	}
