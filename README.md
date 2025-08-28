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
