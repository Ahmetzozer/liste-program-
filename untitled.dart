import 'dart:io';

// Todo class: Her bir görev için bir model
class Todo {
  String task;
  bool isCompleted;

  Todo({
    required this.task,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return '[${isCompleted ? '✓' : ' '}] $task'; // Yeni bir string ifade return ederek tik ekleyen kısım
  }
}

class TodoListApp {
  List<Todo> todos = [];

  // Yeni görev eklemek için olan kısım
  void addTask(String task) {
    todos.add(Todo(task: task));
    print('Görev eklendi: "$task"');
  }

  // Görev silmek için
  void removeTask(int index) {
    if (index >= 0 && index < todos.length) {
      print('Görev silindi: "${todos[index].task}"');
      todos.removeAt(index); // remove işlemi
    } else {
      print('Geçersiz görev numarası.');
    }
  }

  // Görevleri listelemek için
  void listTasks() {
    if (todos.isEmpty) {
      print('Yapılacak görev yok.');
    } else {
      print('\nYapılacaklar Listesi:');
      for (int i = 0; i < todos.length; i++) {
        print('${i + 1}. ${todos[i]}');
      }
    }
  }

  // Görev tiklemek için olan kısım
  void completeTask(int index) {
    if (index >= 0 && index < todos.length) {
      todos[index].isCompleted = true;
      print('Görev tamamlandı: "${todos[index].task}"');
    } else {
      print('Geçersiz görev numarası.');
    }
  }

  // Menüye ait işlemler
  void run() {
    while (true) {
      print('\n-- Yapılacaklar Listesi --');
      print('');
      print('1. Yapılacakları Gör');
      print('2. Yeni Yapılacak Ekle');
      print('3. Yapıldı Olarak İşaretle');
      print('4. Sil');
      print('5. Çık');
      print('');
      stdout.write('Seçiminizi yapınız [ 1 | 2 | 3 | 4 | 5 ]: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          listTasks();
          break;
        case '2':
          stdout.write('Yapılacak görevi yazın: ');
          String? task = stdin.readLineSync();
          if (task != null && task.isNotEmpty) {
            addTask(task);
          } else {
            print('Geçersiz görev.');
          }
          break;
        case '3':
          stdout.write('Tamamlanacak numarayı girin: ');
          int? index = int.tryParse(stdin.readLineSync() ?? '');
          if (index != null && index > 0) {
            completeTask(index - 1); // Kullanıcı 1'den başlatır, biz 0'dan
          } else {
            print('Geçersiz numara.');
          }
          break;
        case '4':
          stdout.write('Silinecek numarayı girin: ');
          int? removeIndex = int.tryParse(stdin.readLineSync() ?? '');
          if (removeIndex != null && removeIndex > 0) {
            removeTask(removeIndex - 1); // Kullanıcı 1'den başlatır, biz 0'dan
          } else {
            print('Geçersiz numara.');
          }
          break;
        case '5':
          print('Çıkılıyor...');
          sleep(Duration(
              seconds:
                  2)); // Yapay veri çekme, aktarma veya yükleme için olan kısım
          print("Çıkıldı");
          return;
        default:
          print('Geçersiz seçim, tekrar deneyin.');
      }
    }
  }
}

void main() {
  var app = TodoListApp();
  app.run();
}
