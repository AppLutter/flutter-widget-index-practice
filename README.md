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

AlignAlign
- 플래그 값 또는 지정된 값에 따라 Align이 변화할 때 애니메이션을 넣어주는 위젯

AnimatedBuilder
- animation을 적용할 수 있는 부분을 생성하는 빌더 위젯

AnimatedContainer
- Container의 요소들이 변화 할 때 애니메이션이 적용되는 컨테이너

AnimatedCrossFade
- 두 위젯을 번갈아가면서 FadeOut, FadeIn 할 수 있는 위젯

AnimatedDefaultTextStyle
- 기본 텍스트 스타일이 변화할 때 애니메이션이 적용되는 위젯

AnimatedList + AnimatedListState
- 요소 추가 삭제에 애니메이션이 적용되는 위젯

AnimatedModalBarrier
- 뒤에 요소와 상호작용 할 수 없게 하고 나아가 해당 위젯 선택시 pop까지 시켜버릴 수 있는 위젯

AnimatedOpacity
- 투명도가 시간에 따라 점점 변하는 위젯

AnimatedPhysicalModel
- 위젯이 떠있는 듯 하게 보이도록 elevation 효과를 시간에 따라 다르게 주는 위젯


Text
- 단일 스타일 텍스트
- 여러 줄에 끊어지거나 모두 같은 줄에 표시될 수 있음