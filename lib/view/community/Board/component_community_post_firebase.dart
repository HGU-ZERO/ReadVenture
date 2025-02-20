import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../theme/font.dart';
import '../../../theme/theme.dart';
import 'Component/postHeader.dart';
import 'Component/postaction_bottomsheet.dart';
import 'Component/postfooter.dart';
import 'posting_detail_page.dart';
import 'community_data_firebase.dart';

/// 게시물 아이템을 표시하는 위젯
/// [post]: 게시물 데이터
/// [customColors]: 커스터마이즈된 색상 정보
/// [parentContext]: 부모 위젯의 컨텍스트 (필요시 사용)
class PostItemContainer extends StatelessWidget {
  final Post post;
  final CustomColors customColors;
  final BuildContext parentContext;

  const PostItemContainer({
    Key? key,
    required this.post,
    required this.customColors,
    required this.parentContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () {
        // 게시물 클릭 시 상세 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(post: post),
          ),
        );
      },
      child: Container(
        color: customColors.neutral100,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: 게시물 태그와 작성 일자 표시
            PostHeader(post: post, customColors: customColors),
            const SizedBox(height: 8),
            // 제목과 내가 쓴 게시물인 경우 more_vert 아이콘을 추가
            Row(
              children: [
                Expanded(
                  child: Text(
                    post.title,
                    style: body_small_semi(context),
                  ),
                ),
                // 내가 쓴 게시물인 경우 more_vert 아이콘 표시
                if (currentUser != null && post.authorId == currentUser.uid)
                  IconButton(
                    icon: Icon(Icons.more_vert_rounded, color: customColors.neutral80),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      // more_vert 아이콘 클릭 시 하단 시트 표시
                      showPostActionBottomSheet(context, post, customColors, parentContext);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // 게시물 내용 (2줄까지만 표시)
            Text(
              post.content,
              style: body_xsmall(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Footer: 게시물 작성자, 좋아요, 조회수 표시
            PostFooter(post: post, customColors: customColors),
          ],
        ),
      ),
    );
  }

  /// 게시물에 대한 액션을 보여주는 하단 시트를 표시하는 함수
  void showPostActionBottomSheet(BuildContext context, Post post, CustomColors customColors, BuildContext parentContext) {
    showModalBottomSheet(
      context: context,
      builder: (context) => PostActionBottomSheet(
        post: post,
        customColors: customColors,
        parentContext: parentContext,
      ),
    );
  }
}

/// 게시물 작성 시간을 포맷하는 함수
/// [createdAt]: 게시물 작성 일자
String formatPostDate(DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);

  if (difference.inMinutes < 1) {
    return "방금 전"; // 1분 미만
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes}분 전"; // 1시간 미만
  } else if (difference.inHours < 24) {
    return "${(difference.inMinutes / 60).ceil()}시간 전"; // 24시간 미만
  } else if (difference.inDays <= 3) { // 3일 이내
    return "${difference.inDays}일 전";
  } else { // 3일 초과
    // yyyy.MM.dd 형식으로 반환
    return "${createdAt.year}.${createdAt.month.toString().padLeft(2, '0')}.${createdAt.day.toString().padLeft(2, '0')}";
  }
}
