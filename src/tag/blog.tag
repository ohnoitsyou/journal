<blog>
    <div>
        <div class="j_blog_post_content">
            <div if={author.httpAvatarUrl} class="j_user_avatar_container">
                <img class="j_user_avatar" src={author.httpAvatarUrl}/>
            </div>
            <raw content={html}/>
            <div class="j_blog_footer">
                <span title={"Seen by " + seenBy}>
                    <i class="fa fa-eye" aria-hidden="true"></i> {seenBy}
                </span>
                <button title={comments.length + " comments"} onClick={doToggleComments} >
                    <i class="fa fa-comments-o" aria-hidden="true"></i> {comments.length}
                </button>
		        <button if={isMine} onClick={deleteEntry} title="Delete post">
		            <i class="fa fa-trash" aria-hidden="true"></i>
		        </button>
                <span class="j_blog_post_written_by">written by <strong>{author.name}</strong> on {datetime}</span>
            </div>
        </div>
        <div each={comments} if={showComments} style="padding-left: 50px">
            <comment
                content={content}
                mine={isMine}
                delete={deleteEntry}
                sender={sender}
                author={author}
                datetime={datetime}
            />
        </div>
        <div if={showComments}>
            <input type="text" name="comment_text"/>
            <button onClick={comment} title="Post comment">
                <i class="fa fa-comment-o" aria-hidden="true"></i>
            </button>
        </div>
    </div>
    <script>
        this.showComments = false;

        doToggleComments(e) {
            e.preventDefault();
            this.showComments = !this.showComments;
        }
    </script>
</blog>
