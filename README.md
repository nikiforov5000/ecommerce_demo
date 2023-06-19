# eCommerce mobile app

<h2> A Flutter mobile eCommerce application. </h2>

You can try this app in your browser in responsive mode: https://ecommerce-demo-9fa8b.web.app/

When a user registers on your Flutter app, a new user account is created in Firebase Authentication, and a new document is added to the "users" collection in Firestore. Additionally, a new document is created in the "shoppingCarts" collection, which is associated with the user's ID.

Each shopping cart in the "shoppingCarts" collection contains a "cartItems" subcollection, which holds all the items added to the cart. Each cart item is represented by a document within this subcollection, and contains the following fields:

    additionDate: The date and time the item was added to the cart.
    id: A unique identifier for the cart item.
    imgUrl: The URL of the product image.
    price: The price of the product.
    productId: A unique identifier for the product.
    quantity: The quantity of the product added to the cart.
    title: The title or name of the product.

This database structure allows you to easily retrieve a user's shopping cart and its contents, and track the items they have added to their cart. It also enables you to associate a user's shopping cart with their account and maintain a record of their cart history.

 <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/welcome_screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/login-screen.png" width=250px>  
<img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/register.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/google-sign-in.png" width=250px>


<img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/categories_screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/products-list-screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/products-list-screen-search.png" width=250px>

<img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/product-screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/product-large-image-screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/shopping-cart-screen.png" width=250px>

<img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/order_summary_screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/order_success_screen.png" width=250px>  <img src="https://github.com/nikiforov5000/ecommerce_demo/blob/master/screenshots/user-account-screen.png" width=250px>

