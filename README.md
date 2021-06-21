# Swift_AppleMusicStApp

<br>
<p align="center">
<img width="300px" src="https://user-images.githubusercontent.com/50114556/122710334-01fc2e00-d29b-11eb-9124-44831fa4a338.gif"/>
</p>
<br>

## 코드 회고 (Clone Coding)
 - CollectionView에서 HeaderView도 구성하여 오늘의 트랙을 보여주도록 제작
 - HeaderView에 보일 오늘의 트랙을 랜덤으로 뽑아오는 메소드 구현
 - AVFoundation을 사용하여 TrackManager를 구성, 곡의 상세정보를 불러오도록 함 : 트랙을 로드하는 함수와, 인덱스에 맞게 트랙 로드 함수, 앨범 로딩 메소드를 구현
 - SimplePlayer라는 클래스를 제작하여 플레이화면을 구성, 싱글톤 패턴으로 제작 (중요)
 - 노래가 클릭되면, 플레이어를 띄워주는 인스턴스 구성 : present 사용하여 곡 정보 넘겨줌


#### 싱글톤 패턴이란?
 - 특정 용도로 객체를 하나만 생성하여, 공용으로 사용하고 싶을 때 사용하는 디자인 유형
 - SimplePlayer에서 현재 재생 시간, 남은 재생시간, 현재 재생중 확인, 현재 트랙 구하기, 재생, 일시정지, Seek, 다른 트랙으로 변경 메소드 구현


## Developer
<table>
    <tr>
        <td align="center" width="135px">
            <a href="https://github.com/97tuna"><img height="100px" width="100px" src="https://avatars3.githubusercontent.com/u/50114556?s=400&v=4"></img></a><br />
            <sub> <b> 97tuna </b> </sub>
        </td>
    </tr>
</table>