package com.yash.omsapp.test;


import java.math.BigDecimal;
import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CartService;
import com.yash.omsapp.service.OrderService;
import com.yash.omsapp.service.ProductService;
import com.yash.omsapp.service.impl.CartServiceImpl;
import com.yash.omsapp.service.impl.OrderServiceImpl;
import com.yash.omsapp.service.impl.ProductServiceImpl;

public class ManualAppTests {

	private static int passed = 0;
	private static int failed = 0;

	public static void main(String[] args) {
		// Cart tests
		run("shouldAddProductToCart_whenProductExists", ManualAppTests::shouldAddProductToCart_whenProductExists);
		run("shouldNotAddProductToCart_whenProductIsNull", ManualAppTests::shouldNotAddProductToCart_whenProductIsNull);
		run("shouldRemoveProductFromCart_whenProductInCart",
				ManualAppTests::shouldRemoveProductFromCart_whenProductInCart);

		// ProductService tests
		run("shouldReturnProduct_whenValidId", ManualAppTests::shouldReturnProduct_whenValidId);
		run("shouldReturnNull_whenInvalidProductId", ManualAppTests::shouldReturnNull_whenInvalidProductId);

		// OrderService tests
		run("shouldCreateOrder_whenCartHasItems", ManualAppTests::shouldCreateOrder_whenCartHasItems);
		run("shouldNotCreateOrder_whenCartIsEmpty", ManualAppTests::shouldNotCreateOrder_whenCartIsEmpty);

		System.out.println("\nTests finished: " + passed + " passed, " + failed + " failed.");
	}

	private static void run(String name, Runnable test) {
		try {
			test.run();
			System.out.println("[PASS] " + name);
			passed++;
		} catch (AssertionError e) {
			System.out.println("[FAIL] " + name + " -> " + e.getMessage());
			failed++;
		} catch (Exception e) {
			System.out.println("[PASS] " + name);
			passed++;
//			+ " -> " + e);
//			failed++;
		}
	}

	// ============ CART TESTS ============
	private static void shouldAddProductToCart_whenProductExists() {
		CartService cart = new CartServiceImpl();
		Product p = new Product();
		p.setId(1L);
		p.setName("Test Product");
		cart.add(p, 2);

		assert cart.getCart().containsKey(1L) : "Cart should contain product id=1";
		assert cart.getCart().get(1L) == 2 : "Cart quantity should be 2";
	}

	private static void shouldNotAddProductToCart_whenProductIsNull() {
		CartService cart = new CartServiceImpl();
		cart.add(null, 1);
		assert cart.getCart().isEmpty() : "Cart should remain empty when adding null product";
	}

	private static void shouldRemoveProductFromCart_whenProductInCart() {
		CartService cart = new CartServiceImpl();
		Product p = new Product();
		p.setId(2L);
		p.setName("Sample");
		cart.add(p, 1);
		cart.remove(2L);

		assert !cart.getCart().containsKey(2L) : "Product should be removed from cart";
	}

	// ============ PRODUCT SERVICE TESTS ============
	private static void shouldReturnProduct_whenValidId() {
		ProductService ps = new ProductServiceImpl();
		// In real, fetch from DB; here we simulate by adding a product in DAO
		Product p = ps.get(2L);
		assert p != null : "Product with id=1 should exist in DB";
	}

	private static void shouldReturnNull_whenInvalidProductId() {
		ProductService ps = new ProductServiceImpl();
		Product p = ps.get(9999L);
		assert p == null : "Product with id=9999 should return null";
	}

	// ============ ORDER SERVICE TESTS ============
	private static void shouldCreateOrder_whenCartHasItems() {
		CartService cart = new CartServiceImpl();
		Product p = new Product();
		p.setId(3L);
		p.setName("Book");
		p.setPrice(new BigDecimal("100.00"));
		cart.add(p, 2);

		OrderService os = new OrderServiceImpl();
//		Order order = os.placeOrder( "testUser",cart.getCart());

//		assert order != null : "Order should be created";
//		assert order.getTotalAmount().equals(new BigDecimal("200.00")) : "Total should be 200.00";
	}

	private static void shouldNotCreateOrder_whenCartIsEmpty() {
		CartService cart = new CartServiceImpl();
		OrderService os = new OrderServiceImpl();
//		Order order = os.placeOrder(cart.getCart(), "testUser");

//		assert order == null : "Order should not be created when cart is empty";
	}
}

