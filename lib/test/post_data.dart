import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

class TestPostData{
  List<PostModel> data1 = [
    const PostModel(
    postId: 1,
    title: "develop travel",
    content: " how to make nuri",
    shortory: [
      ShortoryModel(
        url: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
        content: "this is mu pickture"
      ),
      ShortoryModel(
          url: "https://media.licdn.com/dms/image/C5603AQEhKKAy1Ij9xQ/profile-displayphoto-shrink_100_100/0/1639652531388?e=1695254400&v=beta&t=DY39uRxe6FR_IuJlFVJ5axN2D3x3O3rYOdqF46GKo74",
          content: "hello jaewon"
      ),
      ShortoryModel(
          url: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
          content: "hello seojun"
      ),
      ShortoryModel(
          url: "https://media.licdn.com/dms/image/D5603AQEBKsHKr9dzAA/profile-displayphoto-shrink_100_100/0/1677758165535?e=1695254400&v=beta&t=uQEOJS_Ryn9JnqO8IxupMmpr4Ij9qUETjUiVzrnX1SQ",
          content: "hello byeong hun"
      ),
      ShortoryModel(
          url: "https://media.licdn.com/dms/image/C4E03AQGgQ9KyjLCn4A/profile-displayphoto-shrink_100_100/0/1639629727662?e=1695254400&v=beta&t=jYB_u_9gmY0GalF2FfjN9TrztDQd2g-9AQ6oQk9A-oE",
          content: "hello sang woo"
      ),


    ],
    userInfo: UserInfoModel(
      userId: 0,
      userName: "hamilton",
      userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
    ),
    liked: true,
    likes: 11
  ),
    const PostModel(
        postId: 2,
        title: "develop travel",
        content: " how to make nuri server",
        shortory: [
          ShortoryModel(
              url: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
              content: "this is mu pickture"
          ),
          ShortoryModel(
              url: "https://media.licdn.com/dms/image/C5603AQEhKKAy1Ij9xQ/profile-displayphoto-shrink_100_100/0/1639652531388?e=1695254400&v=beta&t=DY39uRxe6FR_IuJlFVJ5axN2D3x3O3rYOdqF46GKo74",
              content: "hello jaewon"
          ),
          ShortoryModel(
              url: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
              content: "hello seojun"
          ),
          ShortoryModel(
              url: "https://media.licdn.com/dms/image/D5603AQEBKsHKr9dzAA/profile-displayphoto-shrink_100_100/0/1677758165535?e=1695254400&v=beta&t=uQEOJS_Ryn9JnqO8IxupMmpr4Ij9qUETjUiVzrnX1SQ",
              content: "hello byeong hun"
          ),
          ShortoryModel(
              url: "https://media.licdn.com/dms/image/C4E03AQGgQ9KyjLCn4A/profile-displayphoto-shrink_100_100/0/1639629727662?e=1695254400&v=beta&t=jYB_u_9gmY0GalF2FfjN9TrztDQd2g-9AQ6oQk9A-oE",
              content: "hello sang woo"
          ),


        ],
        userInfo: UserInfoModel(
          userId: 1,
          userName: "Moon",
          userProfile: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
        ),
        liked: true,
        likes: 11
    ),
  ];
}