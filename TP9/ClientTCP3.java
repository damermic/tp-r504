import java.io.*;
import java.net.*;

public class ClientTCP3
{
	public static void main( String args[] )
	{
		try{
            Socket socket = new Socket("127.0.0.1", 1234);

            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
			DataInputStream dIn = new DataInputStream(socket.getInputStream());
            dOut.writeUTF(args[0]);
            System.out.println("Message envoyé au serveur.");
			
			String response = dIn.readUTF();
            System.out.println("Réponse : " + response);
            dOut.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
