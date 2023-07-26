import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/data/model/post/comment/replies_model.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

class TestCommentData{
  List<CommentModel> data1 = [
    const CommentModel(
      commentId: 1,
      content: "이문세의 붉은 노을",
      userInfo: UserInfoModel(
        userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
        userName: "hamilton",
        userId: ""
      ),
      commentTime: "지금",
      likes: 11,
      liked: false,
      replies: [
        RepliesModel(
          content: "정말 좋네요",
          repliesId: 1,
          commentTime: "지금",
            userInfo: UserInfoModel(
                userProfile: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
                userName: "moon",
                userId: ""
            ),
          liked: false,
          likes: 0
        ),
        RepliesModel(
            repliesId: 2,
            content: "헉 대박 쩔어",
            commentTime: "지금",
            userInfo: UserInfoModel(
                userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
                userName: "hamilton",
                userId: ""
            ),
            liked: false,
            likes: 0
        ),
      ],
      totalReplies: 2
    ),
    const CommentModel(
        commentId: 2,
        content: "d&f liveration",
        userInfo: UserInfoModel(
            userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
            userName: "hamilton",
            userId: ""
        ),
        commentTime: "지금",
        likes: 11,
        liked: false,
        replies: [
          RepliesModel(
              content: "정말 좋네요",
              repliesId: 1,
              commentTime: "지금",
              userInfo: UserInfoModel(
                  userProfile: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
                  userName: "hamilton",
                  userId: ""
              ),
              liked: false,
              likes: 0
          ),
          RepliesModel(
              repliesId: 2,
              content: "헉 대박 쩔어",
              commentTime: "지금",
              userInfo: UserInfoModel(
                  userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
                  userName: "hamilton",
                  userId: ""
              ),
              liked: false,
              likes: 0
          ),
          RepliesModel(
              repliesId: 2,
              content: "감동이에요",
              commentTime: "지금",
              userInfo: UserInfoModel(
                  userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
                  userName: "hamilton",
                  userId: ""
              ),
              liked: false,
              likes: 0
          ),
        ],
        totalReplies: 2
    ),
    const CommentModel(
        commentId: 3,
        content: "김광석의 서른 쯔음에",
        userInfo: UserInfoModel(
            userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
            userName: "hamilton",
            userId: ""
        ),
        commentTime: "지금",
        likes: 11,
        liked: false,
        replies: [

        ],
        totalReplies: 0
    ),
    const CommentModel(
        commentId: 4,
        content: "헤응?",
        userInfo: UserInfoModel(
            userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
            userName: "hamilton",
            userId: ""
        ),
        commentTime: "지금",
        likes: 11,
        liked: false,
        replies: [
          RepliesModel(
              content: "정말 좋네요",
              repliesId: 1,
              commentTime: "지금",
              userInfo: UserInfoModel(
                  userProfile: "https://media.licdn.com/dms/image/C5603AQFnw3jPDEQ0GA/profile-displayphoto-shrink_100_100/0/1652049920739?e=1695254400&v=beta&t=VgqPMeTqrUhHPr12zp6WJ1lqLtQt4hNaHKir_Erg4tQ",
                  userName: "hamilton",
                  userId: ""
              ),
              liked: false,
              likes: 0
          ),
          RepliesModel(
              repliesId: 2,
              content: "헉 대박 쩔어",
              commentTime: "지금",
              userInfo: UserInfoModel(
                  userProfile: "https://media.licdn.com/dms/image/C4D03AQGMWViv6xuHnQ/profile-displayphoto-shrink_100_100/0/1653876350950?e=1695254400&v=beta&t=rLm1u-qNKA_cD6yh3K4p5bB3GfR4oPJBgJW4Fs-B4UE",
                  userName: "hamilton",
                  userId: ""
              ),
              liked: false,
              likes: 0
          ),
        ],
        totalReplies: 2
    )
  ];
}