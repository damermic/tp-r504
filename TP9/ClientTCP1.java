import java.io.*;
import java.net.*;

public class ClientTCP1
{
	public static void main( String args[] )
	{
		try{
            Socket socket = new Socket("127.0.0.1", 1234);
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
            dOut.writeUTF("Hello World");
            System.out.println("Message envoyé au serveur.");
            dOut.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
