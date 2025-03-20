import 'package:rxdart/rxdart.dart';

void main(List<String> args) async {
  demoPublishSubject();
}

void demoPublishSubject() {
  var subject = PublishSubject<int>();

  // listener lan 1
  subject.listen((value) {
    print(value);
  });

  subject.add(0);
  subject.add(1);
  subject.add(2);

  subject.add(100);

  // listener lan 2
  subject.listen((value) {
    print("SECOND >>>> $value");
  });

  subject.add(3);
  subject.add(4);
  subject.add(5);
  subject.add(6);

  // Các sự kiện vẫn tiếp tục chạy trong event loop, dẫn đến thứ tự output khác biệt
}

// PublishSubject thuộc thư viện RxDart và hoạt động tương tự như StreamController.broadcast().
// PublishSubject Không nhận được giá trị cũ, chỉ nhận giá trị mới, nghĩa là subscriber mới chỉ nhận được các giá trị được phát sau thời điểm nó đăng ký.
// Khi một subscriber mới đăng ký, nó sẽ không nhận được giá trị nào đã phát trước đó.