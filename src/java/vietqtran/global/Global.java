/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.global;

/**
 *
 * @author tranq
 */
public class Global {

    /**
     *
     * SQL Server Query
     */
    // Address
    public static String INSERT_ADDRESS = "INSERT INTO address ([detail], [town], [district], [city]) VALUES (?, ?, ?, ?)";
    public static String GET_ALL_ADDRESS = "SELECT * FROM address";
    public static String GET_ADDRESS_BY_ID = "SELECT * FROM address WHERE id = ?";
    public static String UPDATE_ADDRESS = "UPDATE address SET [detail] = ?, town = ?, district = ?, [city] = ? where id = ?";
    public static String DELETE_ADDRESS = "DELETE FROM address WHERE id = ?";

    // Cart
    public static String INSERT_CART = "INSERT INTO carts ([userId]) VALUES (?);";
    public static String GET_ALL_CARTS = "SELECT * FROM carts";
    public static String GET_CART_BY_ID = "SELECT * FROM carts WHERE id = ?";
    public static String DELETE_CART = "DELETE FROM carts WHERE id = ?";

    // Cart Product
    public static String INSERT_CART_PRODUCT = "INSERT INTO [cartProducts] ([productId], [cartId], [shopId], [quantity], [price], [salePrice], [totalPrice]) VALUES (?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_CART_PRODUCTS = "SELECT * FROM cartProducts";
    public static String GET_CART_PRODUCT_BY_ID = "SELECT * FROM [cartProducts] WHERE id = ?";
    public static String UPDATE_CART_PRODUCT = "UPDATE [cartProducts] SET [quantity] = ?, [price] = ?, [salePrice] = ?, [totalPrice] = ? where id = ?";
    public static String DELETE_CART_PRODUCT = "DELETE FROM cartProducts WHERE id = ?";

    // Category
    public static String INSERT_CATEGORY = "INSERT INTO categories ([name], [image]) VALUES (?, ?)";
    public static String GET_ALL_CATEGORIES = "SELECT * FROM categories";
    public static String GET_CATEGORY_BY_ID = "SELECT * FROM categories WHERE id = ?";
    public static String UPDATE_CATEGORY = "UPDATE categories SET [name] = ?, [image] = ? where id = ?";
    public static String DELETE_CATEGORY = "DELETE FROM categories WHERE id = ?";

    // Color
    public static String INSERT_COLOR = "INSERT INTO colors ([name], code) VALUES (?, ?);";
    public static String GET_ALL_COLORS = "SELECT * FROM colors";
    public static String GET_COLOR_BY_ID = "SELECT * FROM colors WHERE id = ?";
    public static String UPDATE_COLOR = "UPDATE colors SET [name] = ?, code = ? WHERE id = ?;";
    public static String DELETE_COLOR = "DELETE FROM colors WHERE id = ?";

    // Order
    public static String INSERT_ORDER = "INSERT INTO [orders] ([userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [successDate], [phone], [address], [status], [voucherId], [note], [deliveryChecking]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_ORDERS = "SELECT * FROM orders";
    public static String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE id = ?";
    public static String UPDATE_ORDER = "UPDATE [orders] SET [shipperId] = ?, [totalPrice] = ?, [saleTotalPrice] = ?, [successDate] = ?, [phone] = ?, [address] = ?, [voucherId] = ?, [status] = ?, [note] = ?, [deliveryChecking] = ? WHERE id = ?;";
    public static String DELETE_ORDER = "DELETE FROM orders WHERE id = ?";

    // Order Product
    public static String INSERT_ORDER_PRODUCT = "INSERT INTO [orderProducts] ([orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl]) VALUES (?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_ORDER_PRODUCTS = "SELECT * FROM orderProducts";
    public static String GET_ORDER_PRODUCT_BY_ID = "SELECT * FROM orderProducts WHERE id = ?";
    public static String UPDATE_ORDER_PRODUCT = "UPDATE [orderProducts] SET [productPrice] = ?, [salePrice] = ?, [quantity] = ?, [totalPrice] = ? WHERE [id] = ?;";
    public static String DELETE_ORDER_PRODUCT = "DELETE FROM orderProducts WHERE id = ?";

    // Product
    public static String INSERT_PRODUCT = "INSERT INTO products ([name], price, salePrice, [description], city, rate, boughtQuantity, color, categoryId, shopCategoryId, shopId, createBy, [url]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_PRODUCTS = "SELECT * FROM products";
    public static String GET_PRODUCT_BY_ID = "SELECT * FROM products WHERE id = ?";
    public static String UPDATE_PRODUCT = "UPDATE products SET [name] = ?, price = ?, salePrice = ?, [description] = ?, rate = ?, city = ?, [boughtQuantity] = ?, [url] = ?, color = ?, shopCategoryId = ?, categoryId = ? deleteBy = ? WHERE id = ?; ";
    public static String DELETE_PRODUCT = "DELETE FROM products WHERE id = ?";

    // Product Image
    public static String INSERT_PRODUCT_IMAGE = "INSERT INTO productImages (productId, imageUrl, [role]) VALUES (?, ?, ?);";
    public static String GET_ALL_PRODUCT_IMAGES = "SELECT * FROM productImages";
    public static String GET_PRODUCT_IMAGE_BY_ID = "SELECT * FROM productImages WHERE id = ?";
    public static String UPDATE_PRODUCT_IMAGE = "UPDATE productImages SET [imageUrl] = ?, [role] = ? WHERE id = ?";
    public static String DELETE_PRODUCT_IMAGE = "DELETE FROM productImages WHERE id = ?";

    // Rate
    public static String INSERT_RATE = "INSERT INTO [rates] ([userId], [productId], [star], [content]) VALUES(?, ?, ?, ?);";
    public static String GET_ALL_RATES = "SELECT * FROM rates";
    public static String GET_RATE_BY_ID = "SELECT * FROM rates WHERE id = ?";
    public static String DELETE_RATE = "DELETE FROM rates WHERE id = ?";

    // Ship Company
    public static String INSERT_SHIP_COMPANY = "INSERT INTO [shipCompany] ( [name], [image]) VALUES (?, ?);";
    public static String GET_ALL_SHIP_COMPANIES = "SELECT * FROM shipCompany";
    public static String GET_SHIP_COMPANY_BY_ID = "SELECT * FROM shipCompany WHERE id = ?";
    public static String UPDATE_SHIP_COMPANY = "UPDATE shipCompany SET name = ?, image = ? WHERE id = ?;";
    public static String DELETE_SHIP_COMPANY = "DELETE FROM shipCompany WHERE id = ?";

    // Shipper
    public static String INSERT_SHIPPER = "INSERT INTO [shippers] ([username], [password], [firstName], [lastName], [email], [phone], [avatar], [shipCompany]) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_SHIPPERS = "SELECT * FROM shippers";
    public static String GET_SHIPPER_BY_ID = "SELECT * FROM shippers WHERE id = ?";
    public static String UPDATE_SHIPPER = "UPDATE shippers SET username = ?, password = ?, firstName = ?, lastName = ?, email = ?, phone = ?, avatar = ?, shipCompany = ? WHERE id = ?;";
    public static String DELETE_SHIPPER = "DELETE FROM shippers WHERE id = ?";

    // Shop Category
    public static String INSERT_SHOP_CATEGORY = "INSERT INTO shopCategories ([name], [image]) VALUES (?, ?)";
    public static String GET_ALL_SHOP_CATEGORIES = "SELECT * FROM shopCategories";
    public static String GET_SHOP_CATEGORY_BY_ID = "SELECT * FROM shopCategories WHERE id = ?";
    public static String UPDATE_SHOP_CATEGORY = "UPDATE shopCategories SET [name] = ?, [shopId] = ? where id = ?";
    public static String DELETE_SHOP_CATEGORY = "DELETE FROM shopCategories WHERE id = ?";

    // Shop
    public static String INSERT_SHOP = "INSERT INTO shops (email, password, [name], [address], active, avatar) VALUES(?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_SHOPS = "SELECT * FROM shops";
    public static String GET_SHOP_BY_ID = "SELECT * FROM shops WHERE id = ?";
    public static String UPDATE_SHOP = "UPDATE shops SET email = ?, password = ?,  [name] = ?, [address] = ?, active = ?, avatar = ? WHERE id = ?";
    public static String DELETE_SHOP = "DELETE FROM shops WHERE id = ?";
    public static String DISABLE_SHOP = "UPDATE shops SET active = 0 WHERE id = ?;";
    public static String ENABLE_SHOP = "UPDATE shops SET active = 1 WHERE id = ?;";

    // Shop Report
    public static String INSERT_SHOP_REPORT = "INSERT INTO shopReports (shopId, profit, revenue, expense, amountOrders, amountProducts) VALUES(?, ?, ?, ?, ?, ?);";
    public static String GET_SHOP_REPORT_BY_ID = "SELECT * FROM shopReports WHERE id = ?";
    public static String UPDATE_SHOP_REPORT = "UPDATE shopReports SET profit = ?, revenue = ?, expense = ?, amountOrders = ?, amountProducts = ? WHERE id = ?";
    public static String DELETE_SHOP_REPORT = "DELETE FROM shopReports WHERE id = ?";

    // Size Product
    public static String INSERT_SIZE = "INSERT INTO sizesProduct (inventory, [name], productId) VALUES (?, ?, ?);";
    public static String GET_ALL_SIZES = "SELECT * FROM sizesProduct";
    public static String GET_SIZE_BY_ID = "SELECT * FROM sizesProduct WHERE id = ?";
    public static String UPDATE_SIZE = "UPDATE sizesProduct SET inventory = ?, [name] = ?, productId = ? WHERE id = ?;";
    public static String DELETE_SIZE = "DELETE FROM sizesProduct WHERE id = ?";

    //User
    public static String INSERT_USER = "INSERT INTO users (username, [password], name, email, phone, role, avatar, address) VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
    public static String GET_ALL_USERS = "SELECT * FROM users";
    public static String GET_USER_BY_ID = "SELECT * FROM users WHERE id = ?";
    public static String UPDATE_USER = "UPDATE users SET username = ?, password = ?, name = ?, email = ?, phone = ?, role = ?, avatar = ?, address = ? WHERE id = ?";
    public static String DELETE_USER = "DELETE FROM users WHERE id = ?";
    public static String GET_LOGIN_USER = "SELECT * FROM users WHERE email = ? and password = ?;";
    public static String CHECK_USER_EXISTED = "SELECT * FROM users WHERE email = ?;";

    //User Role
    public static String INSERT_USER_ROLE = "INSERT INTO roles (userType) VALUES (?);";
    public static String GET_ALL_USER_ROLES = "SELECT * FROM roles";
    public static String GET_USER_ROLE_BY_ID = "SELECT * FROM roles WHERE id = ?";
    public static String UPDATE_USER_ROLE = "UPDATE roles SET userType = ? WHERE id = ?;";
    public static String DELETE_USER_ROLE = "DELETE FROM roles WHERE id = ?";

    // Voucher
    public static String INSERT_VOUCHER = "INSERT INTO vouchers (priceCondition, price, [percent], createBy, deleteBy) VALUES (?, ?, ?, ?, ?);";
    public static String GET_ALL_VOUCHERS = "SELECT * FROM vouchers";
    public static String GET_VOUCHER_BY_ID = "SELECT * FROM vouchers WHERE id = ?";
    public static String UPDATE_VOUCHER = "UPDATE vouchers SET priceCondition = ?, price = ?, [percent] = ?, createBy = ?, deleteBy = ? WHERE id = ?;";
    public static String DELETE_VOUCHER = "DELETE FROM vouchers WHERE id = ?";
}
