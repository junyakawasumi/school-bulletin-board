package validators;

import java.util.ArrayList;
import java.util.List;

import models.Message;

public class MessageValidator {
    public static List<String> validate(Message m) {
        //エラーを格納するリスト(String型)を作成
        List<String> errors = new ArrayList<String>();

        //_validateTitleメソッドの結果を変数title_errorに格納
        //エラーがあればリストに格納
        String title_error = _validateTitle(m.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }

        //_validateTitleメソッドの結果を変数Content_errorに格納
        //エラーがあればリストに格納
        String content_error = _validateContent(m.getContent());
        if(!content_error.equals("")) {
            errors.add(content_error);
        }

        return errors;
    }

    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
            }

        return "";
    }

    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "内容を入力してください。";
            }

        return "";
    }
}
