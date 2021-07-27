import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;

public class SecurityUtils {
    /**
     * MD5���ܳ�32λ��д�����Ĵ�
     *
     * @param plainText
     * @return
     */
    public static String MD532BitUp(String plainText) {
        String result = "";
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(plainText.getBytes("UTF-8"));
            byte b[] = md5.digest();
            int i;
            StringBuffer buffer = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buffer.append("0");
                }
                buffer.append(Integer.toHexString(i));
            }
            result = buffer.toString().toUpperCase();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    /**
     * AES����
     *
     * @param plainText
     * @param aesKey
     * @return
     */
    public static byte[] aesEncrypt(String plainText, String aesKey) {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(aesKey.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
            return cipher.doFinal(plainText.getBytes());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * AES����
     *
     * @param cipherText
     * @param aesKey
     * @return
     */
    public static byte[] aesDecrypt(byte[] cipherText, String aesKey) {
        try {
            SecretKeySpec skeySpec = new SecretKeySpec(aesKey.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            return cipher.doFinal(cipherText);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }


    public static String sha256HMAC(String plainText, String secretKey) {
        String result = "";
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
            mac.init(secret_key);
            byte[] bytes = mac.doFinal(plainText.getBytes());
            result = byteArrayToHexString(bytes);
        } catch (Exception e) {
            System.out.println("Error HmacSHA256 ===========" + e.getMessage());
        }
        return result;
    }

    /**
     * �����ܺ���ֽ�����ת�����ַ���
     *
     * @param bytes
     * @return
     */
    private static String byteArrayToHexString(byte[] bytes) {
        StringBuilder hs = new StringBuilder();
        String temp;
        for (int i = 0; bytes != null && i < bytes.length; i++) {
            temp = Integer.toHexString(bytes[i] & 0XFF);
            if (temp.length() == 1)
                hs.append('0');
            hs.append(temp);
        }
        return hs.toString().toLowerCase();
    }
}

