# AIHub Template

AIHub Template là starter theme WordPress (dựa trên Air Light) được tối ưu cho dự án AIHub: không bundle ảnh mẫu, có sẵn luồng build SCSS/JS, linting, hỗ trợ Gutenberg/ACF block.

## Yêu cầu
- WordPress ≥ 6.8, PHP ≥ 8.3 (xem `style.css`).
- Node v20.17.0 (`.nvmrc`), npm, Gulp (chạy qua `npx`), Webpack.
- Composer (dùng cho bộ quy tắc CodeSniffer).
- Domain local cho BrowserSync (mặc định `https://airdev.test`, chỉnh trong `gulp/config.js`).

## Cấu trúc
- `functions.php`: khai báo `THEME_SETTINGS`, menu, post type/taxonomy, cấu hình Gutenberg/ACF block; require hooks tại `inc/`.
- `inc/`: hooks, template tags, helpers.
- `sass/`: SCSS nguồn (`global.scss`, `gutenberg-editor-styles.scss`) tổ chức theo `base/`, `components/`, `layout/`, `features/`, `variables/`...; xuất ra `css/dev` và `css/prod`.
- `js/src/`: entry `front-end.js`, `gutenberg-editor.js` và các module (a11y skip link, anchor smooth scroll, external link indicator, navigation...); build sang `js/dev` (dev) và `js/prod` (prod).
- `template-parts/`, `front-page.php`, `single.php`, `page.php`, `404.php`... theo chuẩn theme.
- `gulp/`: cấu hình BrowserSync, Sass/PostCSS, Webpack, linting, phpcs, watcher; hỗ trợ build block trong `blocks/` nếu có.

## Cài đặt
1) Đặt thư mục theme vào `wp-content/themes/aihub-template` (hoặc tên bạn muốn).  
2) `nvm use` (hoặc cài Node 20.17).  
3) `npm install`  
4) `composer install` (để dùng `phpcs` + WPCS).  
5) Sửa `proxyUrl` trong `gulp/config.js` khớp domain local; nếu dùng HTTPS tự ký, cập nhật đường dẫn cert/key.  
6) (Tùy chọn) `npm run prepare` để bật Husky hooks (`.husky/pre-commit`, `.husky/commit-msg`).

## Quy trình phát triển
- `npx gulp watch`: BrowserSync + auto-reload; biên dịch SCSS (dev & prod), bundle JS (dev & prod), chạy stylelint và phpcs khi file đổi.
- `npx gulp devstyles`: biên dịch SCSS (sourcemap) vào `css/dev/`.
- `npx gulp prodstyles`: biên dịch + nén SCSS vào `css/prod/` (dùng khi build phát hành).
- `npx gulp js`: ESLint rồi bundle JS cho dev (`js/dev/`) và prod (`js/prod/`).
- `npx gulp lintstyles`: stylelint cho toàn bộ SCSS.
- `npx gulp phpcs`: kiểm tra chuẩn mã PHP (WPCS + PHPCompatibility).
- `npx gulp blocks`: build tất cả block trong `blocks/*` (mỗi block cần `package.json` với script `npm run build`).

## Build để đóng gói
1) `npx gulp prodstyles`  
2) `npx gulp js`  
3) Đóng gói PHP + `css/prod` + `js/prod` + assets (fonts, images nếu có); bỏ `node_modules`, `vendor` khi deploy lên server.

## Tùy biến nhanh
- Chỉnh menu, post type/taxonomy, allowed blocks, thiết lập ACF block trong `functions.php` (`THEME_SETTINGS`).
- Sửa palette/typography ở `sass/variables/` và các layer `base/`, `components/`, `layout/`.
- Thêm JS front-end bằng cách tạo module mới trong `js/src/modules/` và import tại `front-end.js`.

## Giấy phép
MIT License © 2025 Phạm Lê Ngọc Sơn.
