# Ürün Takip (Spring Boot + jQuery, MySQL)

- **Sunucu:** Spring Boot 3.3.x (REST API)
- **Ön yüz:** Bootstrap 5 + jQuery (statik, *JSP/Thymeleaf yok*)
- **Kimlik Doğrulama:** JWT (Bearer) — Varsayılan kullanıcı: **admin / admin123**
- **Veritabanı:** MySQL (`inventorydb`) — `spring.jpa.hibernate.ddl-auto=update`

## Kurulum

1) `application.properties` içinde MySQL kullanıcı/parola ayarla (varsayılan: root / boş)

```
spring.datasource.url=jdbc:mysql://localhost:3306/inventorydb?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=utf8&serverTimezone=Europe/Istanbul
spring.datasource.username=root
spring.datasource.password=
```

2) Projeyi derle ve çalıştır:

```bash
mvn spring-boot:run
# veya
mvn clean package && java -jar target/inventory-app-1.0.0.jar
```

3) Tarayıcıda `http://localhost:8080/` adresine git. Sağ üstten **Giriş** yap ve modülleri kullan.

## API Özetleri

- `/auth/login` — POST `{{ "username","password" }}` → `{{ "token", "username", "roles" }}`
- `/api/categories` — CRUD
- `/api/products` — CRUD (kategori ile ilişkilidir)
- `/api/warehouses` — CRUD
- `/api/stocks` — GET (stok listeleme)
- `/api/movements` — POST (IN/OUT), GET (tüm hareketler)
- `/api/suppliers` — CRUD
- `/api/customers` — CRUD

> Stoklar **yalnızca** `/api/movements` ile değişir. OUT işleminde miktar yetersizse hata döner.

## Notlar

- JWT gizli anahtarını `application.properties` dosyasında değiştirin: `app.jwt.secret=...`
- Tarafınızdan ek alanlar/raporlar kolayca eklenebilir.
- Lombok kullanıldığı için IDE eklentisi önerilir.





# Ürün Takip Sistemi (Spring Boot + jQuery + MySQL)

Bu proje, ürünlerin, depoların ve stok hareketlerinin yönetildiği bir **stok & ticari takip sistemi**dir.  
Arka planda **Spring Boot (REST API)**, ön tarafta **Bootstrap 5 + jQuery (AJAX)** kullanılmıştır.  
Kimlik doğrulama için **JWT (Bearer Token)** uygulanmıştır.  

---

## 🚀 Özellikler
- Kullanıcı girişi (JWT token tabanlı güvenlik)
- Ürün ve kategori yönetimi
- Depo yönetimi
- Stok durumlarının takibi
- Stok giriş/çıkış (hareket kayıtları)
- Tedarikçi & müşteri yönetimi
- Kullanıcıya göre hareket kaydı

---

## 🗄️ Veritabanı Tasarımı

### 1. **users (Kullanıcılar)**
| Alan          | Açıklama |
|---------------|----------|
| `id` (PK)     | Kullanıcı ID |
| `username`    | Kullanıcı adı (unique) |
| `password`    | Şifre (BCrypt) |
| `roles`       | Roller (`ROLE_ADMIN`, `ROLE_USER`) |
| `created_at`  | Oluşturulma zamanı |

🔗 **İlişki:** `users.id` → `stock_movements.user_id` (hangi kullanıcı hareket yaptı)

---

### 2. **categories (Kategoriler)**
| Alan          | Açıklama |
|---------------|----------|
| `id` (PK)     | Kategori ID |
| `name`        | Kategori adı |
| `description` | Açıklama |

🔗 **İlişki:** `categories.id` → `products.category_id`

---

### 3. **products (Ürünler)**
| Alan              | Açıklama |
|-------------------|----------|
| `id` (PK)         | Ürün ID |
| `product_code`    | Ürün kodu (unique) |
| `name`            | Ürün adı |
| `description`     | Açıklama |
| `category_id` (FK)| Kategori bağlantısı |
| `unit`            | Birim (adet, kg, litre) |
| `created_at`      | Oluşturulma tarihi |

🔗 **İlişki:**  
- `products.category_id` → `categories.id`  
- `products.id` → `stocks.product_id`  
- `products.id` → `stock_movements.product_id`

---

### 4. **warehouses (Depolar)**
| Alan          | Açıklama |
|---------------|----------|
| `id` (PK)     | Depo ID |
| `name`        | Depo adı |
| `location`    | Depo lokasyonu |

🔗 **İlişki:**  
- `warehouses.id` → `stocks.warehouse_id`  
- `warehouses.id` → `stock_movements.warehouse_id`

---

### 5. **stocks (Stoklar)**
| Alan             | Açıklama |
|------------------|----------|
| `id` (PK)        | Stok ID |
| `product_id` (FK)| Hangi ürün |
| `warehouse_id`(FK)| Hangi depoda |
| `quantity`       | Miktar |

📝 Not: `product_id + warehouse_id` **benzersiz**dir. Yani her depo–ürün çifti için tek stok kaydı vardır.  

---

### 6. **stock_movements (Stok Hareketleri)**
| Alan             | Açıklama |
|------------------|----------|
| `id` (PK)        | Hareket ID |
| `product_id` (FK)| Ürün |
| `warehouse_id`(FK)| Depo |
| `movement_type`  | Giriş (IN) veya Çıkış (OUT) |
| `quantity`       | Miktar |
| `unit_price`     | Birim fiyat |
| `movement_date`  | İşlem tarihi |
| `user_id` (FK)   | İşlemi yapan kullanıcı |
| `note`           | Açıklama |

🔗 **İlişki:**  
- `stock_movements.product_id` → `products.id`  
- `stock_movements.warehouse_id` → `warehouses.id`  
- `stock_movements.user_id` → `users.id`  

📌 **Not:**  
- IN → stok artırır  
- OUT → stok düşürür (yetersiz stok varsa hata verir)

---

### 7. **suppliers (Tedarikçiler)**
| Alan          | Açıklama |
|---------------|----------|
| `id` (PK)     | Tedarikçi ID |
| `name`        | Ad |
| `phone`       | Telefon |
| `email`       | E-posta |
| `address`     | Adres |

---

### 8. **customers (Müşteriler)**
| Alan          | Açıklama |
|---------------|----------|
| `id` (PK)     | Müşteri ID |
| `name`        | Ad |
| `phone`       | Telefon |
| `email`       | E-posta |
| `address`     | Adres |

---

## 🔗 Tablolar Arası İlişkiler (Özet)

- **categories 1 → n products**  
- **products 1 → n stocks**  
- **warehouses 1 → n stocks**  
- **products 1 → n stock_movements**  
- **warehouses 1 → n stock_movements**  
- **users 1 → n stock_movements**

---

## 🛠️ Kurulum

1. MySQL’de veritabanı ayarını yap (`application.properties`):
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/inventorydb?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=utf8&serverTimezone=Europe/Istanbul
   spring.datasource.username=root
   spring.datasource.password=
