import 'package:nuri/data/model/profile/profile_model.dart';

class TestProfileData{
  // data hamilton
  ProfileModel data1 = const ProfileModel(
      userName: 'hamilton',
      userProfile: 'https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE',
      introduce: 'hello my name is hamilton nice to meet you',
      bestTravel: 'TOKYO',
      postAmount: 1,
      flower: 999,
      flowing: 999,
      posts: [
        PostGrid(
            postId: 1,
            firstImage: "https://picsum.photos/250?image=1"
        ),
        PostGrid(
            postId: 2,
            firstImage: "https://picsum.photos/250?image=2"
        ),
        PostGrid(
            postId: 3,
            firstImage: "https://picsum.photos/250?image=3"
        ),
        PostGrid(
            postId: 4,
            firstImage: "https://picsum.photos/250?image=4"
        ),
        PostGrid(
            postId: 5,
            firstImage: "https://picsum.photos/250?image=5"
        ),
        PostGrid(
            postId: 6,
            firstImage: "https://picsum.photos/250?image=6"
        ),
        PostGrid(
            postId: 7,
            firstImage: "https://picsum.photos/250?image=7"
        ),
        PostGrid(
            postId: 8,
            firstImage: "https://picsum.photos/250?image=8"
        ),
        PostGrid(
            postId: 9,
            firstImage: "https://picsum.photos/250?image=9"
        ),
        PostGrid(
            postId: 10,
            firstImage: "https://picsum.photos/250?image=10"
        ),
        PostGrid(
            postId: 11,
            firstImage: "https://picsum.photos/250?image=11"
        ),
        PostGrid(
            postId: 12,
            firstImage: "https://picsum.photos/250?image=12"
        ),
        PostGrid(
            postId: 13,
            firstImage: "https://picsum.photos/250?image=13"
        ),
        PostGrid(
            postId: 14,
            firstImage: "https://picsum.photos/250?image=14"
        ),PostGrid(
            postId: 15,
            firstImage: "https://picsum.photos/250?image=15"
        ),
        PostGrid(
            postId: 16,
            firstImage: "https://picsum.photos/250?image=16"
        )
      ]
  );
  //data moon
  ProfileModel data2 = const ProfileModel(
      userName: 'Moon',
      userProfile: null,
      introduce: 'im backend developer in nuri',
      bestTravel: 'JEJU Island',
      postAmount: 0,
      flower: 0,
      flowing: 0,
      posts: []
  );
  // data x
  ProfileModel data3 = const ProfileModel(
      userName: '',
      userProfile: null,
      introduce: '',
      bestTravel: '',
      postAmount: 0,
      flower: 0,
      flowing: 0,
      posts: []
  );
}