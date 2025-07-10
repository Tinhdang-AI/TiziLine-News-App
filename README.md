# Weather Forecast App

📱**Introduce**

TiziLine News is a sleek, user-friendly mobile news application that delivers trending and hot news across various categories in a modern and visually appealing interface.

✨**Features**

**Hottest News Section:** Displays the most talked-about news stories with engaging thumbnails.

**Explore Categories:** Users can easily browse content by topics such as: Entertainment,Sports, Technology,..

**Trending News Feed:** Recaps the most popular stories to ensure users don’t miss any important updates.


📲 **Installation instructions**

 - Make sure you have installed Flutter SDK
   - Clone repository:  
    git clone https://github.com/Tinhdang-AI/TiziLine-News-App.git
   - Move to project folder:  
    cd news_app
   - Install dependencies:  
    flutter pub get
   - Run app:  
    flutter run


📱 **Application interface**
<p align="center">
  <img src="https://github.com/user-attachments/assets/f8037a0f-f6e8-4293-9cb7-807758211dce" alt="splash" width="30%"/>
  <img src="https://github.com/user-attachments/assets/7e382a1e-db44-4a71-b66e-82e9a34fb4be" alt="home" width="30%"/>
  <img src="https://github.com/user-attachments/assets/2ac82814-1b7f-4113-9513-9c092233e967" alt="Entertaiment" width="30%"/>
  <img src="https://github.com/user-attachments/assets/2e0d6335-0db9-4c1c-8956-90b60007cf07" alt="business" width="30%"/>
  <img src="https://github.com/user-attachments/assets/bdd971d4-57cf-42a6-9f34-fb6996d82cf6" alt="Science" width="30%"/>
  <img src="https://github.com/user-attachments/assets/e378fd5d-d9bf-4b18-abc0-f12901fb11ef" alt="Sports" width="30%"/>
  <img src="https://github.com/user-attachments/assets/246adaf3-c9d8-4077-81ca-df28d3f999a7" alt="Technology" width="30%"/>
</p>

🛠️ **Technology**
- **Framework**: Flutter
- **Ngôn ngữ**: Dart
- **UI Components**: Material Design

📲 **Installation instructions**

```
lib/
├── models/                         # Mô hình dữ liệu (Data Models)
│   ├── article_model.dart              # Model cho bài viết
│   ├── category_model.dart             # Model cho danh mục
│   └── show_category.dart              # Model phụ cho hiển thị danh mục
│
├── pages/                          # Giao diện người dùng (UI Screens)
│   ├── article_view.dart               # Trang hiển thị bài viết
│   ├── category_news.dart              # Trang danh sách tin theo danh mục
│   ├── home.dart                       # Màn hình chính
│   └── onboarding.dart                 # Màn hình giới thiệu khi mở app lần đầu
│
├── services/                       # Xử lý dữ liệu, API, logic dịch vụ
│   ├── data.dart                       # Xử lý dữ liệu nội bộ (tĩnh hoặc giả lập)
│   ├── news.dart                       # Dịch vụ gọi tin tức
│   └── show_category_news.dart         # Dịch vụ lấy tin theo danh mục hiển thị
│
└── main.dart                      # Điểm khởi đầu ứng dụng Flutter

```

