#  Итоговый прокт Рамазановой Раисат школы IOS 2021  
 
## Тема
  Темой для проекта стал **Интернет-магазин**
 
## Почему выбрано данное приложение? 
  Я решила реализовать именно интернет-магазин, тк функционал данного приложения является очень популярным.
  
  Многие бренды стараются создать свое приложение с личным кабинетом, каталогом услуг и корзиной 
  
## Что реализовано в проекте?
- Core Data для хранения моделей данных
- KeyChain и UserDefaults для пользовательских настроек
- Swift styleguides (Google styleguides)
- Не использовать сторонние библиотеки (кроме snapshot-тестов и Swiftlint)
- Использовать сеть
- Отображение медиа (аудио, видео, изображения) из сети
- Количество экранов: 
  - 6
- UINavigationController и TabBarController
- UIAlertController и UIActivityIndicatorView
- Модульные тесты
- UI-тест через page object
- Snapshot тест для iPhone SE 
- архитектура 
  - MVC + MVVM (расскажу подробнее дальше)
- Верстка UI в коде
- UITableView и UICollectionView
- Кастомные анимации
- Swiftlint

## Логика приложения и экранов 
Вся история начинается с TabBar с 3-мя табами

### При запуске приложения мы попадаем сразу в **каталог** 

<img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.33.27.jpeg?token=APSVBYGGM3J7EO37PLE6P7TBIZWNY" width="200" />

В каталоге работает поиск по брендам и типам вещей 

<img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.34.10.jpeg" width="200" />

### Второй экран - это **вход в личный кабинет**
 
 <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.34.03.jpeg?token=APSVBYEOVHZN36ZFK42PS63BIZWUU" width="200" />
 
Из экрана входа в личного кабинет можно перейти на **экран регистрации** или на экран самого **личного кабинета**
 
<img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.33.49.jpeg?token=APSVBYF77T75ZUHI4EVZGFDBIZWSS" width="200" />  <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.34.00.jpeg?token=APSVBYCGX3VUXKGXTXI2LHLBIZWHI" width="200" />
 
### Третий экран - это **корзина**
В ней можно удалять одежду по 1 шт или всю сразу 

 <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.33.53.jpeg?token=APSVBYCRVRLHVULCN2EXFPTBIZV3Q" width="200" />  <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.33.58.jpeg?token=APSVBYFHBZ67D7IVEQJ37I3BIZXAE" width="200" /> <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.33.56.jpeg?token=APSVBYFRJEM7ZUNOA5Q24XLBIZXDK" width="200" />

### Нажав на одну вещь в каталоге или корзине открывается детальный экран, который скролится 

<img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.34.07.jpeg" width="200" />  <img src="https://raw.githubusercontent.com/RaisaRamazanova/Homework/main/photo_2021-09-19%2001.34.05.jpeg" width="200" />
