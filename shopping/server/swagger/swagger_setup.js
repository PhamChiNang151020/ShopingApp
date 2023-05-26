/**
 * @swagger
 * tags:
 *   name: Login
 *   description: API for managing Login
 */
/**
 * @swagger
 * /api/signup:
 *   post:
 *      summary: Đăng ký
 *      tags: [Login]
 *      requestBody:
 *        required: true
 *        content:
 *          application/json:
 *            schema:
 *              type: object
 *              properties:
 *                username:
 *                  type: string
 *                password:
 *                  type: string
 *                email:
 *                  type: string
 *      responses:
 *        200:
 *          description: Đăng ký người dùng thành công
 *        400:
 *          description: Tên đăng nhập và mật khẩu không được để trống
 *        500:
 *          description: Lỗi khi đăng ký người dùng
 */

/**
 * @swagger
 * /api/login:
 *   post:
 *      summary: Đăng nhập
 *      tags: [Login]
 *      requestBody:
 *        required: true
 *        content:
 *          application/json:
 *            schema:
 *              type: object
 *              properties:
 *                username:
 *                  type: string
 *                password:
 *                  type: string
 *      responses:
 *        200:
 *          description: Đăng nhập thành công
 *        400:
 *          description: Tên đăng nhập và mật khẩu không được để trống
 *        401:
 *          description: Thông tin đăng nhập không hợp lệ
 *        500:
 *          description: Lỗi khi đăng nhập
 */

/**
 * @swagger
 * tags:
 *   name: Users
 *   description: API for managing users
 */

/**
 * @swagger
 * /api/users:
 *   get:
 *     summary: Lấy danh sách người dùng
 *     tags: [Users]
 *     responses:
 *       200:
 *         description: Thành công. Trả về danh sách người dùng.
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                     description: ID của người dùng
 *                   name:
 *                     type: string
 *                     description: Tên người dùng
 *                   email:
 *                     type: string
 *                     description: Email người dùng
 */
