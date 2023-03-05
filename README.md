이 프로젝트에서 사용한 위젯

AbsorbPointer
- 현재 감싼 위젯이 화면에 차지하는 구역만큼 터치 이벤트를 무시한다
- 다른 위젯이라도 Stack 등으로 겹쳐 있는 상태라면 가려진 만큼은 터치를 할 수 없다.

IgnorePointer
- 현재 감싼 위젯의 하위 위젯들의 터치 이벤트를 무시한다.

AlertDialog
- 확인이 필요한 상황에 대해 사용자에게 알림
- 컨텐츠가 너무 커서 화면에 맞지 않는 경우에는 SingleChildScrollView와 같은 content(프로퍼티 중 하나) 스크롤 위젯을 쓰는 것이 좋다
- 단 ListView, GridView, CustomScrollView와 같은 위젯은 작동하지 않는다.
- 만약 위와 같은 위젯을 쓰려면 Dialog 위젯을 사용하자
- 사용자에게 여러 옵션 중 선택할 수 있는 대화 상자의 경우 SimpleDialog를 사용하자

Align
- 자체 내에서 자식을 정렬하고 선택적으로 자식 크기에 따라 자체 크기를 조정하는 위젯