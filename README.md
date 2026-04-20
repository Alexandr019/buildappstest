# buildappstest

Flutter-застосунок зі списком постів, екраном деталей, завантаженням даних з API та станами loading/success/error.

## Вимоги

- Flutter `3.41.7`
- Dart SDK `3.11.5`

## Запуск проєкту

### 1) Перевірка версії Flutter

```powershell
flutter --version
```

### 2) Встановлення залежностей

```powershell
flutter pub get
```

### 3) Генерація коду (build_runner)

Проєкт використовує code generation для:
- Dependency Injection (`injectable_generator`)
- Typed routing (`go_router_builder`)
- Доступу до assets/fonts (`flutter_gen_runner`)

Генерація один раз:

```powershell
dart run build_runner build --delete-conflicting-outputs
```

Режим відстеження змін (watch):

```powershell
dart run build_runner watch --delete-conflicting-outputs
```

### 4) Запуск застосунку

```powershell
flutter run
```

## Використані технології

- Flutter, Dart
- Керування станом BLoC/Cubit (`flutter_bloc`)
- Dependency Injection (`get_it`, `injectable`)
- Маршрутизація (`go_router`)
- Мережевий шар (`dio`)
- Логування (`logger`)
- Генерація коду (`build_runner`, `injectable_generator`, `go_router_builder`, `flutter_gen_runner`)

## Основні пакети

- `flutter_bloc`
- `get_it`
- `injectable`
- `go_router`
- `dio`
- `equatable`
- `logger`
- `flutter_gen`

## Project Structure

```text
lib/
├── main.dart                  # Точка входу застосунку
├── bootstrap.dart             # Ініціалізація застосунку та DI
├── application.dart           # Кореневий MaterialApp.router
├── common/                    # Спільні модулі
│   ├── constant/              # Кольори, стилі тексту, конфіг
│   ├── gen/                   # Згенеровані файли (fonts/assets)
│   ├── injection/             # Dependency Injection (GetIt + Injectable)
│   ├── network/               # API-шар (dio, interceptors, dto, exceptions)
│   │   ├── api/
│   │   ├── dto/
│   │   └── interceptor/
│   ├── repository/            # Репозиторії для доступу до даних
│   ├── router/                # Конфіг GoRouter та згенеровані роути
│   └── widgets/               # Перевикористовувані віджети
└── feature/                   # Фічі/екрани
    ├── home/                  # Екран списку постів
    └── post/                  # Екран деталей поста
```
