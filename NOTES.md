#current cart flow

when gust
	*cart link
	    there is NO user && there is NO user.current_cart
	      the store page should NOT display link to cart
	*add to cart button  
	    there is NO user    
	      the store page should NOT display the add to cart button

when logged in
	*cart link
	   only if there is user.current_cart 
	      the store page should display link to cart
	*add to cart button   
	   only if there is user && the user.current_cart.status is NOT submited  
	      the store page should display the add to cart button

	*Creates a current_cart when adding first item   
        if there is current_cart
            post to 'carts#update' the new item
        else
            post to 'carts#creat' the new item
            which also setup the user.current_cart to the new cart     

 upon sign up
   create a new cart and sign it to user.current_cart 
   