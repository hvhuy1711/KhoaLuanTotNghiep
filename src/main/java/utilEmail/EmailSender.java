
package utilEmail;
import java.util.Date;
import java.util.Properties;
//import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import consts.constClass;

public class EmailSender {

   

    public static boolean sendEmailtest(String code, String email) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(constClass.from, constClass.password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(constClass.from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
            msg.setSubject("Check");
            msg.setSentDate(new Date());
            String link = "Chào bạn mã kích hoạt tài khoản của bạn là:  " + code;
            msg.setContent(link, "text/HTML; charset=UTF-8");
            Transport.send(msg);
//            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
//            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

}
